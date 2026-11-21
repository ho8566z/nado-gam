package com.nadogam;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import org.hamcrest.Matchers;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.web.FilterChainProxy;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.nadogam.tour.TourCard;
import com.nadogam.tour.TourRepository;

// 투어: 더미 데이터 규칙(개수·테마·기간·가격·일정)과 목록·상세 화면
@SpringBootTest
class TourTest {

	@Autowired
	JdbcTemplate jdbc;

	@Autowired
	TourRepository tours;

	@Autowired
	WebApplicationContext context;

	@Autowired
	FilterChainProxy springSecurityFilterChain;

	MockMvc mvc;

	@BeforeEach
	void setUp() {
		mvc = MockMvcBuilders.webAppContextSetup(context).addFilters(springSecurityFilterChain).build();
	}

	private int count(String sql, Object... args) {
		Integer n = jdbc.queryForObject(sql, Integer.class, args);
		return n == null ? 0 : n;
	}

	private static final Set<String> FEATURED = Set.of("로마", "삿포로", "케이프타운", "도쿄", "로스앤젤레스", "홍콩");

	@Test
	void 투어는_해외_111개와_국내_30개이고_옵션은_투어마다_3개다() {
		assertThat(count("SELECT COUNT(*) FROM tour WHERE scope = 'OVERSEAS'")).isEqualTo(111);
		assertThat(count("SELECT COUNT(*) FROM tour WHERE scope = 'DOMESTIC'")).isEqualTo(30);
		assertThat(count("SELECT COUNT(*) FROM domestic_city")).isEqualTo(10);
		assertThat(count("SELECT COUNT(*) FROM tour_option")).isEqualTo(423);
		assertThat(count("SELECT COUNT(*) FROM (SELECT tour_id FROM tour_option GROUP BY tour_id HAVING COUNT(*) <> 3) x")).isZero();
		assertThat(count("SELECT COUNT(*) FROM tour WHERE theme NOT IN ('FOOD_DRINK','SPORTS_ACTIVITY','ART_REST')")).isZero();
	}

	@Test
	void 기획전과_베스트셀러_6곳은_3테마_전부_나머지_해외는_1개_블라디보스토크는_없다() {
		List<Map<String, Object>> rows = jdbc.queryForList(
			"SELECT d.name_ko AS name, COUNT(*) AS n FROM tour t JOIN destination d ON d.destination_id = t.destination_id GROUP BY d.name_ko");
		Map<String, Long> perPlace = rows.stream().collect(Collectors.toMap(r -> (String) r.get("name"), r -> ((Number) r.get("n")).longValue()));
		assertThat(perPlace).doesNotContainKey("블라디보스토크");
		assertThat(perPlace).hasSize(99);
		perPlace.forEach((name, n) -> assertThat(n).as(name).isEqualTo(FEATURED.contains(name) ? 3L : 1L));
		// 국내 10개 도시는 3테마 전부
		assertThat(count("SELECT COUNT(*) FROM (SELECT city_id FROM tour WHERE city_id IS NOT NULL GROUP BY city_id HAVING COUNT(DISTINCT theme) = 3) x")).isEqualTo(10);
	}

	@Test
	void 바르셀로나는_축구_경기_관람_스포츠_투어다() {
		String theme = jdbc.queryForObject("SELECT t.theme FROM tour t JOIN destination d ON d.destination_id = t.destination_id WHERE d.name_ko = '바르셀로나'", String.class);
		assertThat(theme).isEqualTo("SPORTS_ACTIVITY");
		String highlights = jdbc.queryForObject("SELECT t.highlights FROM tour t JOIN destination d ON d.destination_id = t.destination_id WHERE d.name_ko = '바르셀로나'", String.class);
		assertThat(highlights).contains("축구");
	}

	@Test
	void 인천_기준_비행_6시간_이하는_2_3_6박_초과는_6_9_13박_국내는_1_2_3박() {
		// 인천발 최단 비행시간(분). 인천발 항공편이 없는 서울·부산은 단거리 기준을 쓴다.
		Map<Long, Integer> minutes = jdbc.queryForList(
			"SELECT destination_id, MIN(duration_minutes) AS m FROM flight WHERE origin_airport = 'ICN' GROUP BY destination_id").stream()
			.collect(Collectors.toMap(r -> ((Number) r.get("destination_id")).longValue(), r -> ((Number) r.get("m")).intValue()));
		List<Map<String, Object>> rows = jdbc.queryForList("""
			SELECT t.tour_id, t.destination_id, t.scope, GROUP_CONCAT(o.nights ORDER BY o.nights SEPARATOR ',') AS nights
			FROM tour t JOIN tour_option o ON o.tour_id = t.tour_id GROUP BY t.tour_id, t.destination_id, t.scope""");
		assertThat(rows).hasSize(141);
		for (Map<String, Object> r : rows) {
			String nights = String.valueOf(r.get("nights"));
			if ("DOMESTIC".equals(r.get("scope"))) {
				assertThat(nights).isEqualTo("1,2,3");
			} else {
				Integer m = minutes.get(((Number) r.get("destination_id")).longValue());
				assertThat(nights).as("tour " + r.get("tour_id")).isEqualTo(m == null || m <= 360 ? "2,3,6" : "6,9,13");
			}
		}
	}

	@Test
	void 일정은_박수_더하기_1일이고_긴_기간일수록_비싸다() {
		assertThat(count("""
			SELECT COUNT(*) FROM tour_option o
			WHERE (SELECT COUNT(*) FROM tour_day d WHERE d.option_id = o.option_id) <> o.nights + 1
			   OR o.days <> o.nights + 1""")).isZero();
		assertThat(count("""
			SELECT COUNT(*) FROM tour_option a JOIN tour_option b ON a.tour_id = b.tour_id AND a.nights < b.nights
			WHERE a.price_per_person >= b.price_per_person""")).isZero();
		assertThat(count("SELECT COUNT(*) FROM tour_option WHERE price_per_person % 10000 <> 0 OR price_per_person <= 0")).isZero();
		assertThat(count("SELECT COUNT(*) FROM tour_day WHERE day_no = 1 AND title NOT LIKE '%도착%'")).isZero();
		assertThat(count("SELECT COUNT(*) FROM tour_day d JOIN tour_option o ON o.option_id = d.option_id WHERE d.day_no = o.days AND d.title NOT LIKE '체크아웃%'")).isZero();
	}

	@Test
	void 콜라보_브랜드는_가상_이름이고_음식_투어에는_항상_있다() {
		assertThat(count("SELECT COUNT(*) FROM tour WHERE theme = 'FOOD_DRINK' AND collab_brand IS NULL")).isZero();
		assertThat(count("SELECT COUNT(*) FROM tour WHERE source_note IS NULL OR source_note NOT LIKE '%가상%'")).isZero();
	}

	@Test
	void 목록은_범위와_테마와_검색으로_거른다() {
		assertThat(tours.cards(null, null, null)).hasSize(139);   // 해외 111개 중 서울·부산(한국) 2개는 해외 탭에서 뺀다
		assertThat(tours.cards("DOMESTIC", null, null)).hasSize(30);
		assertThat(tours.cards("OVERSEAS", "FOOD_DRINK", null)).hasSize(35);   // 서울·부산 음식 투어는 해외 탭에서 뺀다
		List<TourCard> barca = tours.cards(null, null, "바르셀로나");
		assertThat(barca).hasSize(1);
		assertThat(barca.get(0).placeName()).isEqualTo("바르셀로나");
		assertThat(tours.cards(null, null, "rome")).hasSize(3);
		assertThat(tours.cards(null, null, "없는도시xyz")).isEmpty();
		assertThat(tours.cards("DOMESTIC", "ART_REST", "제주")).hasSize(1);
	}

	@Test
	void 목록_화면은_필터를_적용하고_잘못된_필터는_무시한다() throws Exception {
		mvc.perform(get("/tour")).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("투어")))
			.andExpect(content().string(Matchers.containsString("바르셀로나 스포츠·액티비티 투어")));
		mvc.perform(get("/tour?scope=DOMESTIC&theme=ART_REST")).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("제주 예술·휴식 투어")))
			.andExpect(content().string(Matchers.not(Matchers.containsString("바르셀로나 스포츠"))));
		mvc.perform(get("/tour?q=없는도시xyz")).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("조건에 맞는 투어가 없어요")));
		mvc.perform(get("/tour?scope=HACK&theme=%27%3B--")).andExpect(status().isOk());
	}

	@Test
	void 상세_화면은_기간_옵션에_따라_일정과_가격이_바뀐다() throws Exception {
		Long tourId = jdbc.queryForObject("SELECT t.tour_id FROM tour t JOIN destination d ON d.destination_id = t.destination_id WHERE d.name_ko = '로마' AND t.theme = 'FOOD_DRINK'", Long.class);
		List<Long> options = jdbc.queryForList("SELECT option_id FROM tour_option WHERE tour_id = ? ORDER BY nights", Long.class, tourId);
		mvc.perform(get("/tour/" + tourId)).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("6박 7일")))
			.andExpect(content().string(Matchers.containsString("7일차")))
			.andExpect(content().string(Matchers.not(Matchers.containsString("10일차"))));
		mvc.perform(get("/tour/" + tourId + "?option=" + options.get(2))).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("13박 14일")))
			.andExpect(content().string(Matchers.containsString("14일차")));
		// 이 투어의 옵션이 아닌 번호는 첫 번째 옵션으로 보여 준다
		mvc.perform(get("/tour/" + tourId + "?option=99999999")).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("6박 7일")));
		mvc.perform(get("/tour/99999")).andExpect(status().isNotFound());
	}

	@Test
	void 해외_투어는_인천_출발_국내_투어는_서울_출발_노선을_보여_준다() throws Exception {
		Long overseas = jdbc.queryForObject("SELECT t.tour_id FROM tour t JOIN destination d ON d.destination_id = t.destination_id WHERE d.name_ko = '로마' AND t.theme = 'FOOD_DRINK'", Long.class);
		mvc.perform(get("/tour/" + overseas)).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("tour-route")))
			.andExpect(content().string(Matchers.containsString("ICN · 출발")))
			.andExpect(content().string(Matchers.containsString("인천 출발 투어")));
		Long domestic = jdbc.queryForObject("SELECT tour_id FROM tour WHERE scope = 'DOMESTIC' ORDER BY tour_id LIMIT 1", Long.class);
		mvc.perform(get("/tour/" + domestic)).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("tour-route")))
			.andExpect(content().string(Matchers.containsString("서울 · 출발")))
			.andExpect(content().string(Matchers.containsString("서울 출발 투어")))
			.andExpect(content().string(Matchers.not(Matchers.containsString("ICN · 출발"))))
			.andExpect(content().string(Matchers.containsString("서울에서 도시까지의 이동편은 포함되지 않아요")))
			.andExpect(content().string(Matchers.not(Matchers.containsString("항공편은 해외 여행 메뉴에서"))));
		Integer daum = jdbc.queryForObject("SELECT COUNT(*) FROM tour_day WHERE description LIKE '%서울·대전%'", Integer.class);
		assertThat(daum).isZero();
	}

	@Test
	void 상단_메뉴와_하단_탭_바에_투어가_있다() throws Exception {
		mvc.perform(get("/")).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("data-tab=\"/tour\"")))
			.andExpect(content().string(Matchers.containsString(">투어</a>")));
	}
}
