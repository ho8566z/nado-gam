package com.nadogam;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestBuilders.formLogin;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.flash;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.time.LocalDate;

import org.hamcrest.Matchers;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.security.web.FilterChainProxy;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import com.nadogam.cart.CartLine;
import com.nadogam.cart.CartService;
import com.nadogam.cart.ItemType;

// 항공권·국내 이동편도 장바구니에 담긴다: 가격은 서버가 계산, 좌석·운항 요일·판매 상태 검증, 결제하면 예약에 포함
@SpringBootTest
@Transactional
class CartFlightTest {

	@Autowired
	WebApplicationContext context;

	@Autowired
	FilterChainProxy springSecurityFilterChain;

	@Autowired
	JdbcTemplate jdbc;

	@Autowired
	CartService service;

	MockMvc mvc;

	@BeforeEach
	void setUp() {
		mvc = MockMvcBuilders.webAppContextSetup(context).addFilters(springSecurityFilterChain).build();
	}

	private MockHttpSession user() throws Exception {
		return (MockHttpSession) mvc.perform(formLogin("/login").user("user").password("1234")).andReturn().getRequest().getSession();
	}

	private long flightId(String flightNo) {
		return jdbc.queryForObject("SELECT flight_id FROM flight WHERE flight_no = ?", Long.class, flightNo);
	}

	// 오늘부터 30일 안에서 이 항공편이 운항하는 날짜를 찾는다.
	private LocalDate operatingDate(long flightId) {
		String days = jdbc.queryForObject("SELECT operating_days FROM flight WHERE flight_id = ?", String.class, flightId);
		LocalDate d = LocalDate.now().plusDays(10);
		while (days.charAt(d.getDayOfWeek().getValue() - 1) != '1') {
			d = d.plusDays(1);
		}
		return d;
	}

	// 열흘 뒤부터 처음 만나는 해당 요일 날짜
	private LocalDate next(java.time.DayOfWeek day) {
		return LocalDate.now().plusDays(10).with(java.time.temporal.TemporalAdjusters.nextOrSame(day));
	}

	@Test
	void 항공권_가격은_운임과_세금_유류할증료를_합친_편도_1인_요금이다() {
		long id = flightId("MG2701");
		int expected = jdbc.queryForObject("SELECT base_price + tax_fuel FROM flight_fare WHERE flight_id = ? AND cabin_class = 'ECONOMY'", Integer.class, id);
		CartLine line = service.price("FLIGHT", id, null, "ECONOMY", null, 2);
		assertThat(line.type()).isEqualTo(ItemType.FLIGHT);
		assertThat(line.unitPrice()).isEqualTo(expected);
		assertThat(line.quantity()).isEqualTo(2);
		assertThat(line.title()).startsWith("MG2701 ").contains("→");
		assertThat(line.detail()).contains("일반석").contains("편도").contains("2명");
	}

	@Test
	void 항공권은_좌석_등급과_인원_남은_좌석을_검증한다() {
		long id = flightId("MG2701");
		assertThatThrownBy(() -> service.price("FLIGHT", id, null, null, null, 1)).hasMessage("좌석 등급을 골라 주세요.");
		assertThatThrownBy(() -> service.price("FLIGHT", id, null, "FIRST", null, 1)).hasMessageContaining("고를 수 없는 좌석 등급");
		assertThatThrownBy(() -> service.price("FLIGHT", id, null, "ECONOMY", null, 0)).hasMessageContaining("인원은 1~9명");
		assertThatThrownBy(() -> service.price("FLIGHT", id, null, "ECONOMY", null, 10)).hasMessageContaining("인원은 1~9명");
		jdbc.update("UPDATE flight_fare SET seats_left = 2 WHERE flight_id = ? AND cabin_class = 'ECONOMY'", id);
		assertThatThrownBy(() -> service.price("FLIGHT", id, null, "ECONOMY", null, 3)).hasMessage("남은 좌석이 2석뿐이에요.");
		assertThat(service.price("FLIGHT", id, null, "ECONOMY", null, 2).quantity()).isEqualTo(2);
		assertThatThrownBy(() -> service.price("FLIGHT", 99999L, null, "ECONOMY", null, 1)).hasMessageContaining("없는 항공편");
	}

	@Test
	void 운항하지_않는_요일과_판매_중지_항공편은_담을_수_없다() {
		long id = flightId("MG2701");
		jdbc.update("UPDATE flight SET operating_days = '1000000' WHERE flight_id = ?", id);
		assertThat(service.price("FLIGHT", id, null, "ECONOMY", null, 1, next(java.time.DayOfWeek.MONDAY)).quantity()).isEqualTo(1);
		assertThatThrownBy(() -> service.price("FLIGHT", id, null, "ECONOMY", null, 1, next(java.time.DayOfWeek.TUESDAY)))
			.hasMessageContaining("운항하지 않아요");
		jdbc.update("UPDATE flight SET status = 'STOPPED' WHERE flight_id = ?", id);
		assertThatThrownBy(() -> service.price("FLIGHT", id, null, "ECONOMY", null, 1)).hasMessageContaining("없는 항공편");
	}

	@Test
	void 국내_이동편은_편도_요금으로_담기고_중지한_도시는_담을_수_없다() {
		long id = jdbc.queryForObject("SELECT MIN(transport_id) FROM domestic_transport", Long.class);
		int fare = jdbc.queryForObject("SELECT fare FROM domestic_transport WHERE transport_id = ?", Integer.class, id);
		CartLine line = service.price("TRANSPORT", id, null, null, null, 3);
		assertThat(line.type()).isEqualTo(ItemType.TRANSPORT);
		assertThat(line.unitPrice()).isEqualTo(fare);
		assertThat(line.detail()).contains("편도").contains("3명").contains("출발");
		assertThatThrownBy(() -> service.price("TRANSPORT", id, null, null, null, 10)).hasMessageContaining("인원은 1~9명");
		assertThatThrownBy(() -> service.price("TRANSPORT", 99999L, null, null, null, 1)).hasMessage("없는 이동편이에요.");
		jdbc.update("UPDATE domestic_city SET status = 'UNAVAILABLE' WHERE city_id = (SELECT city_id FROM domestic_transport WHERE transport_id = ?)", id);
		assertThatThrownBy(() -> service.price("TRANSPORT", id, null, null, null, 1)).hasMessage("없는 이동편이에요.");
	}

	@Test
	void 항공권과_이동편을_담아_결제하면_예약에_함께_들어간다() throws Exception {
		MockHttpSession s = user();
		long flight = flightId("MG2701");
		long transport = jdbc.queryForObject("SELECT MIN(transport_id) FROM domestic_transport", Long.class);
		mvc.perform(post("/cart/add").session(s).with(csrf()).param("type", "FLIGHT").param("refId", String.valueOf(flight))
			.param("cabin", "ECONOMY").param("quantity", "2").param("date", operatingDate(flight).toString()))
			.andExpect(redirectedUrl("/cart?added"));
		mvc.perform(post("/cart/add").session(s).with(csrf()).param("type", "TRANSPORT").param("refId", String.valueOf(transport))
			.param("quantity", "1").param("date", LocalDate.now().plusDays(12).toString()))
			.andExpect(redirectedUrl("/cart?added"));
		mvc.perform(get("/cart").session(s)).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("항공권")))
			.andExpect(content().string(Matchers.containsString("국내 이동편")));
		mvc.perform(post("/checkout").session(s).with(csrf()).param("method", "CARD"))
			.andExpect(status().is3xxRedirection());
		assertThat(jdbc.queryForObject("SELECT COUNT(*) FROM reservation_item WHERE item_type IN ('FLIGHT','TRANSPORT')", Integer.class)).isEqualTo(2);
	}

	@Test
	void 운항하지_않는_날짜로_담으면_오류_메시지를_보여_준다() throws Exception {
		MockHttpSession s = user();
		long flight = flightId("MG2701");
		jdbc.update("UPDATE flight SET operating_days = '0000000' WHERE flight_id = ?", flight);
		mvc.perform(post("/cart/add").session(s).with(csrf()).param("type", "FLIGHT").param("refId", String.valueOf(flight))
			.param("cabin", "ECONOMY").param("quantity", "1").param("date", LocalDate.now().plusDays(10).toString()))
			.andExpect(redirectedUrl("/cart"))
			.andExpect(flash().attribute("error", "선택한 날짜에는 운항하지 않아요. 운항 요일을 확인해 주세요."));
	}

	@Test
	void 항공편_상세와_국내_도시_화면에_담기_폼이_있다() throws Exception {
		long flight = flightId("MG2701");
		mvc.perform(get("/travel/flights/{id}", flight)).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("name=\"type\" value=\"FLIGHT\"")));
		long city = jdbc.queryForObject("SELECT city_id FROM domestic_city ORDER BY city_id LIMIT 1", Long.class);
		mvc.perform(get("/domestic/{id}", city)).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("name=\"type\" value=\"TRANSPORT\"")));
	}

	@Test
	void 팝업_문구에_특정_월이_들어가지_않는다() {
		assertThat(jdbc.queryForObject("SELECT COUNT(*) FROM popup_event WHERE body LIKE '%월 한 달%' OR body LIKE '%11월%'", Integer.class)).isZero();
	}
}
