package com.nadogam;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestBuilders.formLogin;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.hamcrest.Matchers;
import jakarta.persistence.EntityManager;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.security.web.FilterChainProxy;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

// 관리자 확장: 회원 정지/복구(로그인 차단), 상품 노출 중지/재개(사용자 화면 반영), 감사 로그, 접근 권한
@SpringBootTest
@Transactional
class AdminCatalogTest {

	@Autowired
	WebApplicationContext context;

	@Autowired
	FilterChainProxy springSecurityFilterChain;

	@Autowired
	JdbcClient jdbc;

	@Autowired
	EntityManager em;

	MockMvc mvc;

	@BeforeEach
	void setUp() {
		mvc = MockMvcBuilders.webAppContextSetup(context).addFilters(springSecurityFilterChain).build();
	}

	private MockHttpSession adminSession() throws Exception {
		return (MockHttpSession) mvc.perform(formLogin("/admin/login").user("admin").password("1234"))
			.andReturn().getRequest().getSession();
	}

	private long count(String sql) {
		return jdbc.sql(sql).query(Long.class).single();
	}

	@Test
	void 정지한_회원은_로그인할_수_없고_복구하면_다시_로그인된다() throws Exception {
		MockHttpSession admin = adminSession();
		long id = count("SELECT member_id FROM member WHERE login_id = 'user'");

		mvc.perform(post("/admin/members/{id}/status", id).session(admin).with(csrf()).param("action", "suspend"))
			.andExpect(redirectedUrl("/admin/members?saved"));
		em.flush();
		assertThat(jdbc.sql("SELECT status FROM member WHERE member_id = :id").param("id", id).query(String.class).single())
			.isEqualTo("SUSPENDED");
		mvc.perform(formLogin("/login").user("user").password("1234"))
			.andExpect(redirectedUrl("/login?error"));

		mvc.perform(post("/admin/members/{id}/status", id).session(admin).with(csrf()).param("action", "restore"))
			.andExpect(redirectedUrl("/admin/members?saved"));
		mvc.perform(formLogin("/login").user("user").password("1234"))
			.andExpect(redirectedUrl("/"));
	}

	@Test
	void 탈퇴한_회원과_잘못된_동작은_거절한다() throws Exception {
		MockHttpSession admin = adminSession();
		long id = count("SELECT member_id FROM member WHERE login_id = 'user'");
		mvc.perform(post("/admin/members/{id}/status", id).session(admin).with(csrf()).param("action", "delete"))
			.andExpect(status().isBadRequest());
		jdbc.sql("UPDATE member SET status = 'WITHDRAWN' WHERE member_id = :id").param("id", id).update();
		em.clear();
		mvc.perform(post("/admin/members/{id}/status", id).session(admin).with(csrf()).param("action", "restore"))
			.andExpect(status().isBadRequest());
		mvc.perform(post("/admin/members/999999/status").session(admin).with(csrf()).param("action", "suspend"))
			.andExpect(status().isNotFound());
	}

	@Test
	void 여행지_운항_중지는_사유와_함께_저장되고_재개하면_지워진다() throws Exception {
		MockHttpSession admin = adminSession();
		long id = count("SELECT destination_id FROM destination WHERE name_ko = '파리'");

		mvc.perform(post("/admin/catalog/destination/{id}/toggle", id).session(admin).with(csrf()).param("reason", "점검 중"))
			.andExpect(redirectedUrl("/admin/catalog?kind=destination&saved"));
		var row = jdbc.sql("SELECT status, unavailable_reason FROM destination WHERE destination_id = :id").param("id", id).query().singleRow();
		assertThat(row.get("STATUS")).isEqualTo("UNAVAILABLE");
		assertThat(row.get("UNAVAILABLE_REASON")).isEqualTo("점검 중");

		mvc.perform(post("/admin/catalog/destination/{id}/toggle", id).session(admin).with(csrf()))
			.andExpect(redirectedUrl("/admin/catalog?kind=destination&saved"));
		row = jdbc.sql("SELECT status, unavailable_reason FROM destination WHERE destination_id = :id").param("id", id).query().singleRow();
		assertThat(row.get("STATUS")).isEqualTo("AVAILABLE");
		assertThat(row.get("UNAVAILABLE_REASON")).isNull();
	}

	@Test
	void 투어를_중지하면_사용자_화면에서_사라진다() throws Exception {
		MockHttpSession admin = adminSession();
		long id = count("SELECT MIN(tour_id) FROM tour");
		mvc.perform(get("/tour/{id}", id)).andExpect(status().isOk());

		mvc.perform(post("/admin/catalog/tour/{id}/toggle", id).session(admin).with(csrf()))
			.andExpect(redirectedUrl("/admin/catalog?kind=tour&saved"));
		mvc.perform(get("/tour/{id}", id)).andExpect(status().isNotFound());
	}

	@Test
	void 특별기획_호텔_크루즈_국내도시도_노출을_끄고_켠다() throws Exception {
		MockHttpSession admin = adminSession();
		long plan = count("SELECT MIN(plan_id) FROM monthly_plan");
		mvc.perform(post("/admin/catalog/plan/{id}/toggle", plan).session(admin).with(csrf())).andExpect(status().is3xxRedirection());
		assertThat(jdbc.sql("SELECT is_active FROM monthly_plan WHERE plan_id = :id").param("id", plan).query(Boolean.class).single()).isFalse();
		mvc.perform(post("/admin/catalog/plan/{id}/toggle", plan).session(admin).with(csrf())).andExpect(status().is3xxRedirection());
		assertThat(jdbc.sql("SELECT is_active FROM monthly_plan WHERE plan_id = :id").param("id", plan).query(Boolean.class).single()).isTrue();

		long hotel = count("SELECT MIN(hotel_id) FROM hotel");
		mvc.perform(post("/admin/catalog/hotel/{id}/toggle", hotel).session(admin).with(csrf())).andExpect(status().is3xxRedirection());
		assertThat(jdbc.sql("SELECT status FROM hotel WHERE hotel_id = :id").param("id", hotel).query(String.class).single()).isEqualTo("HIDDEN");

		long cruise = count("SELECT MIN(cruise_id) FROM cruise");
		mvc.perform(post("/admin/catalog/cruise/{id}/toggle", cruise).session(admin).with(csrf())).andExpect(status().is3xxRedirection());
		assertThat(jdbc.sql("SELECT status FROM cruise WHERE cruise_id = :id").param("id", cruise).query(String.class).single()).isEqualTo("HIDDEN");

		long city = count("SELECT MIN(city_id) FROM domestic_city");
		mvc.perform(post("/admin/catalog/city/{id}/toggle", city).session(admin).with(csrf())).andExpect(status().is3xxRedirection());
		mvc.perform(get("/domestic/{id}", city)).andExpect(status().isNotFound());
	}

	@Test
	void 변경마다_감사_로그가_남는다() throws Exception {
		MockHttpSession admin = adminSession();
		long before = count("SELECT COUNT(*) FROM admin_audit_log");
		long hotel = count("SELECT MIN(hotel_id) FROM hotel");
		mvc.perform(post("/admin/catalog/hotel/{id}/toggle", hotel).session(admin).with(csrf()));
		assertThat(count("SELECT COUNT(*) FROM admin_audit_log")).isEqualTo(before + 1);
		assertThat(jdbc.sql("SELECT action FROM admin_audit_log ORDER BY log_id DESC LIMIT 1").query(String.class).single()).isEqualTo("HIDE");
	}

	@Test
	void 관리_화면은_종류별_목록을_보여_주고_없는_종류는_404이다() throws Exception {
		MockHttpSession admin = adminSession();
		mvc.perform(get("/admin/catalog").session(admin)).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("파리")));
		mvc.perform(get("/admin/catalog").session(admin).param("kind", "hotel").param("q", "서울"))
			.andExpect(status().isOk());
		mvc.perform(get("/admin/catalog").session(admin).param("kind", "member; DROP TABLE member"))
			.andExpect(status().isNotFound());
	}

	@Test
	void 관리자가_아니면_접근할_수_없다() throws Exception {
		mvc.perform(get("/admin/catalog")).andExpect(status().is3xxRedirection());
		mvc.perform(post("/admin/catalog/hotel/1/toggle").with(csrf())).andExpect(status().is3xxRedirection());
		mvc.perform(post("/admin/members/1/status").with(csrf()).param("action", "suspend")).andExpect(status().is3xxRedirection());
	}
}
