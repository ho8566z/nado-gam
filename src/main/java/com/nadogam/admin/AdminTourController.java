package com.nadogam.admin;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
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
import com.nadogam.tour.TourTheme;

// 관리자 투어 관리: 등록·수정·삭제(삭제 탭으로 이동)·복구·영구 삭제. 기간 옵션과 일차별 일정까지 함께 저장한다.
@Controller
public class AdminTourController {

	private static final String BASE = "/admin/tours";
	private static final int LIMIT = 300;
	private static final int MAX_OPTIONS = 6;
	private static final int MAX_NIGHTS = 30;

	private final JdbcClient jdbc;
	private final AdminAudit audit;
	private final AdminProductSupport support;
	private final TransactionTemplate tx;

	public AdminTourController(JdbcClient jdbc, AdminAudit audit, AdminProductSupport support, TransactionTemplate tx) {
		this.jdbc = jdbc;
		this.audit = audit;
		this.support = support;
		this.tx = tx;
	}

	private int count(boolean trash) {
		return jdbc.sql("SELECT COUNT(*) FROM tour WHERE status " + (trash ? "=" : "<>") + " 'DELETED'").query(Integer.class).single();
	}

	@GetMapping(BASE)
	public String list(@RequestParam(defaultValue = "active") String tab, @RequestParam(required = false) String q, Model model) {
		boolean trash = AdminProductSupport.isTrash(tab);
		boolean search = q != null && !q.isBlank();
		var spec = jdbc.sql("""
			SELECT t.tour_id, t.title, t.scope, t.theme, t.status, COALESCE(d.name_ko, c.name_ko) AS place,
			       (SELECT MIN(price_per_person) FROM tour_option o WHERE o.tour_id = t.tour_id) AS min_price,
			       (SELECT COUNT(*) FROM tour_option o WHERE o.tour_id = t.tour_id) AS options
			FROM tour t LEFT JOIN destination d ON d.destination_id = t.destination_id LEFT JOIN domestic_city c ON c.city_id = t.city_id
			WHERE t.status %s 'DELETED' %s ORDER BY t.tour_id DESC LIMIT %d
			""".formatted(trash ? "=" : "<>", search ? "AND (t.title LIKE :q OR d.name_ko LIKE :q OR c.name_ko LIKE :q)" : "", LIMIT));
		if (search) {
			spec = spec.param("q", "%" + q.trim() + "%");
		}
		List<ProductRow> rows = spec.query().listOfRows().stream().map(raw -> {
			var r = AdminFlightService.ci(raw);
			String status = (String) r.get("status");
			Object min = r.get("min_price");
			return new ProductRow(((Number) r.get("tour_id")).longValue(), List.of(
				(String) r.get("title"),
				("OVERSEAS".equals(r.get("scope")) ? "해외 · " : "국내 · ") + r.get("place"),
				TourTheme.of((String) r.get("theme")).map(TourTheme::getShortLabel).orElse(String.valueOf(r.get("theme"))),
				r.get("options") + "개 옵션 · " + (min == null ? "-" : AdminProductSupport.won(((Number) min).longValue()) + "~")),
				"ON_SALE".equals(status) ? "판매 중" : ("DELETED".equals(status) ? "삭제됨" : "중지"), "ON_SALE".equals(status));
		}).toList();
		support.fillList(model, "tours", "투어 관리", BASE, tab, q, List.of("투어", "여행지·도시", "테마", "옵션·최저가"), rows, count(false), count(true), "투어 등록");
		return "admin/product-list";
	}

	private String form(Model model, String action, String heading) {
		model.addAttribute("formAction", action);
		model.addAttribute("heading", heading);
		model.addAttribute("destinations", jdbc.sql("SELECT destination_id AS id, name_ko AS name FROM destination ORDER BY name_ko").query().listOfRows());
		model.addAttribute("cities", jdbc.sql("SELECT city_id AS id, name_ko AS name FROM domestic_city ORDER BY name_ko").query().listOfRows());
		model.addAttribute("themes", TourTheme.values());
		model.addAttribute("menu", "tours");
		return "admin/tour-form";
	}

	private static TourForm.OptionForm blankOption(int nights) {
		TourForm.OptionForm o = new TourForm.OptionForm();
		o.setNights(nights);
		for (int i = 0; i <= nights; i++) {
			o.getDays().add(new TourForm.DayForm());
		}
		return o;
	}

	@GetMapping(BASE + "/new")
	public String newForm(Model model) {
		TourForm f = new TourForm();
		f.getOptions().add(blankOption(2));
		model.addAttribute("tourForm", f);
		return form(model, BASE, "투어 등록");
	}

	// 입력값끼리 맞는지 확인한다: 같은 여행지·테마 중복, 옵션 박수 중복·범위, 일정 줄 수(박수 + 1일).
	private void check(TourForm f, BindingResult errors, Long selfId) {
		if (f.getOptions() == null || f.getOptions().isEmpty()) {
			errors.reject("options", "기간 옵션을 하나 이상 넣어 주세요.");
			return;
		}
		if (f.getOptions().size() > MAX_OPTIONS) {
			errors.reject("options", "기간 옵션은 최대 " + MAX_OPTIONS + "개까지 넣을 수 있어요.");
			return;
		}
		Set<Integer> seen = new HashSet<>();
		for (int i = 0; i < f.getOptions().size(); i++) {
			TourForm.OptionForm o = f.getOptions().get(i);
			String at = "options[" + i + "].";
			if (o.getNights() == null) {
				continue;
			}
			if (o.getNights() < 1 || o.getNights() > MAX_NIGHTS) {
				errors.rejectValue(at + "nights", "range", "박수는 1~" + MAX_NIGHTS + "박이에요.");
			} else if (!seen.add(o.getNights())) {
				errors.rejectValue(at + "nights", "dup", "같은 박수의 옵션이 두 번 들어 있어요.");
			} else if (o.getDays() == null || o.getDays().size() != o.getNights() + 1) {
				errors.reject("days", o.getNights() + "박 " + (o.getNights() + 1) + "일 옵션은 일정이 " + (o.getNights() + 1) + "일치여야 해요(지금 "
					+ (o.getDays() == null ? 0 : o.getDays().size()) + "일치).");
			}
			if (o.getPrice() != null && (o.getPrice() < 10000 || o.getPrice() > 100000000)) {
				errors.rejectValue(at + "price", "range", "1인 가격은 10,000~100,000,000원 사이예요.");
			}
			if (o.getMinPeople() != null && (o.getMinPeople() < 1 || o.getMinPeople() > 100)) {
				errors.rejectValue(at + "minPeople", "range", "최소 인원은 1~100명이에요.");
			}
			if (o.getMaxPeople() != null && (o.getMaxPeople() < 1 || o.getMaxPeople() > 100)) {
				errors.rejectValue(at + "maxPeople", "range", "최대 인원은 1~100명이에요.");
			} else if (o.getMinPeople() != null && o.getMaxPeople() != null && o.getMaxPeople() < o.getMinPeople()) {
				errors.rejectValue(at + "maxPeople", "order", "최대 인원은 최소 인원보다 작을 수 없어요.");
			}
		}
		if (!errors.hasFieldErrors("placeChosen") && f.getTheme() != null && TourTheme.of(f.getTheme()).isPresent()) {
			boolean domestic = "DOMESTIC".equals(f.getScope());
			Long place = domestic ? f.getCityId() : f.getDestinationId();
			if (place != null) {
				String col = domestic ? "city_id" : "destination_id";
				Integer dup = (selfId == null
					? jdbc.sql("SELECT COUNT(*) FROM tour WHERE " + col + " = :place AND theme = :theme").param("place", place).param("theme", f.getTheme())
					: jdbc.sql("SELECT COUNT(*) FROM tour WHERE " + col + " = :place AND theme = :theme AND tour_id <> :self")
						.param("place", place).param("theme", f.getTheme()).param("self", selfId))
					.query(Integer.class).single();
				if (dup > 0) {
					errors.reject("dup", "이 " + (domestic ? "도시" : "여행지") + "에는 같은 테마의 투어가 이미 있어요(삭제 탭 포함). 다른 테마를 고르거나 기존 투어를 고쳐 주세요.");
				}
			}
		}
	}

	private static Map<String, Object> params(TourForm f) {
		boolean domestic = "DOMESTIC".equals(f.getScope());
		Map<String, Object> m = new HashMap<>();
		m.put("scope", domestic ? "DOMESTIC" : "OVERSEAS");
		m.put("dest", domestic ? null : f.getDestinationId());
		m.put("city", domestic ? f.getCityId() : null);
		m.put("theme", f.getTheme());
		m.put("title", f.getTitle().trim());
		m.put("sub", f.getSubtitle().trim());
		m.put("brand", f.getCollabBrand() == null || f.getCollabBrand().isBlank() ? null : f.getCollabBrand().trim());
		m.put("hl", f.getHighlights().trim());
		m.put("inc", f.getIncludes().trim());
		m.put("exc", f.getExcludes().trim());
		m.put("note", f.getSourceNote() == null || f.getSourceNote().isBlank() ? null : f.getSourceNote().trim());
		m.put("sort", f.getSortOrder() == null ? 0 : f.getSortOrder());
		return m;
	}

	private void saveOptions(long tourId, TourForm f) {
		deleteOptions(tourId);
		for (TourForm.OptionForm o : f.getOptions()) {
			var keys = new GeneratedKeyHolder();
			jdbc.sql("""
				INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people)
				VALUES (:tour, :nights, :days, :price, :min, :max)
				""").param("tour", tourId).param("nights", o.getNights()).param("days", o.getNights() + 1).param("price", o.getPrice())
				.param("min", o.getMinPeople()).param("max", o.getMaxPeople()).update(keys, "option_id");
			long optionId = keys.getKey().longValue();
			int no = 1;
			for (TourForm.DayForm d : o.getDays()) {
				jdbc.sql("INSERT INTO tour_day (option_id, day_no, title, description) VALUES (:opt, :no, :title, :desc)")
					.param("opt", optionId).param("no", no++).param("title", d.getTitle().trim()).param("desc", d.getDescription().trim()).update();
			}
		}
	}

	private void deleteOptions(long tourId) {
		jdbc.sql("DELETE FROM tour_day WHERE option_id IN (SELECT option_id FROM tour_option WHERE tour_id = :id)").param("id", tourId).update();
		jdbc.sql("DELETE FROM tour_option WHERE tour_id = :id").param("id", tourId).update();
	}

	@PostMapping(BASE)
	public String create(@AuthenticationPrincipal AppUser admin, @Validated @ModelAttribute("tourForm") TourForm f,
		BindingResult errors, Model model) {
		check(f, errors, null);
		if (errors.hasErrors()) {
			return form(model, BASE, "투어 등록");
		}
		Long id = tx.execute(status -> {
			var keys = new GeneratedKeyHolder();
			jdbc.sql("""
				INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order)
				VALUES (:scope, :dest, :city, :theme, :title, :sub, :brand, :hl, :inc, :exc, :note, 'ON_SALE', :sort)
				""").params(params(f)).update(keys, "tour_id");
			long tourId = keys.getKey().longValue();
			saveOptions(tourId, f);
			return tourId;
		});
		audit.record(admin.getId(), "TOUR_CREATE", "tour", id, f.getTitle());
		return "redirect:" + BASE + "?saved";
	}

	private void requireExists(long id) {
		if (jdbc.sql("SELECT COUNT(*) FROM tour WHERE tour_id = :id").param("id", id).query(Integer.class).single() == 0) {
			throw AdminProductSupport.notFound();
		}
	}

	@GetMapping(BASE + "/{id}/edit")
	public String editForm(@PathVariable long id, Model model) {
		var rows = jdbc.sql("SELECT * FROM tour WHERE tour_id = :id AND status <> 'DELETED'").param("id", id).query().listOfRows();
		if (rows.isEmpty()) {
			throw AdminProductSupport.notFound();
		}
		var r = AdminFlightService.ci(rows.get(0));
		TourForm f = new TourForm();
		f.setScope((String) r.get("scope"));
		f.setDestinationId(r.get("destination_id") == null ? null : ((Number) r.get("destination_id")).longValue());
		f.setCityId(r.get("city_id") == null ? null : ((Number) r.get("city_id")).longValue());
		f.setTheme((String) r.get("theme"));
		f.setTitle((String) r.get("title"));
		f.setSubtitle((String) r.get("subtitle"));
		f.setCollabBrand((String) r.get("collab_brand"));
		f.setHighlights((String) r.get("highlights"));
		f.setIncludes((String) r.get("includes"));
		f.setExcludes((String) r.get("excludes"));
		f.setSourceNote((String) r.get("source_note"));
		f.setSortOrder(((Number) r.get("sort_order")).intValue());
		for (Map<String, Object> raw : jdbc.sql("SELECT * FROM tour_option WHERE tour_id = :id ORDER BY nights").param("id", id).query().listOfRows()) {
			var o = AdminFlightService.ci(raw);
			TourForm.OptionForm opt = new TourForm.OptionForm();
			opt.setNights(((Number) o.get("nights")).intValue());
			opt.setPrice(((Number) o.get("price_per_person")).intValue());
			opt.setMinPeople(((Number) o.get("min_people")).intValue());
			opt.setMaxPeople(((Number) o.get("max_people")).intValue());
			for (Map<String, Object> draw : jdbc.sql("SELECT * FROM tour_day WHERE option_id = :o ORDER BY day_no")
				.param("o", ((Number) o.get("option_id")).longValue()).query().listOfRows()) {
				var d = AdminFlightService.ci(draw);
				TourForm.DayForm day = new TourForm.DayForm();
				day.setTitle((String) d.get("title"));
				day.setDescription((String) d.get("description"));
				opt.getDays().add(day);
			}
			f.getOptions().add(opt);
		}
		if (f.getOptions().isEmpty()) {
			f.getOptions().add(blankOption(2));
		}
		model.addAttribute("tourForm", f);
		return form(model, BASE + "/" + id, "투어 수정");
	}

	@PostMapping(BASE + "/{id}")
	public String update(@AuthenticationPrincipal AppUser admin, @PathVariable long id,
		@Validated @ModelAttribute("tourForm") TourForm f, BindingResult errors, Model model) {
		requireExists(id);
		check(f, errors, id);
		if (errors.hasErrors()) {
			return form(model, BASE + "/" + id, "투어 수정");
		}
		tx.executeWithoutResult(status -> {
			Map<String, Object> p = params(f);
			p.put("id", id);
			jdbc.sql("""
				UPDATE tour SET scope = :scope, destination_id = :dest, city_id = :city, theme = :theme, title = :title, subtitle = :sub,
					collab_brand = :brand, highlights = :hl, includes = :inc, excludes = :exc, source_note = :note, sort_order = :sort
				WHERE tour_id = :id AND status <> 'DELETED'
				""").params(p).update();
			saveOptions(id, f);
		});
		audit.record(admin.getId(), "TOUR_UPDATE", "tour", id, f.getTitle());
		return "redirect:" + BASE + "?saved";
	}

	@PostMapping(BASE + "/{id}/delete")
	public String delete(@AuthenticationPrincipal AppUser admin, @PathVariable long id) {
		requireExists(id);
		jdbc.sql("UPDATE tour SET status = 'DELETED' WHERE tour_id = :id").param("id", id).update();
		audit.record(admin.getId(), "TOUR_DELETE", "tour", id, "삭제 탭으로 이동");
		return "redirect:" + BASE + "?deleted";
	}

	@PostMapping(BASE + "/{id}/restore")
	public String restore(@AuthenticationPrincipal AppUser admin, @PathVariable long id) {
		requireExists(id);
		jdbc.sql("UPDATE tour SET status = 'ON_SALE' WHERE tour_id = :id AND status = 'DELETED'").param("id", id).update();
		audit.record(admin.getId(), "TOUR_RESTORE", "tour", id, "삭제 탭에서 복구");
		return "redirect:" + BASE + "?tab=trash&restored";
	}

	@PostMapping(BASE + "/{id}/purge")
	public String purge(@AuthenticationPrincipal AppUser admin, @PathVariable long id) {
		requireExists(id);
		Boolean done = tx.execute(status -> {
			int inTrash = jdbc.sql("SELECT COUNT(*) FROM tour WHERE tour_id = :id AND status = 'DELETED'").param("id", id).query(Integer.class).single();
			if (inTrash == 0) {
				return false;
			}
			deleteOptions(id);
			jdbc.sql("DELETE FROM tour WHERE tour_id = :id").param("id", id).update();
			return true;
		});
		if (!Boolean.TRUE.equals(done)) {
			return "redirect:" + BASE + "?error=" + URLEncoder.encode("삭제 탭에 있는 투어만 영구 삭제할 수 있어요.", StandardCharsets.UTF_8);
		}
		audit.record(admin.getId(), "TOUR_PURGE", "tour", id, "영구 삭제");
		return "redirect:" + BASE + "?tab=trash&purged";
	}
}
