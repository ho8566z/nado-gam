package com.nadogam;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestBuilders.formLogin;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.List;

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

import com.nadogam.support.SupportInquiry;
import com.nadogam.support.SupportInquiryRepository;

// 고객문의: 내 문의만 보기, 등록 검증, 관리자 답변, 접근 권한, 내용 이스케이프
@SpringBootTest
@Transactional
class SupportTest {

	@Autowired
	WebApplicationContext context;

	@Autowired
	FilterChainProxy springSecurityFilterChain;

	@Autowired
	SupportInquiryRepository inquiries;

	MockMvc mvc;

	@BeforeEach
	void setUp() {
		mvc = MockMvcBuilders.webAppContextSetup(context).addFilters(springSecurityFilterChain).build();
	}

	private MockHttpSession login(String url, String id, String pw) throws Exception {
		return (MockHttpSession) mvc.perform(formLogin(url).user(id).password(pw)).andReturn().getRequest().getSession();
	}

	private MockHttpSession user() throws Exception { return login("/login", "user", "1234"); }

	private MockHttpSession admin() throws Exception { return login("/admin/login", "admin", "1234"); }

	private org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder write(
		MockHttpSession s, String category, String title, String content) {
		return post("/support").session(s).with(csrf()).param("category", category).param("title", title).param("content", content);
	}

	@Test
	void 더미_문의_4개_중_답변_완료_2개_접수_2개() {
		assertThat(inquiries.count()).isEqualTo(4);
		assertThat(inquiries.countByStatus(SupportInquiry.ANSWERED)).isEqualTo(2);
		assertThat(inquiries.countByStatus(SupportInquiry.RECEIVED)).isEqualTo(2);
	}

	@Test
	void 로그인해야_고객문의를_볼_수_있고_관리자_계정은_들어올_수_없다() throws Exception {
		mvc.perform(get("/support")).andExpect(status().is3xxRedirection()).andExpect(redirectedUrl("/login"));
		mvc.perform(get("/support").session(admin())).andExpect(status().isForbidden());
		mvc.perform(get("/support").session(user())).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("위탁 수하물 규정이 궁금해요")));
	}

	@Test
	void 문의를_등록하면_접수_상태로_저장되고_상세로_이동한다() throws Exception {
		long before = inquiries.count();
		MockHttpSession s = user();
		var result = mvc.perform(write(s, "TOUR", "새 문의 제목", "새 문의 내용")).andExpect(status().is3xxRedirection()).andReturn();
		assertThat(inquiries.count()).isEqualTo(before + 1);
		SupportInquiry saved = inquiries.findAll().stream().filter(q -> q.getTitle().equals("새 문의 제목")).findFirst().orElseThrow();
		assertThat(saved.getStatus()).isEqualTo("RECEIVED");
		assertThat(saved.getMemberId()).isEqualTo(1L);
		assertThat(result.getResponse().getRedirectedUrl()).isEqualTo("/support/" + saved.getInquiryId() + "?created");
		mvc.perform(get("/support/" + saved.getInquiryId()).session(s)).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("아직 답변을 준비하고 있어요")));
	}

	@Test
	void 제목이나_내용이_없거나_분류가_잘못되면_등록되지_않는다() throws Exception {
		long before = inquiries.count();
		MockHttpSession s = user();
		mvc.perform(write(s, "TOUR", "", "내용")).andExpect(status().isOk());
		mvc.perform(write(s, "TOUR", "제목", "")).andExpect(status().isOk());
		mvc.perform(write(s, "NOPE", "제목", "내용")).andExpect(status().isOk());
		assertThat(inquiries.count()).isEqualTo(before);
	}

	@Test
	void 남의_문의는_볼_수_없다() throws Exception {
		// 새 회원을 가입시켜 로그인하고, user 의 문의(1번)를 열어 본다
		mvc.perform(post("/signup").with(csrf()).param("loginId", "other1").param("password", "abcd1234")
			.param("passwordConfirm", "abcd1234").param("name", "다른사람").param("phone", "010-9999-8888").param("email", "other1@example.com"));
		MockHttpSession other = login("/login", "other1", "abcd1234");
		Long userInquiryId = inquiries.findByMemberIdOrderByCreatedAtDesc(1L).get(0).getInquiryId();
		mvc.perform(get("/support/" + userInquiryId).session(other)).andExpect(status().isNotFound());
		mvc.perform(get("/support").session(other)).andExpect(status().isOk())
			.andExpect(content().string(Matchers.not(Matchers.containsString("위탁 수하물"))));
	}

	@Test
	void 문의_내용의_HTML은_이스케이프된다() throws Exception {
		MockHttpSession s = user();
		mvc.perform(write(s, "ETC", "스크립트 시도", "<script>alert(1)</script>"));
		Long id = inquiries.findAll().stream().filter(q -> q.getTitle().equals("스크립트 시도")).findFirst().orElseThrow().getInquiryId();
		mvc.perform(get("/support/" + id).session(s)).andExpect(status().isOk())
			.andExpect(content().string(Matchers.not(Matchers.containsString("<script>alert(1)"))))
			.andExpect(content().string(Matchers.containsString("&lt;script&gt;alert(1)")));
	}

	@Test
	void 관리자가_답변하면_답변_완료로_바뀌고_사용자가_답변을_본다() throws Exception {
		List<SupportInquiry> waiting = inquiries.findByStatusOrderByCreatedAtDesc("RECEIVED");
		Long id = waiting.get(0).getInquiryId();
		MockHttpSession admin = admin();
		mvc.perform(get("/admin/inquiries?status=RECEIVED").session(admin)).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("답변하기")));
		mvc.perform(post("/admin/inquiries/" + id + "/answer").session(admin).with(csrf()).param("answer", "확인 후 안내드립니다."))
			.andExpect(redirectedUrl("/admin/inquiries/" + id + "?answered"));
		SupportInquiry q = inquiries.findById(id).orElseThrow();
		assertThat(q.getStatus()).isEqualTo("ANSWERED");
		assertThat(q.getAnsweredBy()).isEqualTo(1L);
		assertThat(q.getAnsweredAt()).isNotNull();
		assertThat(inquiries.countByStatus("RECEIVED")).isEqualTo(1);
		mvc.perform(get("/support/" + id).session(user())).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("확인 후 안내드립니다.")));
	}

	@Test
	void 빈_답변은_저장되지_않고_사용자는_관리자_문의_화면에_들어갈_수_없다() throws Exception {
		Long id = inquiries.findByStatusOrderByCreatedAtDesc("RECEIVED").get(0).getInquiryId();
		mvc.perform(post("/admin/inquiries/" + id + "/answer").session(admin()).with(csrf()).param("answer", "  "))
			.andExpect(status().isOk());
		assertThat(inquiries.findById(id).orElseThrow().getStatus()).isEqualTo("RECEIVED");
		mvc.perform(get("/admin/inquiries").session(user())).andExpect(status().isForbidden());
		mvc.perform(get("/admin/inquiries/99999").session(admin())).andExpect(status().isNotFound());
	}

	@Test
	void 상단_메뉴와_하단_탭_바에_고객문의가_있다() throws Exception {
		mvc.perform(get("/")).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("고객문의")))
			.andExpect(content().string(Matchers.containsString("data-tab=\"/support\"")));
	}
}
