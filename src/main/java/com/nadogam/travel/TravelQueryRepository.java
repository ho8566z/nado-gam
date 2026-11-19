package com.nadogam.travel;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.stereotype.Repository;

// 메인·특별기획·베스트셀러 화면용 읽기 전용 조회. 쓰기 기능(계정, 관리자)이 붙으면 JPA 엔티티를 추가한다.
@Repository
public class TravelQueryRepository {

	private static final List<String> CABIN_ORDER = List.of("ECONOMY", "PREMIUM", "BUSINESS", "FIRST");

	private static final String PLAN_SQL = """
		SELECT p.plan_id, p.destination_id, d.name_ko, d.name_en, p.title, p.subtitle, p.badge_text, p.highlights,
		       d.poster_color_from, d.poster_color_to, p.end_at,
		       MIN(m.sale_price) AS min_sale_price,
		       (SELECT x.original_price FROM monthly_plan_flight x WHERE x.plan_id = p.plan_id
		         ORDER BY x.sale_price ASC LIMIT 1) AS min_original_price,
		       MAX(ROUND((m.original_price - m.sale_price) * 100.0 / m.original_price)) AS max_discount,
		       COUNT(DISTINCT m.flight_id) AS flight_count
		FROM monthly_plan p
		JOIN destination d ON d.destination_id = p.destination_id
		JOIN monthly_plan_flight m ON m.plan_id = p.plan_id
		WHERE p.is_active = TRUE AND p.start_at <= :now AND p.end_at >= :now %s
		GROUP BY p.plan_id, p.destination_id, d.name_ko, d.name_en, p.title, p.subtitle, p.badge_text, p.highlights,
		         d.poster_color_from, d.poster_color_to, p.end_at
		ORDER BY p.plan_id
		""";

	private static final String BEST_SQL = """
		SELECT d.destination_id, d.name_ko, d.name_en, d.summary, d.poster_color_from, d.poster_color_to,
		       SUM(s.sales_count) AS total_sales,
		       COUNT(DISTINCT f.flight_id) AS flight_count,
		       MIN(ff.base_price + ff.tax_fuel) AS min_price
		FROM flight_sales_stat s
		JOIN flight f ON f.flight_id = s.flight_id
		JOIN destination d ON d.destination_id = f.destination_id
		JOIN flight_fare ff ON ff.flight_id = f.flight_id AND ff.cabin_class = 'ECONOMY'
		WHERE s.rank_no IS NOT NULL %s
		GROUP BY d.destination_id, d.name_ko, d.name_en, d.summary, d.poster_color_from, d.poster_color_to
		ORDER BY total_sales DESC
		""";

	private static final String FLIGHT_SQL = """
		SELECT f.flight_id, f.flight_no, a.name_ko AS airline_name, f.flight_type,
		       f.origin_airport AS origin_code, ao.city_name_ko AS origin_city,
		       f.arrival_airport AS arrival_code, aa.city_name_ko AS arrival_city,
		       (SELECT ap.city_name_ko FROM flight_segment sg JOIN airport ap ON ap.airport_code = sg.to_airport
		         WHERE sg.flight_id = f.flight_id AND sg.seq = 1 AND f.stops > 0) AS via_city,
		       f.departure_time, f.arrival_time, f.arrival_day_offset, f.duration_minutes,
		       s.rank_no, s.sales_count
		FROM flight f
		JOIN airline a ON a.airline_code = f.airline_code
		JOIN airport ao ON ao.airport_code = f.origin_airport
		JOIN airport aa ON aa.airport_code = f.arrival_airport
		LEFT JOIN flight_sales_stat s ON s.flight_id = f.flight_id
		WHERE f.flight_id IN (:ids)
		""";

	private final JdbcClient jdbc;

	public TravelQueryRepository(JdbcClient jdbc) {
		this.jdbc = jdbc;
	}

	// ---------- 이달의 특별기획 ----------

	public List<PlanCard> activePlans(LocalDateTime now) {
		return jdbc.sql(PLAN_SQL.formatted("")).param("now", now).query(PlanCard.class).list();
	}

	public Optional<PlanCard> plan(long planId, LocalDateTime now) {
		return jdbc.sql(PLAN_SQL.formatted("AND p.plan_id = :planId")).param("now", now).param("planId", planId)
			.query(PlanCard.class).optional();
	}

	public Optional<PlanDetail> planDetail(long planId, LocalDateTime now) {
		return plan(planId, now).map(card -> {
			record PlanFare(long flightId, String cabinClass, int originalPrice, int salePrice, int limitedSeats) {
			}
			List<PlanFare> fares = jdbc.sql("""
				SELECT flight_id, cabin_class, original_price, sale_price, limited_seats
				FROM monthly_plan_flight WHERE plan_id = :planId ORDER BY display_order, flight_id
				""").param("planId", planId).query(PlanFare.class).list();

			Map<Long, List<CabinPrice>> byFlight = new LinkedHashMap<>();
			for (PlanFare f : fares) {
				byFlight.computeIfAbsent(f.flightId(), k -> new ArrayList<>())
					.add(new CabinPrice(f.cabinClass(), f.originalPrice(), f.salePrice(), f.limitedSeats()));
			}
			Map<Long, FlightInfo> infos = flightInfos(byFlight.keySet());
			List<PlanFlight> flights = new ArrayList<>();
			byFlight.forEach((flightId, cabins) -> {
				cabins.sort((a, b) -> Integer.compare(CABIN_ORDER.indexOf(a.cabinClass()), CABIN_ORDER.indexOf(b.cabinClass())));
				flights.add(new PlanFlight(infos.get(flightId), cabins));
			});
			return new PlanDetail(card, flights);
		});
	}

	// ---------- 베스트셀러 ----------

	public List<BestCard> bestsellers(int limit) {
		return jdbc.sql(BEST_SQL.formatted("") + " LIMIT " + limit).query(BestCard.class).list();
	}

	public Optional<BestCard> bestseller(long destinationId) {
		return jdbc.sql(BEST_SQL.formatted("AND d.destination_id = :destinationId")).param("destinationId", destinationId)
			.query(BestCard.class).optional();
	}

	public Optional<BestDetail> bestDetail(long destinationId) {
		return bestseller(destinationId).map(card -> {
			List<Long> ids = jdbc.sql("""
				SELECT s.flight_id FROM flight_sales_stat s JOIN flight f ON f.flight_id = s.flight_id
				WHERE f.destination_id = :destinationId AND s.rank_no IS NOT NULL ORDER BY s.rank_no
				""").param("destinationId", destinationId).query(Long.class).list();
			Map<Long, FlightInfo> infos = flightInfos(ids);
			Map<Long, List<FarePrice>> fares = fares(ids);
			List<BestFlight> flights = ids.stream()
				.map(id -> new BestFlight(infos.get(id), fares.getOrDefault(id, List.of()))).toList();
			return new BestDetail(card, flights);
		});
	}

	// ---------- 공통 ----------

	private Map<Long, FlightInfo> flightInfos(Collection<Long> ids) {
		Map<Long, FlightInfo> map = new LinkedHashMap<>();
		if (ids.isEmpty()) {
			return map;
		}
		jdbc.sql(FLIGHT_SQL).param("ids", ids).query(FlightInfo.class).list().forEach(f -> map.put(f.flightId(), f));
		return map;
	}

	private Map<Long, List<FarePrice>> fares(Collection<Long> ids) {
		Map<Long, List<FarePrice>> map = new LinkedHashMap<>();
		if (ids.isEmpty()) {
			return map;
		}
		jdbc.sql("""
			SELECT flight_id, cabin_class, base_price + tax_fuel AS price FROM flight_fare WHERE flight_id IN (:ids)
			""").param("ids", ids).query(FarePrice.class).list()
			.forEach(f -> map.computeIfAbsent(f.flightId(), k -> new ArrayList<>()).add(f));
		map.values().forEach(list -> list.sort((a, b) -> Integer.compare(CABIN_ORDER.indexOf(a.cabinClass()), CABIN_ORDER.indexOf(b.cabinClass()))));
		return map;
	}
}
