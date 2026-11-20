package com.nadogam.stay;

import java.util.List;
import java.util.Optional;

import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.stereotype.Repository;

// 호텔·크루즈 조회(읽기 전용)
@Repository
public class StayRepository {

	private static final String HOTEL_SELECT = """
		SELECT hotel_id, name, grade, area, summary, amenities, price_per_night
		FROM hotel WHERE status = 'ON_SALE'
		""";

	private final JdbcClient jdbc;

	public StayRepository(JdbcClient jdbc) {
		this.jdbc = jdbc;
	}

	public List<HotelItem> hotelsOfDestination(long destinationId) {
		return jdbc.sql(HOTEL_SELECT + " AND destination_id = :id ORDER BY grade DESC, price_per_night DESC")
			.param("id", destinationId).query(HotelItem.class).list();
	}

	public List<HotelItem> hotelsOfCity(long cityId) {
		return jdbc.sql(HOTEL_SELECT + " AND city_id = :id ORDER BY grade DESC, price_per_night DESC")
			.param("id", cityId).query(HotelItem.class).list();
	}

	public Optional<CruiseItem> cruiseOfDestination(long destinationId) {
		return jdbc.sql("""
			SELECT cruise_id, destination_id, title, ship_name, departure_port, itinerary, nights, price_inside, price_balcony, highlights
			FROM cruise WHERE status = 'ON_SALE' AND destination_id = :id
			""").param("id", destinationId).query(CruiseItem.class).optional();
	}
}
