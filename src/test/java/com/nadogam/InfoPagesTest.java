package com.nadogam;

import static org.hamcrest.Matchers.containsString;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.junit.jupiter.api.BeforeEach;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.web.FilterChainProxy;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

// 푸터의 안내 화면(서비스 소개·이용약관·개인정보처리방침)과 푸터·머리글 보강
@SpringBootTest
class InfoPagesTest {

	@Autowired
	WebApplicationContext context;

	@Autowired
	FilterChainProxy springSecurityFilterChain;

	MockMvc mvc;

	@BeforeEach
	void setUp() {
		mvc = MockMvcBuilders.webAppContextSetup(context).addFilters(springSecurityFilterChain).build();
	}

	@Test
	void 안내_화면은_로그인_없이_열린다() throws Exception {
		mvc.perform(get("/about")).andExpect(status().isOk()).andExpect(content().string(containsString("서비스 소개")));
		mvc.perform(get("/terms")).andExpect(status().isOk()).andExpect(content().string(containsString("이용약관")));
		mvc.perform(get("/privacy")).andExpect(status().isOk()).andExpect(content().string(containsString("BCrypt")));
	}

	@Test
	void 푸터에_고객센터와_약관_링크와_가상_서비스_안내가_있다() throws Exception {
		mvc.perform(get("/")).andExpect(status().isOk())
			.andExpect(content().string(containsString("개인정보처리방침")))
			.andExpect(content().string(containsString("/terms")))
			.andExpect(content().string(containsString("평일 09:00")))
			.andExpect(content().string(containsString("가상 서비스")));
	}

	@Test
	void 머리글에_파비콘과_설명이_있다() throws Exception {
		mvc.perform(get("/")).andExpect(content().string(containsString("rel=\"icon\"")))
			.andExpect(content().string(containsString("name=\"description\"")));
	}

	@Test
	void 사이드바_데이터는_기획전과_베스트셀러를_돌려준다() throws Exception {
		mvc.perform(get("/api/side-promos")).andExpect(status().isOk())
			.andExpect(content().string(containsString("\"kind\":\"plan\"")))
			.andExpect(content().string(containsString("\"kind\":\"best\"")))
			.andExpect(content().string(containsString("/bestseller/")));
		mvc.perform(get("/travel")).andExpect(content().string(containsString("data-side-promo")));
	}
}
