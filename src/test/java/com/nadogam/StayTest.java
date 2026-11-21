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

import com.nadogam.stay.HotelItem;
import com.nadogam.stay.StayController;
import com.nadogam.stay.StayRepository;

// 호텔·크루즈: 더미 데이터 규칙(개수·가격)과 화면(1박·전체 가격, 박수 선택, 탭)
@SpringBootTest
class StayTest {

	private static final Set<String> FEATURED = Set.of("로마", "삿포로", "케이프타운", "도쿄", "로스앤젤레스", "홍콩");
	private static final Set<String> CRUISE_CITIES = Set.of("바르셀로나", "로마", "이스탄불", "리스본", "시드니", "밴쿠버", "호놀룰루");

	@Autowired
	JdbcTemplate jdbc;

	@Autowired
	StayRepository stays;

	@Autowired
	WebApplicationContext context;

	@Autowired
	FilterChainProxy springSecurityFilterChain;

	MockMvc mvc;

	@BeforeEach
	void setUp() {
		mvc = MockMvcBuilders.webAppContextSetup(context).addFilters(springSecurityFilterChain).build();
	}

	private int count(String sql) {
		Integer n = jdbc.queryForObject(sql, Integer.class);
		return n == null ? 0 : n;
	}

	private long destinationId(String name) {
		Long id = jdbc.queryForObject("SELECT destination_id FROM destination WHERE name_ko = ?", Long.class, name);
		return id == null ? -1 : id;
	}

	@Test
	void 호텔은_354개이고_기획전_베스트셀러_6곳은_7개_나머지_해외와_국내는_3개다() {
		assertThat(count("SELECT COUNT(*) FROM hotel")).isEqualTo(354);
		assertThat(count("SELECT COUNT(*) FROM hotel WHERE (destination_id IS NULL) = (city_id IS NULL)")).isZero();
		Map<String, Long> perPlace = jdbc.queryForList(
			"SELECT d.name_ko AS name, COUNT(*) AS n FROM hotel h JOIN destination d ON d.destination_id = h.destination_id GROUP BY d.name_ko").stream()
			.collect(Collectors.toMap(r -> (String) r.get("name"), r -> ((Number) r.get("n")).longValue()));
		assertThat(perPlace).hasSize(99).doesNotContainKey("블라디보스토크");
		perPlace.forEach((name, n) -> assertThat(n).as(name).isEqualTo(FEATURED.contains(name) ? 7L : 3L));
		assertThat(count("SELECT COUNT(*) FROM (SELECT city_id FROM hotel WHERE city_id IS NOT NULL GROUP BY city_id HAVING COUNT(*) = 3) x")).isEqualTo(11);
	}

	@Test
	void 호텔_등급은_3에서_5이고_가격은_만원_단위이며_등급이_높을수록_비싸다() {
		assertThat(count("SELECT COUNT(*) FROM hotel WHERE grade NOT BETWEEN 3 AND 5")).isZero();
		assertThat(count("SELECT COUNT(*) FROM hotel WHERE price_per_night <= 0 OR price_per_night % 10000 <> 0")).isZero();
		assertThat(count("""
			SELECT COUNT(*) FROM hotel a JOIN hotel b
			  ON COALESCE(a.destination_id, -1) = COALESCE(b.destination_id, -1) AND COALESCE(a.city_id, -1) = COALESCE(b.city_id, -1)
			WHERE a.grade < b.grade AND a.price_per_night >= b.price_per_night""")).isZero();
		assertThat(count("""
			SELECT COUNT(*) FROM (SELECT COALESCE(destination_id, -1) d, COALESCE(city_id, -1) c, name FROM hotel GROUP BY 1, 2, 3 HAVING COUNT(*) > 1) x""")).isZero();
	}

	@Test
	void 크루즈는_항구_도시_7곳에_1개씩이다() {
		assertThat(count("SELECT COUNT(*) FROM cruise")).isEqualTo(7);
		List<String> names = jdbc.queryForList(
			"SELECT d.name_ko FROM cruise c JOIN destination d ON d.destination_id = c.destination_id", String.class);
		assertThat(names).containsExactlyInAnyOrderElementsOf(CRUISE_CITIES);
		assertThat(count("SELECT COUNT(*) FROM cruise WHERE price_balcony <= price_inside OR price_inside <= 0 OR nights < 5")).isZero();
	}

	@Test
	void 호텔_가격은_1박과_박수를_곱한_전체로_보여_준다() {
		HotelItem h = new HotelItem(1, "테스트 호텔", 4, "시내 중심", "소개", "무료 Wi-Fi", 150000);
		assertThat(h.perNightLabel()).isEqualTo("₩150,000");
		assertThat(h.totalLabel(3)).isEqualTo("₩450,000");
		assertThat(h.gradeLabel()).isEqualTo("★★★★");
		assertThat(StayController.safeNights(null, 3)).isEqualTo(3);
		assertThat(StayController.safeNights(0, 3)).isEqualTo(3);
		assertThat(StayController.safeNights(15, 3)).isEqualTo(3);
		assertThat(StayController.safeNights(14, 3)).isEqualTo(14);
		assertThat(stays.hotelsOfDestination(destinationId("로마"))).hasSize(7);
	}

	@Test
	void 호텔_화면은_박수에_따라_전체_가격이_바뀌고_항공편_화면에서_탭으로_이어진다() throws Exception {
		long rome = destinationId("로마");
		int first = stays.hotelsOfDestination(rome).get(0).pricePerNight();
		mvc.perform(get("/travel/" + rome + "/hotels")).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("3박 전체")))
			.andExpect(content().string(Matchers.containsString("₩" + String.format("%,d", first * 3L))));
		mvc.perform(get("/travel/" + rome + "/hotels?nights=5")).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("5박 전체")))
			.andExpect(content().string(Matchers.containsString("₩" + String.format("%,d", first * 5L))));
		mvc.perform(get("/travel/" + rome + "/hotels?nights=999")).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("3박 전체")));
		mvc.perform(get("/travel/" + rome)).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("/travel/" + rome + "/hotels")))
			.andExpect(content().string(Matchers.containsString("/travel/" + rome + "/cruise")));
		mvc.perform(get("/travel/99999/hotels")).andExpect(status().isNotFound());
	}

	@Test
	void 크루즈_화면은_7곳만_있고_다른_여행지에는_탭이_없다() throws Exception {
		long barca = destinationId("바르셀로나");
		mvc.perform(get("/travel/" + barca + "/cruise")).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("서부 지중해 7박 크루즈")))
			.andExpect(content().string(Matchers.containsString("내측 객실")));
		long paris = destinationId("파리");
		mvc.perform(get("/travel/" + paris)).andExpect(status().isOk())
			.andExpect(content().string(Matchers.not(Matchers.containsString("/travel/" + paris + "/cruise"))));
		mvc.perform(get("/travel/" + paris + "/cruise")).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("이 여행지에는 크루즈가 없어요")));
	}

	@Test
	void 국내_도시_상세에도_숙소_3곳과_박수_선택이_있다() throws Exception {
		Long busan = jdbc.queryForObject("SELECT city_id FROM domestic_city WHERE name_ko = '부산'", Long.class);
		assertThat(stays.hotelsOfCity(busan)).hasSize(3);
		mvc.perform(get("/domestic/" + busan)).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("2박 전체")));
		mvc.perform(get("/domestic/" + busan + "?nights=4")).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("4박 전체")));
	}
}
