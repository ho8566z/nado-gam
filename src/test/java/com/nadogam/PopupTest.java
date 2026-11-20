package com.nadogam;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestBuilders.formLogin;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.time.LocalDateTime;

import org.hamcrest.Matchers;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.security.web.FilterChainProxy;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import com.nadogam.popup.PopupEvent;
import com.nadogam.popup.PopupEventRepository;

// 이벤트 팝업: 메인 노출 조건(켜짐 + 기간 안), 관리자 등록·수정·숨김·삭제, 입력 검증, 접근 권한
@SpringBootTest
@Transactional
class PopupTest {

	@Autowired
	WebApplicationContext context;

	@Autowired
	FilterChainProxy springSecurityFilterChain;

	@Autowired
	PopupEventRepository popups;

	MockMvc mvc;

	@BeforeEach
	void setUp() {
		mvc = MockMvcBuilders.webAppContextSetup(context).addFilters(springSecurityFilterChain).build();
	}

	private MockHttpSession adminSession() throws Exception {
		return (MockHttpSession) mvc.perform(formLogin("/admin/login").user("admin").password("1234"))
			.andReturn().getRequest().getSession();
	}

	private org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder save(
		org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder req, String title, String url,
		String start, String end) {
		return req.with(csrf()).param("title", title).param("body", "내용입니다").param("qrTargetUrl", url)
			.param("startAt", start).param("endAt", end).param("active", "true");
	}

	@Test
	void 더미_팝업_3개_중_지금_노출_조건에_맞는_것은_오픈_기념_1개() {
		assertThat(popups.count()).isEqualTo(3);
		var showing = popups.findShowing(LocalDateTime.of(2026, 11, 20, 12, 0));
		assertThat(showing).isPresent();
		assertThat(showing.get().getTitle()).contains("오픈 기념");
		assertThat(popups.findShowing(LocalDateTime.of(2026, 10, 15, 12, 0)).orElseThrow().getTitle()).contains("가을");
		assertThat(popups.findShowing(LocalDateTime.of(2027, 1, 10, 12, 0)).orElseThrow().getTitle()).contains("얼리버드");
		assertThat(popups.findShowing(LocalDateTime.of(2027, 3, 1, 12, 0))).isEmpty();
	}

	@Test
	void 숨김_처리한_팝업은_기간_안이어도_노출되지_않는다() {
		PopupEvent open = popups.findShowing(LocalDateTime.of(2026, 11, 20, 12, 0)).orElseThrow();
		open.toggleActive();
		popups.saveAndFlush(open);
		assertThat(popups.findShowing(LocalDateTime.of(2026, 11, 20, 12, 0))).isEmpty();
		assertThat(open.statusLabel(LocalDateTime.of(2026, 11, 20, 12, 0))).isEqualTo("숨김");
	}

	@Test
	void 메인에_노출_중인_팝업이_모달로_그려진다() throws Exception {
		mvc.perform(get("/")).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("id=\"event-popup\"")))
			.andExpect(content().string(Matchers.containsString("오늘 하루 안 보기")))
			.andExpect(content().string(Matchers.containsString("popup.js")));
	}

	@Test
	void 관리자만_팝업_관리에_들어갈_수_있다() throws Exception {
		mvc.perform(get("/admin/popups")).andExpect(status().is3xxRedirection());
		MockHttpSession user = (MockHttpSession) mvc.perform(formLogin("/login").user("user").password("1234"))
			.andReturn().getRequest().getSession();
		mvc.perform(get("/admin/popups").session(user)).andExpect(status().isForbidden());
		mvc.perform(get("/admin/popups").session(adminSession())).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("오픈 기념")));
	}

	@Test
	void 관리자가_팝업을_등록하고_수정하고_숨기고_삭제한다() throws Exception {
		MockHttpSession admin = adminSession();
		long before = popups.count();
		mvc.perform(save(post("/admin/popups").session(admin), "새 이벤트", "/travel", "2026-11-20T00:00", "2026-11-30T23:59"))
			.andExpect(redirectedUrl("/admin/popups?saved"));
		assertThat(popups.count()).isEqualTo(before + 1);
		PopupEvent created = popups.findAll().stream().filter(p -> p.getTitle().equals("새 이벤트")).findFirst().orElseThrow();
		assertThat(created.getCreatedBy()).isEqualTo(1L);

		mvc.perform(save(post("/admin/popups/" + created.getPopupId()).session(admin), "수정된 이벤트", "", "2026-11-20T00:00", "2026-12-01T00:00"))
			.andExpect(redirectedUrl("/admin/popups?saved"));
		PopupEvent edited = popups.findById(created.getPopupId()).orElseThrow();
		assertThat(edited.getTitle()).isEqualTo("수정된 이벤트");
		assertThat(edited.getQrTargetUrl()).isNull();

		mvc.perform(post("/admin/popups/" + created.getPopupId() + "/toggle").session(admin).with(csrf()))
			.andExpect(redirectedUrl("/admin/popups"));
		assertThat(popups.findById(created.getPopupId()).orElseThrow().isActive()).isFalse();

		mvc.perform(post("/admin/popups/" + created.getPopupId() + "/delete").session(admin).with(csrf()))
			.andExpect(redirectedUrl("/admin/popups?deleted"));
		assertThat(popups.count()).isEqualTo(before);
	}

	@Test
	void 잘못된_입력은_저장되지_않는다() throws Exception {
		MockHttpSession admin = adminSession();
		long before = popups.count();
		// javascript: 주소, 종료가 시작보다 이른 기간, 제목 없음
		mvc.perform(save(post("/admin/popups").session(admin), "나쁜 주소", "javascript:alert(1)", "2026-11-20T00:00", "2026-11-30T00:00"))
			.andExpect(status().isOk());
		mvc.perform(save(post("/admin/popups").session(admin), "기간 오류", "/travel", "2026-12-01T00:00", "2026-11-01T00:00"))
			.andExpect(status().isOk());
		mvc.perform(save(post("/admin/popups").session(admin), "", "/travel", "2026-11-20T00:00", "2026-11-30T00:00"))
			.andExpect(status().isOk());
		assertThat(popups.count()).isEqualTo(before);
	}

	@Test
	void 없는_팝업을_수정하면_404() throws Exception {
		mvc.perform(get("/admin/popups/99999/edit").session(adminSession())).andExpect(status().isNotFound());
	}
}
