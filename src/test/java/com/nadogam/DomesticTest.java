package com.nadogam;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.List;

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

import com.nadogam.domestic.DomesticRepository;
import com.nadogam.domestic.DomesticTransport;

// 국내여행: 이동편 더미 데이터 규칙(도시마다 5개, 서울 3 + 대전 2)과 목록·상세 화면
@SpringBootTest
class DomesticTest {

	@Autowired
	JdbcTemplate jdbc;

	@Autowired
	DomesticRepository domestic;

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

	private long cityId(String name) {
		Long id = jdbc.queryForObject("SELECT city_id FROM domestic_city WHERE name_ko = ?", Long.class, name);
		return id == null ? -1 : id;
	}

	@Test
	void 이동편은_55개이고_도시마다_서울_3개_대전_2개이고_서울은_대전_5개다() {
		assertThat(count("SELECT COUNT(*) FROM domestic_transport")).isEqualTo(55);
		assertThat(count("SELECT COUNT(*) FROM (SELECT city_id FROM domestic_transport GROUP BY city_id HAVING COUNT(*) <> 5) x")).isZero();
		assertThat(count("SELECT COUNT(*) FROM (SELECT city_id FROM domestic_transport WHERE origin = 'SEOUL' GROUP BY city_id HAVING COUNT(*) = 3) x")).isEqualTo(10);   // 서울은 목적지라 서울 출발이 없다
		assertThat(count("SELECT COUNT(*) FROM (SELECT city_id FROM domestic_transport WHERE origin = 'DAEJEON' GROUP BY city_id HAVING COUNT(*) = 2) x")).isEqualTo(10);
		assertThat(count("SELECT COUNT(*) FROM domestic_transport t JOIN domestic_city c ON c.city_id = t.city_id WHERE c.name_ko = '서울' AND t.origin = 'DAEJEON'")).isEqualTo(5);
		assertThat(count("SELECT COUNT(*) FROM domestic_transport WHERE origin NOT IN ('SEOUL','DAEJEON')")).isZero();
		assertThat(count("SELECT COUNT(*) FROM domestic_transport WHERE mode NOT IN ('TRAIN','EXPRESS_BUS','INTERCITY_BUS','FLIGHT')")).isZero();
		assertThat(count("SELECT COUNT(*) FROM domestic_transport WHERE fare <= 0 OR duration_minutes <= 0")).isZero();
	}

	@Test
	void 제주는_항공만_나머지는_기차나_버스다() {
		assertThat(count("SELECT COUNT(*) FROM domestic_transport x JOIN domestic_city c ON c.city_id = x.city_id WHERE c.name_ko = '제주' AND x.mode <> 'FLIGHT'")).isZero();
		assertThat(count("SELECT COUNT(*) FROM domestic_transport x JOIN domestic_city c ON c.city_id = x.city_id WHERE c.name_ko <> '제주' AND x.mode = 'FLIGHT'")).isZero();
	}

	@Test
	void 출발지별로_이동편을_거른다() {
		long busan = cityId("부산");
		List<DomesticTransport> seoul = domestic.transports(busan, "SEOUL");
		List<DomesticTransport> daejeon = domestic.transports(busan, "DAEJEON");
		assertThat(seoul).hasSize(3).allMatch(t -> "SEOUL".equals(t.origin()));
		assertThat(daejeon).hasSize(2).allMatch(t -> "DAEJEON".equals(t.origin()));
		assertThat(domestic.transports(busan, null)).hasSize(5);
		assertThat(seoul.get(0).modeLabel()).isEqualTo("기차");
	}

	@Test
	void 목록_화면은_도시_11곳을_보여_준다() throws Exception {
		mvc.perform(get("/domestic")).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("국내여행")))
			.andExpect(content().string(Matchers.containsString("경주")))
			.andExpect(content().string(Matchers.containsString("단양")));
		assertThat(domestic.cities()).hasSize(11);   // 해외 탭에서 뺀 서울을 포함
	}

	@Test
	void 상세_화면은_출발지에_따라_이동편이_바뀌고_도시의_투어_3개를_보여_준다() throws Exception {
		long busan = cityId("부산");
		mvc.perform(get("/domestic/" + busan)).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("KTX 서울→부산")))
			.andExpect(content().string(Matchers.not(Matchers.containsString("KTX 대전→부산"))))
			.andExpect(content().string(Matchers.containsString("부산 미식·주류 투어")));
		mvc.perform(get("/domestic/" + busan + "?origin=DAEJEON")).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("KTX 대전→부산")))
			.andExpect(content().string(Matchers.not(Matchers.containsString("KTX 서울→부산"))));
		// 알 수 없는 출발지는 서울로 본다
		mvc.perform(get("/domestic/" + busan + "?origin=HACK")).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("KTX 서울→부산")));
		mvc.perform(get("/domestic/99999")).andExpect(status().isNotFound());
		assertThat(domestic.city(busan)).isPresent();
		assertThat(domestic.city(busan).get().tourCount()).isEqualTo(3);
	}

	@Test
	void 상단_메뉴와_하단_탭_바에_국내여행이_있다() throws Exception {
		mvc.perform(get("/")).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("data-tab=\"/domestic\"")))
			.andExpect(content().string(Matchers.containsString(">국내여행</a>")));
	}

	@Test
	void 서울_상세는_서울_출발_탭이_없고_대전_출발_이동편과_투어_3개를_보여_준다() throws Exception {
		Long seoul = jdbc.queryForObject("SELECT city_id FROM domestic_city WHERE name_ko = '서울'", Long.class);
		mvc.perform(get("/domestic/" + seoul)).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("대전 출발")))
			.andExpect(content().string(Matchers.not(Matchers.containsString("서울 출발</a>"))))
			.andExpect(content().string(Matchers.containsString("KTX 대전→서울")))
			.andExpect(content().string(Matchers.containsString("서울 미식·주류 투어")));
	}
}
