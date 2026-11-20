package com.nadogam.domestic;

import java.util.List;
import java.util.Optional;

import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.stereotype.Repository;

// 국내여행 조회(읽기 전용): 도시 목록·상세, 출발지별 이동편
@Repository
public class DomesticRepository {

	private static final String CITY_SELECT = """
		SELECT c.city_id, c.name_ko AS name, c.province, c.summary, c.poster_color_from AS color_from, c.poster_color_to AS color_to,
		       (SELECT COUNT(*) FROM tour t WHERE t.city_id = c.city_id AND t.status = 'ON_SALE') AS tour_count,
		       COALESCE((SELECT MIN(x.fare) FROM domestic_transport x WHERE x.city_id = c.city_id), 0) AS min_fare
		FROM domestic_city c
		""";

	private final JdbcClient jdbc;

	public DomesticRepository(JdbcClient jdbc) {
		this.jdbc = jdbc;
	}

	public List<DomesticCity> cities() {
		return jdbc.sql(CITY_SELECT + " WHERE c.status = 'AVAILABLE' ORDER BY c.sort_order").query(DomesticCity.class).list();
	}

	public Optional<DomesticCity> city(long id) {
		return jdbc.sql(CITY_SELECT + " WHERE c.status = 'AVAILABLE' AND c.city_id = :id").param("id", id).query(DomesticCity.class).optional();
	}

	// origin: SEOUL / DAEJEON. 값이 null 이면 두 출발지 모두.
	public List<DomesticTransport> transports(long cityId, String origin) {
		String sql = """
			SELECT transport_id, origin, mode, name, depart_time, duration_minutes, fare, note
			FROM domestic_transport WHERE city_id = :cityId
			""" + (origin == null ? "" : " AND origin = :origin") + " ORDER BY origin DESC, sort_order";
		JdbcClient.StatementSpec spec = jdbc.sql(sql).param("cityId", cityId);
		if (origin != null) {
			spec = spec.param("origin", origin);
		}
		return spec.query(DomesticTransport.class).list();
	}
}
