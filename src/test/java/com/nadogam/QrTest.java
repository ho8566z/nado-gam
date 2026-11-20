package com.nadogam;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestBuilders.formLogin;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.header;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.time.LocalDate;

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

import com.nadogam.admin.AdminCheckinController;
import com.nadogam.cart.CartService;
import com.nadogam.cart.PayMethod;
import com.nadogam.cart.Reservation;
import com.nadogam.cart.ReservationRepository;
import com.nadogam.qr.QrService;

// QR 코드: 이미지 생성과 입력 검증, 예약 QR(스캔 화면), 관리자 체크인, 팝업·모바일 접속 QR
@SpringBootTest
@Transactional
class QrTest {

	@Autowired
	WebApplicationContext context;

	@Autowired
	FilterChainProxy springSecurityFilterChain;

	@Autowired
	QrService qr;

	@Autowired
	CartService cart;

	@Autowired
	ReservationRepository reservations;

	MockMvc mvc;

	@BeforeEach
	void setUp() {
		mvc = MockMvcBuilders.webAppContextSetup(context).addFilters(springSecurityFilterChain).build();
	}

	private MockHttpSession login(String url, String id) throws Exception {
		return (MockHttpSession) mvc.perform(formLogin(url).user(id).password("1234")).andReturn().getRequest().getSession();
	}

	// 사용자 1이 호텔 1개를 결제한 예약을 만든다.
	private Reservation paidReservation() {
		cart.add(1L, cart.price("HOTEL", 1L, null, null, 2, 1), LocalDate.now().plusDays(10));
		return cart.checkout(1L, PayMethod.CARD.name());
	}

	@Test
	void QR은_SVG로_만들어지고_사이트_주소를_붙인다() throws Exception {
		String svg = qr.svg("http://localhost:8080/tour/1");
		assertThat(svg).startsWith("<svg").contains("viewBox=\"0 0 ").contains("<path");
		mvc.perform(get("/qr").param("target", "/tour/1")).andExpect(status().isOk())
			.andExpect(header().string("Content-Type", Matchers.containsString("image/svg+xml")))
			.andExpect(content().string(Matchers.startsWith("<svg")));
		// 같은 내용이면 같은 이미지, 다른 내용이면 다른 이미지
		assertThat(qr.svg("A")).isEqualTo(qr.svg("A")).isNotEqualTo(qr.svg("B"));
	}

	@Test
	void 허용하지_않는_주소는_QR로_만들지_않는다() throws Exception {
		for (String bad : new String[] { "javascript:alert(1)", "//evil.example.com", "ftp://x.com/a", "tour/1", "/a b", "data:text/html,x" }) {
			mvc.perform(get("/qr").param("target", bad)).andExpect(status().isBadRequest());
		}
		mvc.perform(get("/qr").param("target", "/" + "a".repeat(QrService.MAX_LENGTH))).andExpect(status().isBadRequest());
		mvc.perform(get("/qr")).andExpect(status().isBadRequest());
		mvc.perform(get("/qr").param("target", "https://example.com/event")).andExpect(status().isOk());
		assertThat(QrService.isValidTarget("/event/1?a=1")).isTrue();
		assertThat(QrService.isValidTarget(null)).isFalse();
	}

	@Test
	void 결제한_예약마다_고유한_QR_토큰이_생기고_내_예약에_QR이_보인다() throws Exception {
		Reservation r = paidReservation();
		assertThat(r.getQrToken()).hasSize(32).matches("[0-9a-f]{32}");
		MockHttpSession s = login("/login", "user");
		mvc.perform(get("/reservations/" + r.getReservationId()).session(s)).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("/qr?target=/r/" + r.getQrToken())));
		Reservation second = paidReservation();
		assertThat(second.getQrToken()).isNotEqualTo(r.getQrToken());
	}

	@Test
	void QR을_스캔한_확인_화면은_로그인_없이_열리고_개인정보는_없다() throws Exception {
		Reservation r = paidReservation();
		mvc.perform(get("/r/" + r.getQrToken())).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString(r.getReservationNo())))
			.andExpect(content().string(Matchers.containsString("결제 완료")))
			.andExpect(content().string(Matchers.not(Matchers.containsString("user@example.com"))));
		mvc.perform(get("/r/" + "0".repeat(32))).andExpect(status().isNotFound());
	}

	@Test
	void 체크인_입력에서_토큰을_뽑는다() {
		assertThat(AdminCheckinController.extractCode("http://192.168.0.10:8080/r/abc123?x=1#y")).isEqualTo("abc123");
		assertThat(AdminCheckinController.extractCode("  abc123  ")).isEqualTo("abc123");
		assertThat(AdminCheckinController.extractCode(null)).isEmpty();
	}

	@Test
	void 관리자는_QR_주소나_예약번호로_체크인하고_두_번째는_무시된다() throws Exception {
		Reservation r = paidReservation();
		MockHttpSession admin = login("/admin/login", "admin");
		mvc.perform(get("/admin/checkin").param("code", "http://x.example/r/" + r.getQrToken()).session(admin)).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString(r.getReservationNo())))
			.andExpect(content().string(Matchers.containsString("체크인 처리")));
		mvc.perform(get("/admin/checkin").param("code", r.getReservationNo().toLowerCase()).session(admin)).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("체크인 처리")));

		mvc.perform(post("/admin/checkin/" + r.getReservationId()).session(admin).with(csrf()))
			.andExpect(redirectedUrl("/admin/checkin?code=" + r.getReservationNo() + "&done"));
		Reservation done = reservations.findById(r.getReservationId()).orElseThrow();
		assertThat(done.getStatus()).isEqualTo("CHECKED_IN");
		assertThat(done.getCheckedInBy()).isNotNull();
		var firstTime = done.getCheckedInAt();
		mvc.perform(post("/admin/checkin/" + r.getReservationId()).session(admin).with(csrf()))
			.andExpect(redirectedUrl("/admin/checkin?code=" + r.getReservationNo() + "&already"));
		assertThat(reservations.findById(r.getReservationId()).orElseThrow().getCheckedInAt()).isEqualTo(firstTime);
		mvc.perform(get("/r/" + r.getQrToken())).andExpect(content().string(Matchers.containsString("체크인 완료")));
		mvc.perform(get("/admin/checkin").param("code", "없는코드").session(admin)).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("일치하는 예약이 없습니다")));
	}

	@Test
	void 체크인은_관리자만_할_수_있다() throws Exception {
		Reservation r = paidReservation();
		mvc.perform(get("/admin/checkin")).andExpect(status().is3xxRedirection()).andExpect(redirectedUrl("/admin/login"));
		mvc.perform(post("/admin/checkin/" + r.getReservationId()).session(login("/login", "user")).with(csrf()))
			.andExpect(status().isForbidden());
		assertThat(reservations.findById(r.getReservationId()).orElseThrow().getStatus()).isEqualTo("PAID");
	}

	@Test
	void 팝업과_푸터에_QR이_있다() throws Exception {
		mvc.perform(get("/")).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("data-qr-self")))
			.andExpect(content().string(Matchers.containsString("휴대폰으로 보기")));
		mvc.perform(get("/")).andExpect(content().string(Matchers.containsString("popup-qr")));
	}
}
