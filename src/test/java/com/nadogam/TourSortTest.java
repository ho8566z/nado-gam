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

import com.nadogam.tour.TourCard;
import com.nadogam.tour.TourRepository;

// 투어 목록의 정렬(가격·조회수·인기·여행사 추천)
@SpringBootTest
class TourSortTest {

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
	void 투어마다_조회수_판매수가_있고_추천_순위는_겹치지_않는다() {
		List<TourCard> all = tours.cards(null, null, null);
		assertThat(all).allSatisfy(t -> {
			assertThat(t.viewCount()).isPositive();
			assertThat(t.salesCount()).isPositive();
		});
		assertThat(all.stream().filter(t -> t.agencyPick() > 0).mapToInt(TourCard::agencyPick)).doesNotHaveDuplicates().isNotEmpty();
	}

	@Test
	void 투어_상세를_열면_조회수가_늘어난다() throws Exception {
		long before = tours.cards(null, null, null).stream().filter(t -> t.tourId() == 5).findFirst().orElseThrow().viewCount();
		mvc.perform(get("/tour/5")).andExpect(status().isOk());
		long after = tours.cards(null, null, null).stream().filter(t -> t.tourId() == 5).findFirst().orElseThrow().viewCount();
		assertThat(after).isEqualTo(before + 1);
	}

	@Test
	void 화면에_정렬_버튼과_정렬용_값이_있다() throws Exception {
		mvc.perform(get("/tour")).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("가격 낮은순")))
			.andExpect(content().string(Matchers.containsString("가격 높은순")))
			.andExpect(content().string(Matchers.containsString("조회수순")))
			.andExpect(content().string(Matchers.containsString("인기순")))
			.andExpect(content().string(Matchers.containsString("여행사 추천순")))
			.andExpect(content().string(Matchers.containsString("data-sales=")))
			.andExpect(content().string(Matchers.containsString("tour-sort.js")));
	}
}
