package com.nadogam.admin;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nadogam.auth.AppUser;

// 관리자 특별전(이달의 기획전) 관리: 등록·수정·삭제(삭제 탭으로 이동)·복구·영구 삭제.
// 특별전은 여행지 하나에 항공편·좌석 등급별 특가를 묶은 것이다.
@Controller
public class AdminPlanController {

	private static final String BASE = "/admin/plans";
	private static final int LIMIT = 300;
	private static final DateTimeFormatter DAY = DateTimeFormatter.ofPattern("yyyy-MM-dd");

	private final JdbcClient jdbc;
	private final AdminAudit audit;
	private final AdminProductSupport support;
	private final TransactionTemplate tx;

	public AdminPlanController(JdbcClient jdbc, AdminAudit audit, AdminProductSupport support, TransactionTemplate tx) {
		this.jdbc = jdbc;
		this.audit = audit;
		this.support = support;
		this.tx = tx;
	}

	private int count(boolean trash) {
		return jdbc.sql("SELECT COUNT(*) FROM monthly_plan WHERE deleted = " + (trash ? "TRUE" : "FALSE")).query(Integer.class).single();
	}

	@GetMapping(BASE)
	public String list(@RequestParam(defaultValue = "active") String tab, @RequestParam(required = false) String q, Model model) {
		boolean trash = AdminProductSupport.isTrash(tab);
		boolean search = q != null && !q.isBlank();
		var spec = jdbc.sql("""
			SELECT p.plan_id, p.title, p.plan_month, p.start_at, p.end_at, p.is_active, d.name_ko AS dest,
			       (SELECT COUNT(*) FROM monthly_plan_flight m WHERE m.plan_id = p.plan_id) AS deals
			FROM monthly_plan p JOIN destination d ON d.destination_id = p.destination_id
			WHERE p.deleted = %s %s ORDER BY p.plan_id DESC LIMIT %d
			""".formatted(trash ? "TRUE" : "FALSE", search ? "AND (p.title LIKE :q OR d.name_ko LIKE :q)" : "", LIMIT));
		if (search) {
			spec = spec.param("q", "%" + q.trim() + "%");
		}
		List<ProductRow> rows = spec.query().listOfRows().stream().map(raw -> {
			var r = AdminFlightService.ci(raw);
			boolean on = Boolean.TRUE.equals(r.get("is_active"));
			return new ProductRow(((Number) r.get("plan_id")).longValue(), List.of(
				(String) r.get("title"), (String) r.get("dest"), r.get("plan_month").toString(),
				((java.sql.Timestamp) r.get("start_at")).toLocalDateTime().format(DAY) + " ~ " + ((java.sql.Timestamp) r.get("end_at")).toLocalDateTime().format(DAY),
				r.get("deals") + "건"), trash ? "삭제됨" : (on ? "노출 중" : "중지"), on && !trash);
		}).toList();
		support.fillList(model, "plans", "특별전 관리", BASE, tab, q, List.of("제목", "여행지", "기획 월", "기간", "특가 항공편"), rows, count(false), count(true), "특별전 등록");
		return "admin/product-list";
	}

	private String form(Model model, String action, String heading) {
		model.addAttribute("formAction", action);
		model.addAttribute("heading", heading);
		model.addAttribute("destinations", jdbc.sql("SELECT destination_id AS id, name_ko AS name FROM destination ORDER BY name_ko").query().listOfRows());
		model.addAttribute("flights", jdbc.sql("""
			SELECT f.flight_id AS id, f.destination_id AS dest, CONCAT(f.flight_no, ' ', f.origin_airport, '→', f.arrival_airport, ' (', d.name_ko, ')') AS label
			FROM flight f JOIN destination d ON d.destination_id = f.destination_id
			WHERE f.status = 'ON_SALE' ORDER BY d.name_ko, f.flight_no
			""").query().listOfRows());
		model.addAttribute("menu", "plans");
		return "admin/plan-form";
	}

	@GetMapping(BASE + "/new")
	public String newForm(Model model) {
		PlanForm f = new PlanForm();
		java.time.LocalDateTime now = java.time.LocalDateTime.now().withSecond(0).withNano(0);
		f.setPlanMonth(java.time.YearMonth.now().toString());
		f.setStartAt(now);
		f.setEndAt(now.plusDays(30));
		f.getDeals().add(new PlanForm.DealForm());
		model.addAttribute("planForm", f);
		return form(model, BASE, "특별전 등록");
	}

	// 항공편·등급별 정가는 실제 요금(운임+세금)이다. 같은 여행지의 판매 중인 항공편만, 특가는 정가보다 싸야 한다.
	private Map<String, Integer> check(PlanForm f, BindingResult errors) {
		Map<String, Integer> originals = new HashMap<>();
		if (f.getDeals() == null || f.getDeals().isEmpty()) {
			errors.reject("deals", "특가 항공편을 한 줄 이상 넣어 주세요.");
			return originals;
		}
		Set<String> seen = new HashSet<>();
		for (int i = 0; i < f.getDeals().size(); i++) {
			PlanForm.DealForm d = f.getDeals().get(i);
			String at = "deals[" + i + "].";
			if (d.getFlightId() == null || d.getCabin() == null) {
				continue;
			}
			if (!seen.add(d.getFlightId() + ":" + d.getCabin())) {
				errors.rejectValue(at + "flightId", "dup", "같은 항공편·좌석 등급이 두 번 들어 있어요.");
				continue;
			}
			var rows = jdbc.sql("""
				SELECT ff.base_price + ff.tax_fuel AS price, f.destination_id FROM flight f JOIN flight_fare ff ON ff.flight_id = f.flight_id
				WHERE f.flight_id = :id AND ff.cabin_class = :cabin AND f.status = 'ON_SALE'
				""").param("id", d.getFlightId()).param("cabin", d.getCabin()).query().listOfRows();
			if (rows.isEmpty()) {
				errors.rejectValue(at + "flightId", "missing", "판매 중인 항공편이 아니거나 그 좌석 등급의 요금이 없어요.");
				continue;
			}
			var r = AdminFlightService.ci(rows.get(0));
			if (f.getDestinationId() != null && ((Number) r.get("destination_id")).longValue() != f.getDestinationId()) {
				errors.rejectValue(at + "flightId", "dest", "특별전 여행지와 같은 여행지의 항공편만 넣을 수 있어요.");
				continue;
			}
			int original = ((Number) r.get("price")).intValue();
			originals.put(d.getFlightId() + ":" + d.getCabin(), original);
			if (d.getSalePrice() == null || d.getSalePrice() < 10000 || d.getSalePrice() >= original) {
				errors.rejectValue(at + "salePrice", "price", "특가는 10,000원 이상이고 정가(" + AdminProductSupport.won(original) + ")보다 낮아야 해요.");
			}
			if (d.getLimitedSeats() == null || d.getLimitedSeats() < 1 || d.getLimitedSeats() > 1000) {
				errors.rejectValue(at + "limitedSeats", "seats", "한정 좌석은 1~1,000석이에요.");
			}
		}
		return originals;
	}

	private long insertPlan(PlanForm f) {
		var keys = new GeneratedKeyHolder();
		jdbc.sql("""
			INSERT INTO monthly_plan (plan_month, destination_id, title, subtitle, badge_text, highlights, start_at, end_at, is_active, deleted)
			VALUES (:month, :dest, :title, :sub, :badge, :hl, :start, :end, :active, FALSE)
			""").params(planParams(f)).update(keys, "plan_id");
		return keys.getKey().longValue();
	}

	private static Map<String, Object> planParams(PlanForm f) {
		Map<String, Object> m = new HashMap<>();
		m.put("month", f.getPlanMonth());
		m.put("dest", f.getDestinationId());
		m.put("title", f.getTitle().trim());
		m.put("sub", blank(f.getSubtitle()));
		m.put("badge", blank(f.getBadgeText()));
		m.put("hl", blank(f.getHighlights()));
		m.put("start", f.getStartAt());
		m.put("end", f.getEndAt());
		m.put("active", f.isActive());
		return m;
	}

	private static String blank(String s) {
		return s == null || s.isBlank() ? null : s.trim();
	}

	private void saveDeals(long planId, PlanForm f, Map<String, Integer> originals) {
		jdbc.sql("DELETE FROM monthly_plan_flight WHERE plan_id = :id").param("id", planId).update();
		int order = 1;
		for (PlanForm.DealForm d : f.getDeals()) {
			jdbc.sql("""
				INSERT INTO monthly_plan_flight (plan_id, flight_id, cabin_class, sale_price, original_price, limited_seats, display_order)
				VALUES (:plan, :flight, :cabin, :sale, :orig, :seats, :ord)
				""").param("plan", planId).param("flight", d.getFlightId()).param("cabin", d.getCabin()).param("sale", d.getSalePrice())
				.param("orig", originals.get(d.getFlightId() + ":" + d.getCabin())).param("seats", d.getLimitedSeats()).param("ord", order++).update();
		}
	}

	@PostMapping(BASE)
	public String create(@AuthenticationPrincipal AppUser admin, @Validated @ModelAttribute("planForm") PlanForm f,
		BindingResult errors, Model model) {
		Map<String, Integer> originals = check(f, errors);
		if (errors.hasErrors()) {
			return form(model, BASE, "특별전 등록");
		}
		Long id = tx.execute(status -> {
			long planId = insertPlan(f);
			saveDeals(planId, f, originals);
			return planId;
		});
		audit.record(admin.getId(), "PLAN_CREATE", "monthly_plan", id, f.getTitle());
		return "redirect:" + BASE + "?saved";
	}

	private void requireExists(long id) {
		if (jdbc.sql("SELECT COUNT(*) FROM monthly_plan WHERE plan_id = :id").param("id", id).query(Integer.class).single() == 0) {
			throw AdminProductSupport.notFound();
		}
	}

	@GetMapping(BASE + "/{id}/edit")
	public String editForm(@PathVariable long id, Model model) {
		var rows = jdbc.sql("SELECT * FROM monthly_plan WHERE plan_id = :id AND deleted = FALSE").param("id", id).query().listOfRows();
		if (rows.isEmpty()) {
			throw AdminProductSupport.notFound();
		}
		var r = AdminFlightService.ci(rows.get(0));
		PlanForm f = new PlanForm();
		f.setPlanMonth(r.get("plan_month").toString().trim());
		f.setDestinationId(((Number) r.get("destination_id")).longValue());
		f.setTitle((String) r.get("title"));
		f.setSubtitle((String) r.get("subtitle"));
		f.setBadgeText((String) r.get("badge_text"));
		f.setHighlights((String) r.get("highlights"));
		f.setStartAt(((java.sql.Timestamp) r.get("start_at")).toLocalDateTime());
		f.setEndAt(((java.sql.Timestamp) r.get("end_at")).toLocalDateTime());
		f.setActive(Boolean.TRUE.equals(r.get("is_active")));
		for (Map<String, Object> raw : jdbc.sql("SELECT * FROM monthly_plan_flight WHERE plan_id = :id ORDER BY display_order, flight_id").param("id", id).query().listOfRows()) {
			var d = AdminFlightService.ci(raw);
			PlanForm.DealForm deal = new PlanForm.DealForm();
			deal.setFlightId(((Number) d.get("flight_id")).longValue());
			deal.setCabin((String) d.get("cabin_class"));
			deal.setSalePrice(((Number) d.get("sale_price")).intValue());
			deal.setLimitedSeats(((Number) d.get("limited_seats")).intValue());
			f.getDeals().add(deal);
		}
		if (f.getDeals().isEmpty()) {
			f.getDeals().add(new PlanForm.DealForm());
		}
		model.addAttribute("planForm", f);
		return form(model, BASE + "/" + id, "특별전 수정");
	}

	@PostMapping(BASE + "/{id}")
	public String update(@AuthenticationPrincipal AppUser admin, @PathVariable long id,
		@Validated @ModelAttribute("planForm") PlanForm f, BindingResult errors, Model model) {
		requireExists(id);
		Map<String, Integer> originals = check(f, errors);
		if (errors.hasErrors()) {
			return form(model, BASE + "/" + id, "특별전 수정");
		}
		tx.executeWithoutResult(status -> {
			Map<String, Object> p = planParams(f);
			p.put("id", id);
			jdbc.sql("""
				UPDATE monthly_plan SET plan_month = :month, destination_id = :dest, title = :title, subtitle = :sub, badge_text = :badge,
					highlights = :hl, start_at = :start, end_at = :end, is_active = :active
				WHERE plan_id = :id AND deleted = FALSE
				""").params(p).update();
			saveDeals(id, f, originals);
		});
		audit.record(admin.getId(), "PLAN_UPDATE", "monthly_plan", id, f.getTitle());
		return "redirect:" + BASE + "?saved";
	}

	@PostMapping(BASE + "/{id}/delete")
	public String delete(@AuthenticationPrincipal AppUser admin, @PathVariable long id) {
		requireExists(id);
		jdbc.sql("UPDATE monthly_plan SET deleted = TRUE, is_active = FALSE WHERE plan_id = :id").param("id", id).update();
		audit.record(admin.getId(), "PLAN_DELETE", "monthly_plan", id, "삭제 탭으로 이동");
		return "redirect:" + BASE + "?deleted";
	}

	@PostMapping(BASE + "/{id}/restore")
	public String restore(@AuthenticationPrincipal AppUser admin, @PathVariable long id) {
		requireExists(id);
		jdbc.sql("UPDATE monthly_plan SET deleted = FALSE, is_active = TRUE WHERE plan_id = :id AND deleted = TRUE").param("id", id).update();
		audit.record(admin.getId(), "PLAN_RESTORE", "monthly_plan", id, "삭제 탭에서 복구");
		return "redirect:" + BASE + "?tab=trash&restored";
	}

	@PostMapping(BASE + "/{id}/purge")
	public String purge(@AuthenticationPrincipal AppUser admin, @PathVariable long id) {
		requireExists(id);
		Boolean done = tx.execute(status -> {
			int inTrash = jdbc.sql("SELECT COUNT(*) FROM monthly_plan WHERE plan_id = :id AND deleted = TRUE").param("id", id).query(Integer.class).single();
			if (inTrash == 0) {
				return false;
			}
			jdbc.sql("DELETE FROM monthly_plan_flight WHERE plan_id = :id").param("id", id).update();
			jdbc.sql("DELETE FROM monthly_plan WHERE plan_id = :id").param("id", id).update();
			return true;
		});
		if (!Boolean.TRUE.equals(done)) {
			return "redirect:" + BASE + "?error=" + URLEncoder.encode("삭제 탭에 있는 특별전만 영구 삭제할 수 있어요.", StandardCharsets.UTF_8);
		}
		audit.record(admin.getId(), "PLAN_PURGE", "monthly_plan", id, "영구 삭제");
		return "redirect:" + BASE + "?tab=trash&purged";
	}
}
