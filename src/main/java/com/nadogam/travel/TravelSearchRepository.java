package com.nadogam.travel;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.stereotype.Repository;

// 해외 여행 화면용 읽기 전용 조회: 여행지 목록 → 출발지 → 항공편 목록 → 항공편 상세
@Repository
public class TravelSearchRepository {

	public static final String TYPE_ALL = "all";
	public static final String TYPE_DIRECT = "direct";
	public static final String TYPE_CONNECTING = "connecting";

	public static final String SORT_PRICE = "price";
	public static final String SORT_DURATION = "duration";
	public static final String SORT_DEPARTURE = "departure";

	private static final String DESTINATION_SQL = """
		SELECT d.destination_id, d.name_ko, d.name_en, c.name_ko AS country_name, c.region, d.status, d.unavailable_reason,
		       d.summary, d.poster_color_from, d.poster_color_to,
		       (SELECT COUNT(*) FROM flight f WHERE f.destination_id = d.destination_id AND f.status = 'ON_SALE') AS flight_count,
		       (SELECT MIN(ff.base_price + ff.tax_fuel) FROM flight f
		          JOIN flight_fare ff ON ff.flight_id = f.flight_id AND ff.cabin_class = 'ECONOMY'
		         WHERE f.destination_id = d.destination_id AND f.status = 'ON_SALE') AS min_price
		FROM destination d JOIN country c ON c.country_code = d.country_code
		""";

	private final JdbcClient jdbc;
	private final TravelQueryRepository query;

	public TravelSearchRepository(JdbcClient jdbc, TravelQueryRepository query) {
		this.jdbc = jdbc;
		this.query = query;
	}

	public List<DestinationItem> destinations() {
		return jdbc.sql(DESTINATION_SQL + " ORDER BY d.sort_order").query(DestinationItem.class).list();
	}

	public Optional<DestinationItem> destination(long destinationId) {
		return jdbc.sql(DESTINATION_SQL + " WHERE d.destination_id = :id").param("id", destinationId)
			.query(DestinationItem.class).optional();
	}

	// 그 여행지로 가는 항공편이 있는 출발지만 반환한다. (공항 데이터에 출발지 표시를 따로 두지 않는다)
	public List<OriginOption> origins(long destinationId) {
		return jdbc.sql("""
			SELECT f.origin_airport AS airport_code, ao.city_name_ko AS city_name, ao.name_ko AS airport_name,
			       COUNT(*) AS flight_count, MIN(ff.base_price + ff.tax_fuel) AS min_price
			FROM flight f
			JOIN airport ao ON ao.airport_code = f.origin_airport
			JOIN flight_fare ff ON ff.flight_id = f.flight_id AND ff.cabin_class = 'ECONOMY'
			WHERE f.destination_id = :id AND f.status = 'ON_SALE'
			GROUP BY f.origin_airport, ao.city_name_ko, ao.name_ko
			ORDER BY flight_count DESC, f.origin_airport
			""").param("id", destinationId).query(OriginOption.class).list();
	}

	public FlightSearch search(long destinationId, String origin, String type, String sort) {
		String typeCondition = switch (type) {
			case TYPE_DIRECT -> "AND f.flight_type = 'DIRECT'";
			case TYPE_CONNECTING -> "AND f.flight_type = 'CONNECTING'";
			default -> "";
		};
		String order = switch (sort) {
			case SORT_DURATION -> "f.duration_minutes, (ff.base_price + ff.tax_fuel)";
			case SORT_DEPARTURE -> "f.departure_time, (ff.base_price + ff.tax_fuel)";
			default -> "(ff.base_price + ff.tax_fuel), f.duration_minutes";
		};
		List<Long> ids = jdbc.sql("""
			SELECT f.flight_id FROM flight f
			JOIN flight_fare ff ON ff.flight_id = f.flight_id AND ff.cabin_class = 'ECONOMY'
			WHERE f.destination_id = :id AND f.origin_airport = :origin AND f.status = 'ON_SALE' %s
			ORDER BY %s, f.flight_id
			""".formatted(typeCondition, order)).param("id", destinationId).param("origin", origin).query(Long.class).list();

		Map<Long, FlightInfo> infos = query.flightInfos(ids);
		Map<Long, List<FarePrice>> fares = query.fares(ids);
		List<FlightOption> flights = ids.stream()
			.map(id -> new FlightOption(infos.get(id), fares.getOrDefault(id, List.of()))).toList();

		record Counts(int total, int direct) {
		}
		Counts counts = jdbc.sql("""
			SELECT COUNT(*) AS total, COALESCE(SUM(CASE WHEN flight_type = 'DIRECT' THEN 1 ELSE 0 END), 0) AS direct
			FROM flight WHERE destination_id = :id AND origin_airport = :origin AND status = 'ON_SALE'
			""").param("id", destinationId).param("origin", origin).query(Counts.class).single();
		return new FlightSearch(flights, counts.total(), counts.direct(), counts.total() - counts.direct());
	}

	public Optional<FlightDetail> flightDetail(long flightId) {
		Map<Long, FlightInfo> infos = query.flightInfos(List.of(flightId));
		FlightInfo info = infos.get(flightId);
		if (info == null) {
			return Optional.empty();
		}
		record Extra(long destinationId, String destinationName, String aircraft, Integer baggageKg, boolean mealIncluded, String operatingDays) {
		}
		Extra extra = jdbc.sql("""
			SELECT f.destination_id, d.name_ko AS destination_name, f.aircraft, f.baggage_kg, f.meal_included, f.operating_days
			FROM flight f JOIN destination d ON d.destination_id = f.destination_id WHERE f.flight_id = :id
			""").param("id", flightId).query(Extra.class).single();

		List<SegmentView> segments = jdbc.sql("""
			SELECT s.seq, s.from_airport, fa.city_name_ko AS from_city, s.to_airport, ta.city_name_ko AS to_city,
			       s.duration_minutes, s.layover_minutes
			FROM flight_segment s
			JOIN airport fa ON fa.airport_code = s.from_airport
			JOIN airport ta ON ta.airport_code = s.to_airport
			WHERE s.flight_id = :id ORDER BY s.seq
			""").param("id", flightId).query(SegmentView.class).list();

		List<String> cabinOrder = List.of("ECONOMY", "PREMIUM", "BUSINESS", "FIRST");
		List<FareDetail> fares = jdbc.sql("""
			SELECT cabin_class, base_price, tax_fuel, seats_left, seats_total, refundable, change_fee, mileage_rate
			FROM flight_fare WHERE flight_id = :id
			""").param("id", flightId).query(FareDetail.class).list().stream()
			.sorted((a, b) -> Integer.compare(cabinOrder.indexOf(a.cabinClass()), cabinOrder.indexOf(b.cabinClass()))).toList();

		return Optional.of(new FlightDetail(info, extra.destinationId(), extra.destinationName(), extra.aircraft(),
			extra.baggageKg(), extra.mealIncluded(), extra.operatingDays(), segments, fares));
	}
}
