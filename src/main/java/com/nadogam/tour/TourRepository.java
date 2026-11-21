package com.nadogam.tour;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.stereotype.Repository;

// 투어 조회(읽기 전용): 목록(범위·테마·검색), 상세, 기간 옵션, 일차별 일정
@Repository
public class TourRepository {

	private static final String PLACE_JOIN = """
		FROM tour t
		LEFT JOIN destination d ON d.destination_id = t.destination_id
		LEFT JOIN domestic_city c ON c.city_id = t.city_id
		""";

	// 국가·대륙은 여행지의 국가로 정하고, 국내 도시 투어(여행지가 없음)는 한국(아시아)으로 본다.
	private static final String COUNTRY_JOIN = " JOIN country co ON co.country_code = COALESCE(d.country_code, 'KR')";

	// 대륙·국가별 투어 수(필터 칩에 보여 줄 값). 범위·테마·검색어는 목록과 같은 조건으로 적용한다.
	public record Facet(String region, String countryCode, String countryName, long count) {
	}

	// 해외 탭에는 국내 도시(한국)가 여행지인 투어(서울·부산)를 넣지 않는다. 국내 도시 투어(여행지 없음)는 그대로 둔다.
	private static final String NOT_KR_DESTINATION = "(t.destination_id IS NULL OR d.country_code <> 'KR')";

	private final JdbcClient jdbc;

	public TourRepository(JdbcClient jdbc) {
		this.jdbc = jdbc;
	}

	// scope: OVERSEAS / DOMESTIC, theme: TourTheme 이름, keyword: 여행지·투어 이름 검색. 값이 null 이거나 비어 있으면 거르지 않는다.
	public List<TourCard> cards(String scope, String theme, String keyword) {
		return cards(scope, theme, keyword, null, null);
	}

	// region: 대륙 코드(EUROPE 등), country: 국가 코드(2자). 값이 null 이거나 비어 있으면 거르지 않는다.
	public List<TourCard> cards(String scope, String theme, String keyword, String region, String country) {
		StringBuilder sql = new StringBuilder("""
			SELECT t.tour_id, t.scope, t.theme, t.title, t.subtitle, t.collab_brand,
			       COALESCE(d.name_ko, c.name_ko) AS place_name, COALESCE(d.name_en, '') AS place_en,
			       COALESCE(d.poster_color_from, c.poster_color_from) AS color_from,
			       COALESCE(d.poster_color_to, c.poster_color_to) AS color_to,
			       (SELECT MIN(o.price_per_person) FROM tour_option o WHERE o.tour_id = t.tour_id) AS min_price,
			       (SELECT MIN(o.nights) FROM tour_option o WHERE o.tour_id = t.tour_id) AS min_nights,
			       (SELECT MAX(o.nights) FROM tour_option o WHERE o.tour_id = t.tour_id) AS max_nights,
			       t.view_count, t.sales_count, t.agency_pick
			""").append(PLACE_JOIN).append(COUNTRY_JOIN).append(" WHERE t.status = 'ON_SALE' AND " + NOT_KR_DESTINATION);
		Map<String, Object> params = new HashMap<>();
		if (region != null && !region.isBlank()) {
			sql.append(" AND co.region = :region");
			params.put("region", region);
		}
		if (country != null && !country.isBlank()) {
			sql.append(" AND co.country_code = :country");
			params.put("country", country);
		}
		if (scope != null && !scope.isBlank()) {
			sql.append(" AND t.scope = :scope");
			params.put("scope", scope);
		}
		if (theme != null && !theme.isBlank()) {
			sql.append(" AND t.theme = :theme");
			params.put("theme", theme);
		}
		if (keyword != null && !keyword.isBlank()) {
			sql.append(" AND (LOWER(COALESCE(d.name_ko, c.name_ko)) LIKE :kw OR LOWER(COALESCE(d.name_en, '')) LIKE :kw OR LOWER(t.title) LIKE :kw)");
			params.put("kw", "%" + keyword.trim().toLowerCase() + "%");
		}
		sql.append(" ORDER BY t.sort_order, t.tour_id");
		return jdbc.sql(sql.toString()).params(params).query(TourCard.class).list();
	}

	public List<Facet> facets(String scope, String theme, String keyword) {
		StringBuilder sql = new StringBuilder("SELECT co.region, co.country_code, co.name_ko AS country_name, COUNT(*) AS count ")
			.append(PLACE_JOIN).append(COUNTRY_JOIN).append(" WHERE t.status = 'ON_SALE' AND " + NOT_KR_DESTINATION);
		Map<String, Object> params = new HashMap<>();
		if (scope != null && !scope.isBlank()) {
			sql.append(" AND t.scope = :scope");
			params.put("scope", scope);
		}
		if (theme != null && !theme.isBlank()) {
			sql.append(" AND t.theme = :theme");
			params.put("theme", theme);
		}
		if (keyword != null && !keyword.isBlank()) {
			sql.append(" AND (LOWER(COALESCE(d.name_ko, c.name_ko)) LIKE :kw OR LOWER(COALESCE(d.name_en, '')) LIKE :kw OR LOWER(t.title) LIKE :kw)");
			params.put("kw", "%" + keyword.trim().toLowerCase() + "%");
		}
		sql.append(" GROUP BY co.region, co.country_code, co.name_ko ORDER BY co.region, co.name_ko");
		return jdbc.sql(sql.toString()).params(params).query(Facet.class).list();
	}

	// 투어 상세를 열 때마다 조회수를 1 올린다.
	public void countView(long tourId) {
		jdbc.sql("UPDATE tour SET view_count = view_count + 1 WHERE tour_id = :id").param("id", tourId).update();
	}

	public Optional<TourDetail> detail(long tourId) {
		return jdbc.sql("""
			SELECT t.tour_id, t.scope, t.theme, t.title, t.subtitle, t.collab_brand, t.highlights, t.includes, t.excludes,
			       t.source_note, t.status,
			       COALESCE(d.name_ko, c.name_ko) AS place_name, COALESCE(d.name_en, '') AS place_en,
			       COALESCE(d.poster_color_from, c.poster_color_from) AS color_from,
			       COALESCE(d.poster_color_to, c.poster_color_to) AS color_to
			""" + PLACE_JOIN + " WHERE t.tour_id = :id AND t.status = 'ON_SALE' AND " + NOT_KR_DESTINATION)
			.param("id", tourId).query(TourDetail.class).optional();
	}

	public List<TourOptionView> options(long tourId) {
		return jdbc.sql("SELECT option_id, nights, days, price_per_person, min_people, max_people FROM tour_option WHERE tour_id = :id ORDER BY nights")
			.param("id", tourId).query(TourOptionView.class).list();
	}

	public List<TourDayView> days(long optionId) {
		return jdbc.sql("SELECT day_no, title, description FROM tour_day WHERE option_id = :id ORDER BY day_no")
			.param("id", optionId).query(TourDayView.class).list();
	}

	// 여행지(해외)에 연결된 투어: 해외 여행 상세에서 '이 여행지의 투어'로 연결할 때 쓴다.
	public List<TourCard> cardsOfDestination(long destinationId) {
		return cards("OVERSEAS", null, null).stream()
			.filter(c -> jdbc.sql("SELECT COUNT(*) FROM tour WHERE tour_id = :t AND destination_id = :d")
				.param("t", c.tourId()).param("d", destinationId).query(Long.class).single() > 0)
			.toList();
	}

	// 국내 도시에 연결된 투어(3테마): 국내여행 상세에서 '이 도시의 투어'로 연결할 때 쓴다.
	public List<TourCard> cardsOfCity(long cityId) {
		return jdbc.sql("""
			SELECT t.tour_id, t.scope, t.theme, t.title, t.subtitle, t.collab_brand,
			       c.name_ko AS place_name, '' AS place_en, c.poster_color_from AS color_from, c.poster_color_to AS color_to,
			       (SELECT MIN(o.price_per_person) FROM tour_option o WHERE o.tour_id = t.tour_id) AS min_price,
			       (SELECT MIN(o.nights) FROM tour_option o WHERE o.tour_id = t.tour_id) AS min_nights,
			       (SELECT MAX(o.nights) FROM tour_option o WHERE o.tour_id = t.tour_id) AS max_nights,
			       t.view_count, t.sales_count, t.agency_pick
			FROM tour t JOIN domestic_city c ON c.city_id = t.city_id
			WHERE t.city_id = :id AND t.status = 'ON_SALE' ORDER BY t.sort_order, t.tour_id
			""").param("id", cityId).query(TourCard.class).list();
	}
}
