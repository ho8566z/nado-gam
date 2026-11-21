package com.nadogam;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.hamcrest.Matchers;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.web.FilterChainProxy;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.nadogam.tour.TourRepository;

// 투어 목록의 대륙·국가 필터
@SpringBootTest
class TourFilterTest {

	@Autowired
	WebApplicationContext context;

	@Autowired
	FilterChainProxy springSecurityFilterChain;

	@Autowired
	TourRepository tours;

	MockMvc mvc;

	@BeforeEach
	void setUp() {
		mvc = MockMvcBuilders.webAppContextSetup(context).addFilters(springSecurityFilterChain).build();
	}

	@Test
	void 대륙으로_거르면_그_대륙의_투어만_나온다() {
		int all = tours.cards(null, null, null).size();
		int europe = tours.cards(null, null, null, "EUROPE", null).size();
		int asia = tours.cards(null, null, null, "ASIA", null).size();
		assertThat(europe).isPositive().isLessThan(all);
		assertThat(asia).isPositive();
		assertThat(tours.cards(null, null, null, "EUROPE", null).stream().map(c -> c.placeName())).contains("파리").doesNotContain("도쿄");
	}

	@Test
	void 국가로_거르면_그_나라의_투어만_나오고_국내_도시_투어는_한국으로_센다() {
		var france = tours.cards(null, null, null, "EUROPE", "FR");
		assertThat(france.stream().map(c -> c.placeName()).distinct()).containsExactly("파리");
		var korea = tours.cards(null, null, null, "ASIA", "KR");
		assertThat(korea.stream().map(c -> c.placeName())).contains("경주", "제주");
	}

	@Test
	void 대륙_국가_칩의_투어_수는_목록과_같다() {
		long sum = tours.facets(null, null, null).stream().mapToLong(TourRepository.Facet::count).sum();
		assertThat(sum).isEqualTo(tours.cards(null, null, null).size());
	}

	@Test
	void 화면에_대륙_칩과_선택한_대륙의_국가_칩이_나온다() throws Exception {
		mvc.perform(get("/tour")).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("전체 대륙")))
			.andExpect(content().string(Matchers.not(Matchers.containsString("전체 국가"))));
		mvc.perform(get("/tour").param("region", "EUROPE")).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("전체 국가")))
			.andExpect(content().string(Matchers.containsString("프랑스")));
		mvc.perform(get("/tour").param("region", "EUROPE").param("country", "FR")).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("파리")))
			.andExpect(content().string(Matchers.not(Matchers.containsString("/tour/11\""))));
	}

	@Test
	void 잘못된_대륙_국가_값은_무시하고_전체를_보여_준다() throws Exception {
		mvc.perform(get("/tour").param("region", "MARS").param("country", "ZZ")).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("141")));
	}
}
