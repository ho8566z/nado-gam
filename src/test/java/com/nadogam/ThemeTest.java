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
}
