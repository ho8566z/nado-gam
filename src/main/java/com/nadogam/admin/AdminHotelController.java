package com.nadogam.admin;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nadogam.auth.AppUser;

// 관리자 호텔 관리: 등록·수정·삭제(삭제 탭으로 이동)·복구·영구 삭제.
@Controller
public class AdminHotelController {

	private static final String BASE = "/admin/hotels";
	private static final int LIMIT = 300;

	private final JdbcClient jdbc;
	private final AdminAudit audit;
	private final AdminProductSupport support;

	public AdminHotelController(JdbcClient jdbc, AdminAudit audit, AdminProductSupport support) {
		this.jdbc = jdbc;
		this.audit = audit;
		this.support = support;
	}

	private int count(boolean trash) {
		return jdbc.sql("SELECT COUNT(*) FROM hotel WHERE status " + (trash ? "=" : "<>") + " 'DELETED'").query(Integer.class).single();
	}

	@GetMapping(BASE)
	public String list(@RequestParam(defaultValue = "active") String tab, @RequestParam(required = false) String q, Model model) {
		boolean trash = AdminProductSupport.isTrash(tab);
		boolean search = q != null && !q.isBlank();
		var spec = jdbc.sql("""
			SELECT h.hotel_id, h.name, h.grade, h.price_per_night, h.status, COALESCE(d.name_ko, c.name_ko) AS place
			FROM hotel h LEFT JOIN destination d ON d.destination_id = h.destination_id LEFT JOIN domestic_city c ON c.city_id = h.city_id
			WHERE h.status %s 'DELETED' %s ORDER BY h.hotel_id DESC LIMIT %d
			""".formatted(trash ? "=" : "<>", search ? "AND h.name LIKE :q" : "", LIMIT));
		if (search) {
			spec = spec.param("q", "%" + q.trim() + "%");
		}
		List<ProductRow> rows = spec.query().listOfRows().stream().map(r -> new ProductRow(((Number) r.get("HOTEL_ID")).longValue(),
			List.of((String) r.get("NAME"), String.valueOf(r.get("PLACE")), r.get("GRADE") + "성",
				AdminProductSupport.won(((Number) r.get("PRICE_PER_NIGHT")).longValue()) + " / 1박"),
			label((String) r.get("STATUS")), "ON_SALE".equals(r.get("STATUS")))).toList();
		support.fillList(model, "hotels", "호텔 관리", BASE, tab, q, List.of("호텔", "여행지·도시", "성급", "가격"), rows, count(false), count(true), "호텔 등록");
		return "admin/product-list";
	}

	private static String label(String status) {
		return "ON_SALE".equals(status) ? "판매 중" : ("DELETED".equals(status) ? "삭제됨" : "중지");
	}

	private String form(Model model, String action, String heading) {
		model.addAttribute("formAction", action);
		model.addAttribute("heading", heading);
		model.addAttribute("destinations", jdbc.sql("SELECT destination_id AS id, name_ko AS name FROM destination ORDER BY name_ko").query().listOfRows());
		model.addAttribute("cities", jdbc.sql("SELECT city_id AS id, name_ko AS name FROM domestic_city ORDER BY name_ko").query().listOfRows());
		model.addAttribute("menu", "hotels");
		return "admin/hotel-form";
	}

	@GetMapping(BASE + "/new")
	public String newForm(Model model) {
		model.addAttribute("hotelForm", new HotelForm());
		return form(model, BASE, "호텔 등록");
	}

	@PostMapping(BASE)
	public String create(@AuthenticationPrincipal AppUser admin, @Validated @ModelAttribute("hotelForm") HotelForm f,
		BindingResult errors, Model model) {
		if (errors.hasErrors()) {
			return form(model, BASE, "호텔 등록");
		}
		var keys = new GeneratedKeyHolder();
		jdbc.sql("""
			INSERT INTO hotel (destination_id, city_id, name, grade, area, summary, amenities, price_per_night, status, sort_order)
			VALUES (:dest, :city, :name, :grade, :area, :summary, :amenities, :price, 'ON_SALE', :sort)
			""").params(params(f)).update(keys, "hotel_id");
		audit.record(admin.getId(), "HOTEL_CREATE", "hotel", keys.getKey().longValue(), f.getName());
		return "redirect:" + BASE + "?saved";
	}

	private static Map<String, Object> params(HotelForm f) {
		boolean domestic = "DOMESTIC".equals(f.getScope());
		Map<String, Object> m = new HashMap<>();
		m.put("dest", domestic ? null : f.getDestinationId());
		m.put("city", domestic ? f.getCityId() : null);
		m.put("name", f.getName().trim());
		m.put("grade", f.getGrade());
		m.put("area", f.getArea().trim());
		m.put("summary", f.getSummary().trim());
		m.put("amenities", f.getAmenities().trim());
		m.put("price", f.getPricePerNight());
		m.put("sort", f.getSortOrder() == null ? 0 : f.getSortOrder());
		return m;
	}

	private void requireExists(long id) {
		if (jdbc.sql("SELECT COUNT(*) FROM hotel WHERE hotel_id = :id").param("id", id).query(Integer.class).single() == 0) {
			throw AdminProductSupport.notFound();
		}
	}

	@GetMapping(BASE + "/{id}/edit")
	public String editForm(@PathVariable long id, Model model) {
		var rows = jdbc.sql("SELECT * FROM hotel WHERE hotel_id = :id AND status <> 'DELETED'").param("id", id).query().listOfRows();
		if (rows.isEmpty()) {
			throw AdminProductSupport.notFound();
		}
		var r = rows.get(0);
		HotelForm f = new HotelForm();
		f.setScope(r.get("CITY_ID") != null ? "DOMESTIC" : "OVERSEAS");
		f.setDestinationId(r.get("DESTINATION_ID") == null ? null : ((Number) r.get("DESTINATION_ID")).longValue());
		f.setCityId(r.get("CITY_ID") == null ? null : ((Number) r.get("CITY_ID")).longValue());
		f.setName((String) r.get("NAME"));
		f.setGrade(((Number) r.get("GRADE")).intValue());
		f.setArea((String) r.get("AREA"));
		f.setSummary((String) r.get("SUMMARY"));
		f.setAmenities((String) r.get("AMENITIES"));
		f.setPricePerNight(((Number) r.get("PRICE_PER_NIGHT")).intValue());
		f.setSortOrder(((Number) r.get("SORT_ORDER")).intValue());
		model.addAttribute("hotelForm", f);
		return form(model, BASE + "/" + id, "호텔 수정");
	}

	@PostMapping(BASE + "/{id}")
	public String update(@AuthenticationPrincipal AppUser admin, @PathVariable long id,
		@Validated @ModelAttribute("hotelForm") HotelForm f, BindingResult errors, Model model) {
		requireExists(id);
		if (errors.hasErrors()) {
			return form(model, BASE + "/" + id, "호텔 수정");
		}
		Map<String, Object> p = params(f);
		p.put("id", id);
		jdbc.sql("""
			UPDATE hotel SET destination_id = :dest, city_id = :city, name = :name, grade = :grade, area = :area, summary = :summary,
				amenities = :amenities, price_per_night = :price, sort_order = :sort
			WHERE hotel_id = :id AND status <> 'DELETED'
			""").params(p).update();
		audit.record(admin.getId(), "HOTEL_UPDATE", "hotel", id, f.getName());
		return "redirect:" + BASE + "?saved";
	}

	@PostMapping(BASE + "/{id}/delete")
	public String delete(@AuthenticationPrincipal AppUser admin, @PathVariable long id) {
		requireExists(id);
		jdbc.sql("UPDATE hotel SET status = 'DELETED' WHERE hotel_id = :id").param("id", id).update();
		audit.record(admin.getId(), "HOTEL_DELETE", "hotel", id, "삭제 탭으로 이동");
		return "redirect:" + BASE + "?deleted";
	}

	@PostMapping(BASE + "/{id}/restore")
	public String restore(@AuthenticationPrincipal AppUser admin, @PathVariable long id) {
		requireExists(id);
		jdbc.sql("UPDATE hotel SET status = 'ON_SALE' WHERE hotel_id = :id AND status = 'DELETED'").param("id", id).update();
		audit.record(admin.getId(), "HOTEL_RESTORE", "hotel", id, "삭제 탭에서 복구");
		return "redirect:" + BASE + "?tab=trash&restored";
	}

	@PostMapping(BASE + "/{id}/purge")
	public String purge(@AuthenticationPrincipal AppUser admin, @PathVariable long id) {
		requireExists(id);
		int n = jdbc.sql("DELETE FROM hotel WHERE hotel_id = :id AND status = 'DELETED'").param("id", id).update();
		if (n == 0) {
			return "redirect:" + BASE + "?error=" + URLEncoder.encode("삭제 탭에 있는 호텔만 영구 삭제할 수 있어요.", StandardCharsets.UTF_8);
		}
		audit.record(admin.getId(), "HOTEL_PURGE", "hotel", id, "영구 삭제");
		return "redirect:" + BASE + "?tab=trash&purged";
	}
}
