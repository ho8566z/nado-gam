package com.nadogam.admin;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalTime;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.simple.JdbcClient;
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

// 관리자 항공편 관리: 등록·수정·삭제(삭제 탭으로 이동)·복구·영구 삭제.
@Controller
public class AdminFlightController {

	private static final String BASE = "/admin/flights";
	private static final int LIMIT = 300;

	private final JdbcClient jdbc;
	private final AdminAudit audit;
	private final AdminProductSupport support;
	private final AdminFlightService service;

	public AdminFlightController(JdbcClient jdbc, AdminAudit audit, AdminProductSupport support, AdminFlightService service) {
		this.jdbc = jdbc;
		this.audit = audit;
		this.support = support;
		this.service = service;
	}

	private int count(boolean trash) {
		return jdbc.sql("SELECT COUNT(*) FROM flight WHERE status " + (trash ? "=" : "<>") + " 'DELETED'").query(Integer.class).single();
	}

	@GetMapping(BASE)
	public String list(@RequestParam(defaultValue = "active") String tab, @RequestParam(required = false) String q, Model model) {
		boolean trash = AdminProductSupport.isTrash(tab);
		boolean search = q != null && !q.isBlank();
		var spec = jdbc.sql("""
			SELECT f.flight_id, f.flight_no, a.name_ko AS airline, d.name_ko AS dest, f.origin_airport, f.arrival_airport, f.flight_type,
			       f.departure_time, f.status,
			       (SELECT MIN(base_price + tax_fuel) FROM flight_fare x WHERE x.flight_id = f.flight_id) AS min_price,
			       (SELECT SUM(seats_left) FROM flight_fare x WHERE x.flight_id = f.flight_id) AS seats
			FROM flight f JOIN airline a ON a.airline_code = f.airline_code JOIN destination d ON d.destination_id = f.destination_id
			WHERE f.status %s 'DELETED' %s ORDER BY f.flight_id DESC LIMIT %d
			""".formatted(trash ? "=" : "<>", search ? "AND (f.flight_no LIKE :q OR d.name_ko LIKE :q)" : "", LIMIT));
		if (search) {
			spec = spec.param("q", "%" + q.trim() + "%");
		}
		List<ProductRow> rows = spec.query().listOfRows().stream().map(raw -> {
			var r = AdminFlightService.ci(raw);
			Object min = r.get("min_price");
			Object seats = r.get("seats");
			String status = (String) r.get("status");
			return new ProductRow(((Number) r.get("flight_id")).longValue(), List.of(
				r.get("flight_no") + " · " + r.get("airline"),
				r.get("origin_airport") + " → " + r.get("arrival_airport") + " (" + r.get("dest") + ")",
				("DIRECT".equals(r.get("flight_type")) ? "직항" : "경유") + " · " + String.valueOf(r.get("departure_time")).substring(0, 5) + " 출발",
				min == null ? "-" : AdminProductSupport.won(((Number) min).longValue()) + "~",
				seats == null ? "-" : seats + "석"),
				"ON_SALE".equals(status) ? "판매 중" : ("DELETED".equals(status) ? "삭제됨" : "중지"), "ON_SALE".equals(status));
		}).toList();
		support.fillList(model, "flights", "항공편 관리", BASE, tab, q, List.of("편명", "구간", "유형·시각", "최저가", "남은 좌석"), rows, count(false), count(true), "항공편 등록");
		return "admin/product-list";
	}

	private String form(Model model, String action, String heading, boolean edit) {
		model.addAttribute("formAction", action);
		model.addAttribute("heading", heading);
		model.addAttribute("edit", edit);
		model.addAttribute("airlines", jdbc.sql("SELECT airline_code AS code, name_ko AS name, carrier_type AS type FROM airline ORDER BY name_ko").query().listOfRows());
		model.addAttribute("destinations", jdbc.sql("SELECT destination_id AS id, name_ko AS name, main_airport AS airport FROM destination ORDER BY name_ko").query().listOfRows());
		model.addAttribute("koreanAirports", jdbc.sql("SELECT airport_code AS code, city_name_ko AS city FROM airport WHERE country_code = 'KR' ORDER BY airport_code").query().listOfRows());
		model.addAttribute("airports", jdbc.sql("SELECT airport_code AS code, city_name_ko AS city FROM airport ORDER BY city_name_ko, airport_code").query().listOfRows());
		model.addAttribute("cabins", List.of("일반석", "프리미엄 일반석", "비즈니스석", "일등석"));
		model.addAttribute("menu", "flights");
		return "admin/flight-form";
	}

	@GetMapping(BASE + "/new")
	public String newForm(Model model) {
		FlightForm f = new FlightForm();
		f.getFares().get(0).setEnabled(true);
		f.getFares().get(0).setSeatsTotal(180);
		f.getFares().get(0).setTaxFuel(60000);
		model.addAttribute("flightForm", f);
		return form(model, BASE, "항공편 등록", false);
	}

	// 입력값끼리 맞는지(구간·요금·중복 편명) 확인해 오류를 폼에 붙인다. 계산할 수 없는 값은 서비스의 예외로 알린다.
	private void check(FlightForm f, BindingResult errors, Long selfId) {
		if (f.getOriginAirport() != null && f.getOriginAirport().equals(f.getArrivalAirport())) {
			errors.rejectValue("arrivalAirport", "same", "출발 공항과 도착 공항이 같아요.");
		}
		if ("CONNECTING".equals(f.getFlightType())) {
			if (f.getViaAirport() == null || f.getViaAirport().isBlank()) {
				errors.rejectValue("viaAirport", "required", "경유 공항을 골라 주세요.");
			} else if (f.getViaAirport().equals(f.getOriginAirport()) || f.getViaAirport().equals(f.getArrivalAirport())) {
				errors.rejectValue("viaAirport", "same", "경유 공항은 출발·도착 공항과 달라야 해요.");
			}
		} else {
			f.setViaAirport(null);
		}
		if (f.operatingDays().indexOf('1') < 0) {
			errors.rejectValue("days", "required", "운항 요일을 하나 이상 골라 주세요.");
		}
		boolean any = false;
		for (int i = 0; i < f.getFares().size(); i++) {
			FlightForm.FareForm r = f.getFares().get(i);
			if (!r.isEnabled()) {
				continue;
			}
			any = true;
			String at = "fares[" + i + "].";
			int tax = r.getTaxFuel() == null ? 0 : r.getTaxFuel();
			if (r.getTaxFuel() != null && r.getTaxFuel() < 0) {
				errors.rejectValue(at + "taxFuel", "min", "세금·유류할증료는 0 이상이에요.");
			}
			if (r.getPrice() == null || r.getPrice() < 10000 || r.getPrice() > 50000000) {
				errors.rejectValue(at + "price", "range", "표시 가격은 10,000~50,000,000원 사이예요.");
			} else if (r.getPrice() <= tax) {
				errors.rejectValue(at + "price", "tax", "표시 가격은 세금·유류할증료보다 커야 해요.");
			}
			if (r.getSeatsTotal() == null || r.getSeatsTotal() < 1 || r.getSeatsTotal() > 1000) {
				errors.rejectValue(at + "seatsTotal", "range", "전체 좌석은 1~1,000석이에요.");
			} else if (r.getSeatsLeft() != null && (r.getSeatsLeft() < 0 || r.getSeatsLeft() > r.getSeatsTotal())) {
				errors.rejectValue(at + "seatsLeft", "range", "남은 좌석은 0~전체 좌석 사이예요.");
			}
			if (r.getChangeFee() != null && r.getChangeFee() < 0) {
				errors.rejectValue(at + "changeFee", "min", "변경 수수료는 0 이상이에요.");
			}
			try {
				double m = r.getMileageRate() == null || r.getMileageRate().isBlank() ? 0 : Double.parseDouble(r.getMileageRate());
				if (m < 0 || m > 9.99) {
					throw new NumberFormatException();
				}
			} catch (NumberFormatException e) {
				errors.rejectValue(at + "mileageRate", "range", "적립률은 0~9.99 사이 숫자예요.");
			}
		}
		if (!any) {
			errors.reject("fares", "좌석 등급을 하나 이상 체크하고 요금을 입력해 주세요.");
		}
		if (f.getFlightNo() != null && !errors.hasFieldErrors("flightNo")) {
			Integer dup = (selfId == null
				? jdbc.sql("SELECT COUNT(*) FROM flight WHERE flight_no = :no").param("no", f.getFlightNo())
				: jdbc.sql("SELECT COUNT(*) FROM flight WHERE flight_no = :no AND flight_id <> :self").param("no", f.getFlightNo()).param("self", selfId))
				.query(Integer.class).single();
			if (dup > 0) {
				errors.rejectValue("flightNo", "dup", "이미 같은 편명이 있어요(삭제 탭 포함).");
			}
		}
	}

	@PostMapping(BASE)
	public String create(@AuthenticationPrincipal AppUser admin, @Validated @ModelAttribute("flightForm") FlightForm f,
		BindingResult errors, Model model) {
		check(f, errors, null);
		if (!errors.hasErrors()) {
			try {
				long id = service.create(f);
				audit.record(admin.getId(), "FLIGHT_CREATE", "flight", id, f.getFlightNo());
				return "redirect:" + BASE + "?saved";
			} catch (IllegalArgumentException e) {
				errors.reject("plan", e.getMessage());
			}
		}
		return form(model, BASE, "항공편 등록", false);
	}

	@GetMapping(BASE + "/{id}/edit")
	public String editForm(@PathVariable long id, Model model) {
		var rows = jdbc.sql("SELECT * FROM flight WHERE flight_id = :id AND status <> 'DELETED'").param("id", id).query().listOfRows();
		if (rows.isEmpty()) {
			throw AdminProductSupport.notFound();
		}
		var r = AdminFlightService.ci(rows.get(0));
		FlightForm f = new FlightForm();
		f.setFlightNo((String) r.get("flight_no"));
		f.setAirlineCode((String) r.get("airline_code"));
		f.setDestinationId(((Number) r.get("destination_id")).longValue());
		f.setOriginAirport(((String) r.get("origin_airport")).trim());
		f.setArrivalAirport(((String) r.get("arrival_airport")).trim());
		f.setFlightType((String) r.get("flight_type"));
		Object dep = r.get("departure_time");
		f.setDepartureTime(dep instanceof java.sql.Time t ? t.toLocalTime() : (LocalTime) dep);
		f.setDurationMinutes(((Number) r.get("duration_minutes")).intValue());
		f.setAircraft((String) r.get("aircraft"));
		f.setBaggageKg(r.get("baggage_kg") == null ? null : ((Number) r.get("baggage_kg")).intValue());
		f.setMealIncluded(Boolean.TRUE.equals(r.get("meal_included")));
		f.setOperatingDays((String) r.get("operating_days"));
		if ("CONNECTING".equals(f.getFlightType())) {
			jdbc.sql("SELECT to_airport FROM flight_segment WHERE flight_id = :id AND seq = 1").param("id", id)
				.query(String.class).optional().ifPresent(v -> f.setViaAirport(v.trim()));
		}
		for (Map<String, Object> raw : jdbc.sql("SELECT * FROM flight_fare WHERE flight_id = :id").param("id", id).query().listOfRows()) {
			var fr = AdminFlightService.ci(raw);
			int idx = FlightForm.CABINS.indexOf((String) fr.get("cabin_class"));
			if (idx < 0) {
				continue;
			}
			FlightForm.FareForm row = f.getFares().get(idx);
			row.setEnabled(true);
			int tax = ((Number) fr.get("tax_fuel")).intValue();
			row.setTaxFuel(tax);
			row.setPrice(((Number) fr.get("base_price")).intValue() + tax);
			row.setSeatsTotal(((Number) fr.get("seats_total")).intValue());
			row.setSeatsLeft(((Number) fr.get("seats_left")).intValue());
			row.setRefundable(Boolean.TRUE.equals(fr.get("refundable")));
			row.setChangeFee(((Number) fr.get("change_fee")).intValue());
			row.setMileageRate(String.valueOf(fr.get("mileage_rate")));
		}
		model.addAttribute("flightForm", f);
		return form(model, BASE + "/" + id, "항공편 수정", true);
	}

	@PostMapping(BASE + "/{id}")
	public String update(@AuthenticationPrincipal AppUser admin, @PathVariable long id,
		@Validated @ModelAttribute("flightForm") FlightForm f, BindingResult errors, Model model) {
		requireExists(id);
		check(f, errors, id);
		if (!errors.hasErrors()) {
			try {
				service.update(id, f);
				audit.record(admin.getId(), "FLIGHT_UPDATE", "flight", id, f.getFlightNo());
				return "redirect:" + BASE + "?saved";
			} catch (IllegalArgumentException e) {
				errors.reject("plan", e.getMessage());
			}
		}
		return form(model, BASE + "/" + id, "항공편 수정", true);
	}

	private void requireExists(long id) {
		if (jdbc.sql("SELECT COUNT(*) FROM flight WHERE flight_id = :id").param("id", id).query(Integer.class).single() == 0) {
			throw AdminProductSupport.notFound();
		}
	}

	@PostMapping(BASE + "/{id}/delete")
	public String delete(@AuthenticationPrincipal AppUser admin, @PathVariable long id) {
		requireExists(id);
		jdbc.sql("UPDATE flight SET status = 'DELETED' WHERE flight_id = :id").param("id", id).update();
		audit.record(admin.getId(), "FLIGHT_DELETE", "flight", id, "삭제 탭으로 이동");
		return "redirect:" + BASE + "?deleted";
	}

	@PostMapping(BASE + "/{id}/restore")
	public String restore(@AuthenticationPrincipal AppUser admin, @PathVariable long id) {
		requireExists(id);
		jdbc.sql("UPDATE flight SET status = 'ON_SALE' WHERE flight_id = :id AND status = 'DELETED'").param("id", id).update();
		audit.record(admin.getId(), "FLIGHT_RESTORE", "flight", id, "삭제 탭에서 복구");
		return "redirect:" + BASE + "?tab=trash&restored";
	}

	@PostMapping(BASE + "/{id}/purge")
	public String purge(@AuthenticationPrincipal AppUser admin, @PathVariable long id) {
		requireExists(id);
		if (!service.purge(id)) {
			return "redirect:" + BASE + "?error=" + URLEncoder.encode("삭제 탭에 있는 항공편만 영구 삭제할 수 있어요.", StandardCharsets.UTF_8);
		}
		audit.record(admin.getId(), "FLIGHT_PURGE", "flight", id, "영구 삭제");
		return "redirect:" + BASE + "?tab=trash&purged";
	}
}
