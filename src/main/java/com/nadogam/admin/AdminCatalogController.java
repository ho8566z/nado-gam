package com.nadogam.admin;

import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;

import com.nadogam.auth.AppUser;

// 관리자 상품 노출 관리: 여행지 운항 상태, 국내 도시, 특별기획, 투어·호텔·크루즈 판매 상태.
// 종류(kind)는 아래 화이트리스트에 있는 것만 받으므로 SQL 에 들어가는 테이블·컬럼 이름은 사용자 입력이 아니다.
@Controller
public class AdminCatalogController {

	private static final int LIMIT = 300;

	// statusColumn 이 null 이면 is_active(boolean) 컬럼을 쓴다.
	record Kind(String key, String label, String table, String idColumn, String nameColumn,
		String statusColumn, String onValue, String offValue) {

		boolean usesFlag() {
			return statusColumn == null;
		}
	}

	private static final List<Kind> KINDS = List.of(
		new Kind("destination", "해외 여행지", "destination", "destination_id", "name_ko", "status", "AVAILABLE", "UNAVAILABLE"),
		new Kind("city", "국내 도시", "domestic_city", "city_id", "name_ko", "status", "AVAILABLE", "UNAVAILABLE"),
		new Kind("plan", "특별기획", "monthly_plan", "plan_id", "title", null, null, null),
		new Kind("tour", "투어", "tour", "tour_id", "title", "status", "ON_SALE", "HIDDEN"),
		new Kind("hotel", "호텔", "hotel", "hotel_id", "name", "status", "ON_SALE", "HIDDEN"),
		new Kind("cruise", "크루즈", "cruise", "cruise_id", "title", "status", "ON_SALE", "HIDDEN"));

	private final JdbcClient jdbc;
	private final AdminAudit audit;

	public AdminCatalogController(JdbcClient jdbc, AdminAudit audit) {
		this.jdbc = jdbc;
		this.audit = audit;
	}

	private static Kind kind(String key) {
		return KINDS.stream().filter(k -> k.key().equals(key)).findFirst()
			.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "없는 관리 항목입니다."));
	}

	@GetMapping("/admin/catalog")
	public String list(@RequestParam(defaultValue = "destination") String kind,
		@RequestParam(required = false) String q, Model model) {
		Kind k = kind(kind);
		String state = k.usesFlag()
			? "CASE WHEN is_active THEN 'on' ELSE 'off' END"
			: "CASE WHEN " + k.statusColumn() + " = '" + k.onValue() + "' THEN 'on' ELSE 'off' END";
		String extra = "destination".equals(k.key()) ? ", unavailable_reason AS note" : ", NULL AS note";
		boolean search = q != null && !q.isBlank();
		var spec = jdbc.sql("SELECT " + k.idColumn() + " AS id, " + k.nameColumn() + " AS name, " + state + " AS state" + extra
			+ " FROM " + k.table() + (search ? " WHERE " + k.nameColumn() + " LIKE :q" : "")
			+ " ORDER BY " + k.idColumn() + " LIMIT " + LIMIT);
		if (search) {
			spec = spec.param("q", "%" + q.trim() + "%");
		}
		List<Map<String, Object>> rows = spec.query().listOfRows();
		model.addAttribute("kinds", KINDS);
		model.addAttribute("kind", k);
		model.addAttribute("q", q);
		model.addAttribute("rows", rows);
		model.addAttribute("onCount", rows.stream().filter(r -> "on".equals(r.get("state"))).count());
		model.addAttribute("menu", "catalog");
		return "admin/catalog";
	}

	@PostMapping("/admin/catalog/{kind}/{id}/toggle")
	public String toggle(@AuthenticationPrincipal AppUser admin, @PathVariable String kind, @PathVariable long id,
		@RequestParam(required = false) String reason, @RequestParam(required = false) String q) {
		Kind k = kind(kind);
		boolean currentlyOn;
		if (k.usesFlag()) {
			currentlyOn = jdbc.sql("SELECT is_active FROM " + k.table() + " WHERE " + k.idColumn() + " = :id")
				.param("id", id).query(Boolean.class).optional()
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
			jdbc.sql("UPDATE " + k.table() + " SET is_active = :v WHERE " + k.idColumn() + " = :id")
				.param("v", !currentlyOn).param("id", id).update();
		} else {
			String status = jdbc.sql("SELECT " + k.statusColumn() + " FROM " + k.table() + " WHERE " + k.idColumn() + " = :id")
				.param("id", id).query(String.class).optional()
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
			currentlyOn = k.onValue().equals(status);
			jdbc.sql("UPDATE " + k.table() + " SET " + k.statusColumn() + " = :v WHERE " + k.idColumn() + " = :id")
				.param("v", currentlyOn ? k.offValue() : k.onValue()).param("id", id).update();
			if ("destination".equals(k.key())) {
				String note = currentlyOn ? (reason == null || reason.isBlank() ? "관리자가 운항을 중지했습니다." : reason.trim()) : null;
				jdbc.sql("UPDATE destination SET unavailable_reason = :r WHERE destination_id = :id")
					.param("r", note != null && note.length() > 200 ? note.substring(0, 200) : note).param("id", id).update();
			}
		}
		audit.record(admin.getId(), currentlyOn ? "HIDE" : "SHOW", k.table(), id, k.label() + " " + (currentlyOn ? "노출 중지" : "노출 재개"));
		String back = "redirect:/admin/catalog?kind=" + k.key() + "&saved";
		return q == null || q.isBlank() ? back : back + "&q=" + java.net.URLEncoder.encode(q, java.nio.charset.StandardCharsets.UTF_8);
	}
}
