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
import org.springframework.security.web.FilterChainProxy;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.nadogam.travel.DestinationItem;
import com.nadogam.travel.TravelSearchRepository;

// 해외 여행지 목록의 정렬(가격·조회수·인기·여행사 추천)과 국내 도시(서울·부산) 정리
@SpringBootTest
class TravelSortTest {

	@Autowired
	WebApplicationContext context;

	@Autowired
	FilterChainProxy springSecurityFilterChain;

	@Autowired
	TravelSearchRepository search;

	MockMvc mvc;

	@BeforeEach
	void setUp() {
		mvc = MockMvcBuilders.webAppContextSetup(context).addFilters(springSecurityFilterChain).build();
	}

	@Test
	void 여행지마다_조회수_인기_추천_값이_있고_추천은_순위가_겹치지_않는다() {
		List<DestinationItem> all = search.destinations();
		assertThat(all).allSatisfy(d -> assertThat(d.viewCount()).isPositive());
		assertThat(all.stream().filter(DestinationItem::picked).mapToInt(DestinationItem::agencyPick)).doesNotHaveDuplicates().isNotEmpty();
		assertThat(all.stream().filter(d -> d.available()).mapToLong(DestinationItem::salesCount).sum()).isPositive();
	}

	@Test
	void 여행지_상세를_열면_조회수가_늘어난다() throws Exception {
		long before = search.destination(1).orElseThrow().viewCount();
		mvc.perform(get("/travel/1")).andExpect(status().isOk());
		assertThat(search.destination(1).orElseThrow().viewCount()).isEqualTo(before + 1);
	}

	@Test
	void 화면에_정렬_버튼과_정렬용_값이_있다() throws Exception {
		mvc.perform(get("/travel")).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("가격 낮은순")))
			.andExpect(content().string(Matchers.containsString("가격 높은순")))
			.andExpect(content().string(Matchers.containsString("조회수순")))
			.andExpect(content().string(Matchers.containsString("인기순")))
			.andExpect(content().string(Matchers.containsString("여행사 추천순")))
			.andExpect(content().string(Matchers.containsString("data-views=")))
			.andExpect(content().string(Matchers.containsString("data-pick=")));
	}

	@Test
	void 해외_여행_탭에는_국내_도시가_없고_상세도_열리지_않는다() throws Exception {
		mvc.perform(get("/travel")).andExpect(status().isOk())
			.andExpect(content().string(Matchers.not(Matchers.containsString("/travel/7\""))))
			.andExpect(content().string(Matchers.not(Matchers.containsString("/travel/8\""))));
		mvc.perform(get("/travel/7")).andExpect(status().isNotFound());
		mvc.perform(get("/travel/8")).andExpect(status().isNotFound());
		mvc.perform(get("/api/globe/routes")).andExpect(status().isOk())
			.andExpect(content().string(Matchers.not(Matchers.containsString("\"name\":\"서울\""))));
	}
}
