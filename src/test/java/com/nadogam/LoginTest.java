package com.nadogam;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestBuilders.formLogin;
import static org.springframework.security.test.web.servlet.response.SecurityMockMvcResultMatchers.authenticated;
import static org.springframework.security.test.web.servlet.response.SecurityMockMvcResultMatchers.unauthenticated;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.security.web.FilterChainProxy;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.nadogam.auth.Member;
import com.nadogam.auth.MemberRepository;

// 로그인·회원가입: 가입 중복, 로그인 성공·실패, 사용자·관리자 영역 분리, 비밀번호 BCrypt 저장
@SpringBootTest
@Transactional
class LoginTest {

	@Autowired
	WebApplicationContext context;

	@Autowired
	FilterChainProxy springSecurityFilterChain;

	@Autowired
	MemberRepository members;

	MockMvc mvc;

	@BeforeEach
	void setUp() {
		mvc = MockMvcBuilders.webAppContextSetup(context).addFilters(springSecurityFilterChain).build();
	}

	private void signup(String loginId, String email) throws Exception {
		mvc.perform(post("/signup").with(csrf())
			.param("loginId", loginId).param("password", "abcd1234").param("passwordConfirm", "abcd1234")
			.param("name", "테스터").param("phone", "010-3333-4444").param("email", email));
	}

	@Test
	void 가입하면_비밀번호가_BCrypt로_저장된다() throws Exception {
		mvc.perform(post("/signup").with(csrf())
			.param("loginId", "newbie1").param("password", "abcd1234").param("passwordConfirm", "abcd1234")
			.param("name", "새회원").param("phone", "010-5555-6666").param("email", "newbie1@example.com"))
			.andExpect(status().is3xxRedirection()).andExpect(redirectedUrl("/login?joined"));

		Member saved = members.findByLoginId("newbie1").orElseThrow();
		assertThat(saved.getPasswordHash()).startsWith("$2").isNotEqualTo("abcd1234");
		assertThat(saved.getRole()).isEqualTo("ROLE_USER");
		assertThat(saved.getStatus()).isEqualTo("ACTIVE");
	}

	@Test
	void 아이디나_이메일이_중복이면_가입되지_않는다() throws Exception {
		mvc.perform(post("/signup").with(csrf())
			.param("loginId", "user").param("password", "abcd1234").param("passwordConfirm", "abcd1234")
			.param("name", "중복").param("phone", "010-1111-2222").param("email", "dup1@example.com"))
			.andExpect(status().isOk());
		mvc.perform(post("/signup").with(csrf())
			.param("loginId", "dupmail1").param("password", "abcd1234").param("passwordConfirm", "abcd1234")
			.param("name", "중복").param("phone", "010-1111-2222").param("email", "user@naver.com"))
			.andExpect(status().isOk());
		assertThat(members.existsByLoginId("dupmail1")).isFalse();
		assertThat(members.existsByEmail("dup1@example.com")).isFalse();
	}

	@Test
	void 입력_규칙에_어긋나면_가입되지_않는다() throws Exception {
		mvc.perform(post("/signup").with(csrf())
			.param("loginId", "ab").param("password", "short").param("passwordConfirm", "other")
			.param("name", "").param("phone", "0101234").param("email", "not-mail"))
			.andExpect(status().isOk());
		assertThat(members.existsByLoginId("ab")).isFalse();
	}

	@Test
	void 사용자_로그인_성공과_실패() throws Exception {
		mvc.perform(formLogin("/login").user("user").password("1234"))
			.andExpect(authenticated().withUsername("user")).andExpect(redirectedUrl("/"));
		mvc.perform(formLogin("/login").user("user").password("wrong"))
			.andExpect(unauthenticated()).andExpect(redirectedUrl("/login?error"));
	}

	@Test
	void 관리자_계정은_사용자_로그인으로_들어올_수_없다() throws Exception {
		mvc.perform(formLogin("/login").user("admin").password("1234"))
			.andExpect(unauthenticated()).andExpect(redirectedUrl("/login?error"));
	}

	@Test
	void 비로그인은_관리자_영역에서_관리자_로그인으로_보내진다() throws Exception {
		mvc.perform(get("/admin")).andExpect(status().is3xxRedirection())
			.andExpect(redirectedUrl("/admin/login"));
	}

	@Test
	void 사용자_계정으로_관리자_영역에_접근하면_403() throws Exception {
		MockHttpSession session = (MockHttpSession) mvc.perform(formLogin("/login").user("user").password("1234"))
			.andReturn().getRequest().getSession();
		mvc.perform(get("/admin").session(session)).andExpect(status().isForbidden());
	}

	@Test
	void 관리자는_관리자_로그인_후_관리자_영역에_접근한다() throws Exception {
		MockHttpSession session = (MockHttpSession) mvc.perform(formLogin("/admin/login").user("admin").password("1234"))
			.andExpect(authenticated().withUsername("admin")).andExpect(redirectedUrl("/admin"))
			.andReturn().getRequest().getSession();
		mvc.perform(get("/admin").session(session)).andExpect(status().isOk());
		mvc.perform(get("/admin/members").session(session)).andExpect(status().isOk());
	}

	@Test
	void 계정_메뉴는_로그인해야_볼_수_있다() throws Exception {
		mvc.perform(get("/account")).andExpect(status().is3xxRedirection())
			.andExpect(redirectedUrl("/login"));
		MockHttpSession session = (MockHttpSession) mvc.perform(formLogin("/login").user("user").password("1234"))
			.andReturn().getRequest().getSession();
		mvc.perform(get("/account").session(session)).andExpect(status().isOk());
	}

	@Test
	void 내_정보를_수정할_수_있다() throws Exception {
		signup("editor1", "editor1@example.com");
		MockHttpSession session = (MockHttpSession) mvc.perform(formLogin("/login").user("editor1").password("abcd1234"))
			.andReturn().getRequest().getSession();
		mvc.perform(post("/account/edit").session(session).with(csrf())
			.param("name", "바뀐이름").param("phone", "010-7777-8888").param("email", "editor1@example.com"))
			.andExpect(redirectedUrl("/account?updated"));
		assertThat(members.findByLoginId("editor1").orElseThrow().getName()).isEqualTo("바뀐이름");
	}

	private MockHttpSession loginAs(String loginId, String password) throws Exception {
		return (MockHttpSession) mvc.perform(formLogin("/login").user(loginId).password(password))
			.andReturn().getRequest().getSession();
	}

	@Test
	void 현재_비밀번호가_맞으면_비밀번호를_바꾼다() throws Exception {
		signup("pwuser1", "pwuser1@example.com");
		MockHttpSession session = loginAs("pwuser1", "abcd1234");
		mvc.perform(post("/account/password").session(session).with(csrf())
			.param("currentPassword", "abcd1234").param("newPassword", "newpass99").param("newPasswordConfirm", "newpass99"))
			.andExpect(redirectedUrl("/account?passwordChanged"));
		mvc.perform(formLogin("/login").user("pwuser1").password("abcd1234")).andExpect(unauthenticated());
		mvc.perform(formLogin("/login").user("pwuser1").password("newpass99")).andExpect(authenticated());
		assertThat(members.findByLoginId("pwuser1").orElseThrow().getPasswordHash()).startsWith("$2");
	}

	@Test
	void 현재_비밀번호가_틀리거나_규칙에_어긋나면_바뀌지_않는다() throws Exception {
		signup("pwuser2", "pwuser2@example.com");
		MockHttpSession session = loginAs("pwuser2", "abcd1234");
		mvc.perform(post("/account/password").session(session).with(csrf())
			.param("currentPassword", "wrongpass1").param("newPassword", "newpass99").param("newPasswordConfirm", "newpass99"))
			.andExpect(status().isOk());
		mvc.perform(post("/account/password").session(session).with(csrf())
			.param("currentPassword", "abcd1234").param("newPassword", "short").param("newPasswordConfirm", "short"))
			.andExpect(status().isOk());
		mvc.perform(formLogin("/login").user("pwuser2").password("abcd1234")).andExpect(authenticated());
	}

	@Test
	void 탈퇴하면_상태만_바뀌고_더_이상_로그인할_수_없다() throws Exception {
		signup("leaver1", "leaver1@example.com");
		MockHttpSession session = loginAs("leaver1", "abcd1234");
		mvc.perform(post("/account/withdraw").session(session).with(csrf())
			.param("password", "abcd1234").param("agree", "true"))
			.andExpect(redirectedUrl("/?withdrawn"));
		Member m = members.findByLoginId("leaver1").orElseThrow();
		assertThat(m.getStatus()).isEqualTo("WITHDRAWN");
		assertThat(m.getWithdrawnAt()).isNotNull();
		mvc.perform(formLogin("/login").user("leaver1").password("abcd1234"))
			.andExpect(unauthenticated()).andExpect(redirectedUrl("/login?error"));
	}

	@Test
	void 탈퇴는_비밀번호와_동의가_있어야_한다() throws Exception {
		signup("leaver2", "leaver2@example.com");
		MockHttpSession session = loginAs("leaver2", "abcd1234");
		mvc.perform(post("/account/withdraw").session(session).with(csrf())
			.param("password", "wrongpass1").param("agree", "true")).andExpect(status().isOk());
		mvc.perform(post("/account/withdraw").session(session).with(csrf())
			.param("password", "abcd1234")).andExpect(status().isOk());
		assertThat(members.findByLoginId("leaver2").orElseThrow().getStatus()).isEqualTo("ACTIVE");
	}
}
