package com.nadogam.admin;

import java.time.Instant;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

// 관리자 항공편 저장: 도착 시각(시간대 차이)과 경유 구간 시간을 계산해 flight·flight_segment·flight_fare 를 함께 저장한다.
// 입력이 계산할 수 없는 값이면 화면에 그대로 보여 줄 메시지와 함께 IllegalArgumentException 을 던진다.
@Service
public class AdminFlightService {

	private final JdbcClient jdbc;

	public AdminFlightService(JdbcClient jdbc) {
		this.jdbc = jdbc;
	}

	// 컬럼 이름 대소문자가 DB 마다 달라서 대소문자를 구분하지 않는 맵으로 바꿔 쓴다.
	static Map<String, Object> ci(Map<String, Object> row) {
		Map<String, Object> m = new TreeMap<>(String.CASE_INSENSITIVE_ORDER);
		m.putAll(row);
		return m;
	}

	record Airport(String code, double lat, double lng, int offsetMinutes) {
	}

	private Airport airport(String code) {
		var rows = jdbc.sql("SELECT airport_code, latitude, longitude, timezone FROM airport WHERE airport_code = :c")
			.param("c", code).query().listOfRows();
		if (rows.isEmpty()) {
			throw new IllegalArgumentException("없는 공항 코드예요: " + code);
		}
		var r = ci(rows.get(0));
		int offset = ZoneId.of((String) r.get("timezone")).getRules().getStandardOffset(Instant.now()).getTotalSeconds() / 60;   // 표준시 기준(서머타임 없음)
		return new Airport(code, ((Number) r.get("latitude")).doubleValue(), ((Number) r.get("longitude")).doubleValue(), offset);
	}

	private static double km(Airport a, Airport b) {
		double la1 = Math.toRadians(a.lat()), la2 = Math.toRadians(b.lat());
		double h = Math.pow(Math.sin((la2 - la1) / 2), 2)
			+ Math.cos(la1) * Math.cos(la2) * Math.pow(Math.sin(Math.toRadians(b.lng() - a.lng()) / 2), 2);
		return 6371 * 2 * Math.asin(Math.sqrt(h));
	}

	// 계산 결과: 도착 시각·일수 오프셋, 구간 시간
	record Plan(LocalTime arrival, int dayOffset, int seg1, int seg2, Integer layover) {
	}

	Plan plan(FlightForm f) {
		Airport from = airport(f.getOriginAirport());
		Airport to = airport(f.getArrivalAirport());
		int total = f.getDurationMinutes();
		int depMin = f.getDepartureTime().getHour() * 60 + f.getDepartureTime().getMinute();
		int arrAbs = depMin + total + (to.offsetMinutes() - from.offsetMinutes());   // 출발일 0시부터의 도착 현지 분
		if (arrAbs < 0) {
			throw new IllegalArgumentException("도착 현지 시각이 출발일보다 앞서요. 출발 시각을 늦추거나 소요 시간을 확인해 주세요.");
		}
		int offsetDays = arrAbs / 1440;
		int rest = arrAbs % 1440;
		LocalTime arrival = LocalTime.of(rest / 60, rest % 60);
		if ("CONNECTING".equals(f.getFlightType())) {
			Airport via = airport(f.getViaAirport());
			int e1 = (int) Math.round(km(from, via) / 820 * 60) + 30;
			int e2 = (int) Math.round(km(via, to) / 820 * 60) + 30;
			int layover = total - e1 - e2;
			if (layover < 60) {   // 추정 비행 시간이 너무 길면 대기 90분을 확보하도록 비율로 줄인다
				if (total <= 150) {
					throw new IllegalArgumentException("경유 항공편은 총 소요 시간이 최소 150분(2시간 30분) 이상이어야 해요.");
				}
				double scale = (total - 90.0) / (e1 + e2);
				e1 = (int) Math.round(e1 * scale);
				e2 = (int) Math.round(e2 * scale);
				layover = total - e1 - e2;
				if (layover < 60) {
					throw new IllegalArgumentException("총 소요 시간이 경유 구간에 비해 너무 짧아요. 시간을 늘려 주세요.");
				}
			}
			return new Plan(arrival, offsetDays, e1, e2, layover);
		}
		return new Plan(arrival, offsetDays, total, 0, null);
	}

	private Map<String, Object> flightParams(FlightForm f, Plan p) {
		Map<String, Object> m = new HashMap<>();
		boolean direct = "DIRECT".equals(f.getFlightType());
		m.put("no", f.getFlightNo());
		m.put("airline", f.getAirlineCode());
		m.put("dest", f.getDestinationId());
		m.put("origin", f.getOriginAirport());
		m.put("arrival", f.getArrivalAirport());
		m.put("type", f.getFlightType());
		m.put("stops", direct ? 0 : 1);
		m.put("dep", java.sql.Time.valueOf(f.getDepartureTime().withSecond(0)));
		m.put("arr", java.sql.Time.valueOf(p.arrival()));
		m.put("offset", p.dayOffset());
		m.put("duration", f.getDurationMinutes());
		m.put("aircraft", f.getAircraft() == null || f.getAircraft().isBlank() ? null : f.getAircraft().trim());
		m.put("baggage", f.getBaggageKg());
		m.put("meal", f.isMealIncluded());
		m.put("days", f.operatingDays());
		return m;
	}

	private void saveSegments(long flightId, FlightForm f, Plan p) {
		jdbc.sql("DELETE FROM flight_segment WHERE flight_id = :id").param("id", flightId).update();
		if ("DIRECT".equals(f.getFlightType())) {
			insertSegment(flightId, 1, f.getOriginAirport(), f.getArrivalAirport(), p.seg1(), null);
		} else {
			insertSegment(flightId, 1, f.getOriginAirport(), f.getViaAirport(), p.seg1(), p.layover());
			insertSegment(flightId, 2, f.getViaAirport(), f.getArrivalAirport(), p.seg2(), null);
		}
	}

	private void insertSegment(long flightId, int seq, String from, String to, int minutes, Integer layover) {
		jdbc.sql("""
			INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes)
			VALUES (:id, :seq, :from, :to, :min, :layover)
			""").param("id", flightId).param("seq", seq).param("from", from).param("to", to).param("min", minutes).param("layover", layover).update();
	}

	// 체크한 등급만 남기고, 이미 있는 등급은 고치고 새 등급은 넣는다. 체크를 푼 등급은 지운다.
	private void saveFares(long flightId, FlightForm f) {
		List<String> keep = new java.util.ArrayList<>();
		for (FlightForm.FareForm r : f.getFares()) {
			if (!r.isEnabled()) {
				continue;
			}
			keep.add(r.getCabin());
			int tax = r.getTaxFuel() == null ? 0 : r.getTaxFuel();
			int left = r.getSeatsLeft() == null ? r.getSeatsTotal() : r.getSeatsLeft();
			double mileage = r.getMileageRate() == null || r.getMileageRate().isBlank() ? 0 : Double.parseDouble(r.getMileageRate());
			int n = jdbc.sql("""
				UPDATE flight_fare SET base_price = :base, tax_fuel = :tax, seats_total = :total, seats_left = :left, refundable = :refund,
					change_fee = :change, mileage_rate = :mileage, version = version + 1
				WHERE flight_id = :id AND cabin_class = :cabin
				""").param("base", r.getPrice() - tax).param("tax", tax).param("total", r.getSeatsTotal()).param("left", left)
				.param("refund", r.isRefundable()).param("change", r.getChangeFee() == null ? 0 : r.getChangeFee())
				.param("mileage", mileage).param("id", flightId).param("cabin", r.getCabin()).update();
			if (n == 0) {
				jdbc.sql("""
					INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate)
					VALUES (:id, :cabin, :base, :tax, :total, :left, :refund, :change, :mileage)
					""").param("id", flightId).param("cabin", r.getCabin()).param("base", r.getPrice() - tax).param("tax", tax)
					.param("total", r.getSeatsTotal()).param("left", left).param("refund", r.isRefundable())
					.param("change", r.getChangeFee() == null ? 0 : r.getChangeFee()).param("mileage", mileage).update();
			}
		}
		for (String cabin : FlightForm.CABINS) {
			if (!keep.contains(cabin)) {
				jdbc.sql("DELETE FROM flight_fare WHERE flight_id = :id AND cabin_class = :cabin").param("id", flightId).param("cabin", cabin).update();
			}
		}
	}

	@Transactional
	public long create(FlightForm f) {
		Plan p = plan(f);
		var keys = new GeneratedKeyHolder();
		jdbc.sql("""
			INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time,
				arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status)
			VALUES (:no, :airline, :dest, :origin, :arrival, :type, :stops, :dep, :arr, :offset, :duration, :aircraft, :baggage, :meal, :days, 'ON_SALE')
			""").params(flightParams(f, p)).update(keys, "flight_id");
		long id = keys.getKey().longValue();
		saveSegments(id, f, p);
		saveFares(id, f);
		jdbc.sql("INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (:id, 0, NULL)").param("id", id).update();
		return id;
	}

	@Transactional
	public void update(long id, FlightForm f) {
		Plan p = plan(f);
		Map<String, Object> m = flightParams(f, p);
		m.put("id", id);
		int n = jdbc.sql("""
			UPDATE flight SET flight_no = :no, airline_code = :airline, destination_id = :dest, origin_airport = :origin, arrival_airport = :arrival,
				flight_type = :type, stops = :stops, departure_time = :dep, arrival_time = :arr, arrival_day_offset = :offset,
				duration_minutes = :duration, aircraft = :aircraft, baggage_kg = :baggage, meal_included = :meal, operating_days = :days,
				updated_at = CURRENT_TIMESTAMP
			WHERE flight_id = :id AND status <> 'DELETED'
			""").params(m).update();
		if (n == 0) {
			throw new IllegalArgumentException("없거나 삭제 탭에 있는 항공편이에요.");
		}
		saveSegments(id, f, p);
		saveFares(id, f);
	}

	// 삭제 탭에서 영구 삭제: 구간·요금·판매 집계·특별전 연결까지 지운다. 이미 한 예약에는 제목이 복사돼 있어 영향이 없다.
	@Transactional
	public boolean purge(long id) {
		Integer inTrash = jdbc.sql("SELECT COUNT(*) FROM flight WHERE flight_id = :id AND status = 'DELETED'").param("id", id).query(Integer.class).single();
		if (inTrash == 0) {
			return false;
		}
		for (String table : List.of("monthly_plan_flight", "flight_sales_stat", "flight_fare", "flight_segment")) {
			jdbc.sql("DELETE FROM " + table + " WHERE flight_id = :id").param("id", id).update();
		}
		jdbc.sql("DELETE FROM flight WHERE flight_id = :id").param("id", id).update();
		return true;
	}
}
