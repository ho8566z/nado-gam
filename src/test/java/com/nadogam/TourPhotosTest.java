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
import org.springframework.core.io.ClassPathResource;
import org.springframework.security.web.FilterChainProxy;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.nadogam.common.TourPhotos;

// 투어 카드 오른쪽 절반의 테마 사진(음식·경기장·명소): 출처 목록과 파일이 맞고, 화면에 반영되며, 사진이 없는 투어는 예전 카드 그대로인지 확인
@SpringBootTest
class TourPhotosTest {

	@Autowired
	WebApplicationContext context;

	@Autowired
	FilterChainProxy springSecurityFilterChain;

	@Autowired
	TourPhotos photos;

	MockMvc mvc;

	@BeforeEach
	void setUp() {
		mvc = MockMvcBuilders.webAppContextSetup(context).addFilters(springSecurityFilterChain).build();
	}

	@Test
	void 받은_테마_사진마다_파일과_이름_출처가_있다() {
		assertThat(photos.count()).isGreaterThan(0);
		for (TourPhotos.Credit c : photos.credits()) {
			assertThat(new ClassPathResource("static/img/tour/tour-" + c.tourId() + ".jpg").exists()).as("투어 %d 사진 파일", c.tourId()).isTrue();
			assertThat(c.label()).as("투어 %d 이름", c.tourId()).isNotBlank();
			assertThat(c.license()).as("투어 %d 라이선스", c.tourId()).isNotBlank();
			assertThat(c.source()).as("투어 %d 원본", c.tourId()).startsWith("http");
			assertThat(photos.style(c.tourId())).contains("tour-" + c.tourId() + ".jpg");
		}
	}

	@Test
	void 사진이_없는_투어는_빈_문자열이라_예전_카드가_그대로다() {
		assertThat(photos.has(999_999)).isFalse();
		assertThat(photos.style(999_999)).isEmpty();
		assertThat(photos.label(999_999)).isEmpty();
	}

	@Test
	void 투어_목록과_국내_도시_상세와_출처_화면에_반영된다() throws Exception {
		mvc.perform(get("/tour")).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("tour-card--split")))
			.andExpect(content().string(Matchers.containsString("tour-theme-chip")))
			.andExpect(content().string(Matchers.containsString("--theme-photo")));
		mvc.perform(get("/photo-credits")).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("투어 카드 테마 사진")));
	}
}
