package com.nadogam;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.core.io.ClassPathResource;
import org.springframework.security.web.FilterChainProxy;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.nadogam.common.DestPhotos;

// 여행지 카드의 대표 관광지 사진·문구: 해외 100곳·국내 10곳 문구, 받은 사진 파일과 출처, 화면 반영
@SpringBootTest
class DestPhotosTest {

	@Autowired
	WebApplicationContext context;

	@Autowired
	FilterChainProxy springSecurityFilterChain;

	@Autowired
	DestPhotos photos;

	MockMvc mvc;

	@BeforeEach
	void setUp() {
		mvc = MockMvcBuilders.webAppContextSetup(context).addFilters(springSecurityFilterChain).build();
	}

	@Test
	void 해외_100곳과_국내_10곳에_관광지와_특산물_문구가_있다() {
		for (int i = 1; i <= 100; i++) {
			assertThat(photos.landmark("overseas", i)).as("해외 %d 명소", i).isNotBlank();
			assertThat(photos.specialty("overseas", i)).as("해외 %d 특산", i).isNotBlank();
		}
		for (int i = 1; i <= 10; i++) {
			assertThat(photos.landmark("domestic", i)).as("국내 %d 명소", i).isNotBlank();
			assertThat(photos.specialty("domestic", i)).as("국내 %d 특산", i).isNotBlank();
		}
		assertThat(photos.landmark("overseas", 1)).isEqualTo("에펠탑");
		assertThat(photos.landmarkByName("OVERSEAS", "부산")).isEqualTo("감천문화마을");
		assertThat(photos.landmarkByName("DOMESTIC", "부산")).isEqualTo("광안대교");   // 같은 이름도 범위로 구분
	}

	@Test
	void 사진은_출처가_있는_것만_쓰고_파일이_실제로_있다() throws Exception {
		assertThat(photos.credits()).isNotEmpty();
		for (DestPhotos.Credit c : photos.credits()) {
			assertThat(new ClassPathResource("static/img/dest/" + c.key() + ".jpg").exists()).as(c.key()).isTrue();
			assertThat(c.author()).as(c.key() + " 저작자").isNotBlank();
			assertThat(c.license()).as(c.key() + " 라이선스").isNotBlank();
			assertThat(c.source()).as(c.key() + " 원본 주소").startsWith("https://");
		}
		// 사진이 없는 도시는 스타일을 붙이지 않아 기존 그라데이션이 그대로 보인다
		assertThat(photos.style("overseas", 9999)).isEmpty();
	}

	@Test
	void 사진이_있는_여행지_카드에는_사진_스타일과_문구가_들어간다() throws Exception {
		DestPhotos.Credit first = photos.credits().get(0);
		long id = Long.parseLong(first.key().split("-")[1]);
		String html = mvc.perform(get("/travel")).andExpect(status().isOk()).andReturn().getResponse().getContentAsString();
		assertThat(html).contains("--photo:url(/img/dest/" + first.key() + ".jpg)");
		assertThat(html).contains("class=\"spot-tag\"");
		assertThat(photos.style("overseas", id)).contains(first.key());
	}

	@Test
	void 사진_출처_화면과_푸터_링크가_있다() throws Exception {
		mvc.perform(get("/photo-credits")).andExpect(status().isOk())
			.andExpect(content().string(org.hamcrest.Matchers.containsString("사진 출처")))
			.andExpect(content().string(org.hamcrest.Matchers.containsString("Wikimedia")));
		mvc.perform(get("/travel")).andExpect(content().string(org.hamcrest.Matchers.containsString("/photo-credits")));
	}

	@Test
	void 국내여행과_투어_화면도_사진을_쓴다() throws Exception {
		mvc.perform(get("/domestic")).andExpect(status().isOk());
		mvc.perform(get("/domestic/1")).andExpect(status().isOk());
		mvc.perform(get("/tour")).andExpect(status().isOk());
		mvc.perform(get("/tour/1")).andExpect(status().isOk());
		mvc.perform(get("/")).andExpect(status().isOk());
	}
}
