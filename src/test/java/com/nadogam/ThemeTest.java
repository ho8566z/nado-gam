package com.nadogam;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.nio.charset.StandardCharsets;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.core.io.ClassPathResource;
import org.springframework.security.web.FilterChainProxy;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

// 오렌지 테마와 마스코트(거코·삐삐): 로고·빈 화면에 마스코트가 들어가고, 포인트 색이 오렌지다.
@SpringBootTest
class ThemeTest {

	@Autowired
	WebApplicationContext context;

	@Autowired
	FilterChainProxy springSecurityFilterChain;

	MockMvc mvc;

	@BeforeEach
	void setUp() {
		mvc = MockMvcBuilders.webAppContextSetup(context).addFilters(springSecurityFilterChain).build();
	}

	private String css(String name) throws Exception {
		return new String(new ClassPathResource("static/css/" + name).getInputStream().readAllBytes(), StandardCharsets.UTF_8);
	}

	@Test
	void 포인트_색은_오렌지이고_하늘색은_남지_않는다() throws Exception {
		assertThat(css("main.css")).contains("--accent: #ff8a1f").doesNotContain("5cc8ff");
		assertThat(css("travel.css")).doesNotContain("92, 200, 255");
		assertThat(css("auth.css")).doesNotContain("92, 200, 255");
	}

	@Test
	void 상단_로고에_마스코트가_들어간다() throws Exception {
		mvc.perform(get("/")).andExpect(status().isOk())
			.andExpect(content().string(org.hamcrest.Matchers.containsString("mascot--logo")))
			.andExpect(content().string(org.hamcrest.Matchers.containsString("mascot-flame")))
			.andExpect(content().string(org.hamcrest.Matchers.containsString("mascot.css")));
	}

	@Test
	void 여행지_검색_결과가_없을_때_보여_줄_마스코트가_있다() throws Exception {
		mvc.perform(get("/travel")).andExpect(status().isOk())
			.andExpect(content().string(org.hamcrest.Matchers.containsString("id=\"dest-empty\"")))
			.andExpect(content().string(org.hamcrest.Matchers.containsString("mascot--sm")));
	}

	@Test
	void 모든_사용자_화면에_모바일_하단_탭_바가_있고_휴대폰_폭에서만_보인다() throws Exception {
		for (String path : new String[] { "/", "/travel", "/special", "/bestseller", "/login", "/signup" }) {
			mvc.perform(get(path)).andExpect(status().isOk())
				.andExpect(content().string(org.hamcrest.Matchers.containsString("class=\"tabbar\"")));
		}
		String css = css("main.css");
		assertThat(css).contains(".tabbar { display: none; }").contains("@media (max-width: 760px)");
	}

	@Test
	void 마스코트는_삐삐가_거코_머리를_움켜잡고_날개짓하는_모습이다() throws Exception {
		mvc.perform(get("/")).andExpect(status().isOk())
			.andExpect(content().string(org.hamcrest.Matchers.containsString("mascot-wing")))
			.andExpect(content().string(org.hamcrest.Matchers.containsString("mascot-hang")))
			.andExpect(content().string(org.hamcrest.Matchers.containsString("mascot-flame--wing")));
		assertThat(css("mascot.css")).contains("@keyframes flap").contains("@keyframes hang");
	}
}
