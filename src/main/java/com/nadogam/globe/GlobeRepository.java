package com.nadogam.globe;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.stereotype.Repository;

import com.nadogam.globe.GlobeRoute.GlobePoint;

@Repository
public class GlobeRepository {

	private static final String ORIGIN = "ICN";

	private record Head(long destinationId, String nameKo, long flightId) {
	}

	private record Segment(long flightId, int seq, String fromAirport, String toAirport) {
	}

	private record AirportPos(String airportCode, String cityNameKo, double latitude, double longitude) {
	}

	private final JdbcClient jdbc;

	public GlobeRepository(JdbcClient jdbc) {
		this.jdbc = jdbc;
	}

	// 운항 가능한 여행지마다 인천 출발 항공편 중 가장 빠른 1편의 경로를 반환한다.
	public List<GlobeRoute> routesFromIncheon(Set<Long> featuredDestinationIds) {
		List<Head> heads = jdbc.sql("""
			SELECT f.destination_id, d.name_ko, f.flight_id
			FROM flight f JOIN destination d ON d.destination_id = f.destination_id
			WHERE f.origin_airport = :origin AND d.status = 'AVAILABLE' AND f.status = 'ON_SALE'
			ORDER BY f.destination_id, f.duration_minutes, f.flight_id
			""").param("origin", ORIGIN).query(Head.class).list();

		Map<Long, Head> fastest = new LinkedHashMap<>();
		heads.forEach(h -> fastest.putIfAbsent(h.destinationId(), h));
		if (fastest.isEmpty()) {
			return List.of();
		}

		List<Long> flightIds = fastest.values().stream().map(Head::flightId).toList();
		Map<Long, List<Segment>> segments = new LinkedHashMap<>();
		jdbc.sql("SELECT flight_id, seq, from_airport, to_airport FROM flight_segment WHERE flight_id IN (:ids) ORDER BY flight_id, seq")
			.param("ids", flightIds).query(Segment.class).list()
			.forEach(s -> segments.computeIfAbsent(s.flightId(), k -> new ArrayList<>()).add(s));

		Map<String, AirportPos> airports = new LinkedHashMap<>();
		jdbc.sql("SELECT airport_code, city_name_ko, latitude, longitude FROM airport").query(AirportPos.class).list()
			.forEach(a -> airports.put(a.airportCode(), a));

		List<GlobeRoute> routes = new ArrayList<>();
		for (Head head : fastest.values()) {
			List<Segment> segs = segments.getOrDefault(head.flightId(), List.of());
			if (segs.isEmpty()) {
				continue;
			}
			List<GlobePoint> points = new ArrayList<>();
			points.add(point(airports.get(segs.get(0).fromAirport())));
			segs.forEach(s -> points.add(point(airports.get(s.toAirport()))));
			routes.add(new GlobeRoute(head.destinationId(), head.nameKo(), featuredDestinationIds.contains(head.destinationId()), points));
		}
		return routes;
	}

	private static GlobePoint point(AirportPos a) {
		return new GlobePoint(a.airportCode(), a.cityNameKo(), a.latitude(), a.longitude());
	}
}
