package com.nadogam;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestBuilders.formLogin;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.flash;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.time.LocalDate;

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

// 결제하면 항공권 좌석이 줄어든다: 결제한 만큼 차감, 결제 순간 좌석이 모자라면 결제 전체가 거절된다.
@SpringBootTest
@Transactional
class SeatDeductionTest {

	@Autowired
	WebApplicationContext context;

	@Autowired
	FilterChainProxy springSecurityFilterChain;

	@Autowired
	JdbcTemplate jdbc;

	MockMvc mvc;

	@BeforeEach
	void setUp() {
		mvc = MockMvcBuilders.webAppContextSetup(context).addFilters(springSecurityFilterChain).build();
	}

	private MockHttpSession user() throws Exception {
		return (MockHttpSession) mvc.perform(formLogin("/login").user("user").password("1234")).andReturn().getRequest().getSession();
	}

	private long flightId() {
		return jdbc.queryForObject("SELECT flight_id FROM flight WHERE flight_no = 'MG2701'", Long.class);
	}

	private int seatsLeft(long flight, String cabin) {
		return jdbc.queryForObject("SELECT seats_left FROM flight_fare WHERE flight_id = ? AND cabin_class = ?", Integer.class, flight, cabin);
	}

	private LocalDate operatingDate(long flightId) {
		String days = jdbc.queryForObject("SELECT operating_days FROM flight WHERE flight_id = ?", String.class, flightId);
		LocalDate d = LocalDate.now().plusDays(10);
		while (days.charAt(d.getDayOfWeek().getValue() - 1) != '1') {
			d = d.plusDays(1);
		}
		return d;
	}

	private void addFlight(MockHttpSession s, long flight, String cabin, int people) throws Exception {
		mvc.perform(post("/cart/add").session(s).with(csrf()).param("type", "FLIGHT").param("refId", String.valueOf(flight))
			.param("cabin", cabin).param("quantity", String.valueOf(people)).param("date", operatingDate(flight).toString()))
			.andExpect(redirectedUrl("/cart?added"));
	}

	@Test
	void 결제하면_결제한_인원만큼_좌석이_줄고_판매_수가_늘고_등급이_예약에_남는다() throws Exception {
		MockHttpSession s = user();
		long flight = flightId();
		int before = seatsLeft(flight, "ECONOMY");
		int businessBefore = seatsLeft(flight, "BUSINESS");
		int salesBefore = jdbc.queryForObject("SELECT sales_count FROM flight_sales_stat WHERE flight_id = ?", Integer.class, flight);
		addFlight(s, flight, "ECONOMY", 2);
		mvc.perform(post("/checkout").session(s).with(csrf()).param("method", "CARD")).andExpect(status().is3xxRedirection());
		assertThat(seatsLeft(flight, "ECONOMY")).isEqualTo(before - 2);
		assertThat(seatsLeft(flight, "BUSINESS")).isEqualTo(businessBefore);   // 다른 등급은 그대로
		assertThat(jdbc.queryForObject("SELECT sales_count FROM flight_sales_stat WHERE flight_id = ?", Integer.class, flight)).isEqualTo(salesBefore + 2);
		assertThat(jdbc.queryForObject("SELECT cabin_class FROM reservation_item WHERE item_type = 'FLIGHT' AND ref_id = ?", String.class, flight)).isEqualTo("ECONOMY");
	}

	@Test
	void 같은_항공편_같은_등급의_여러_줄은_합쳐서_차감한다() throws Exception {
		MockHttpSession s = user();
		long flight = flightId();
		int before = seatsLeft(flight, "ECONOMY");
		addFlight(s, flight, "ECONOMY", 2);
		addFlight(s, flight, "ECONOMY", 3);
		mvc.perform(post("/checkout").session(s).with(csrf()).param("method", "CARD")).andExpect(status().is3xxRedirection());
		assertThat(seatsLeft(flight, "ECONOMY")).isEqualTo(before - 5);
	}

	@Test
	void 담은_뒤_결제_전에_좌석이_모자라지면_결제가_거절되고_예약도_좌석_변화도_없다() throws Exception {
		MockHttpSession s = user();
		long flight = flightId();
		addFlight(s, flight, "ECONOMY", 3);
		jdbc.update("UPDATE flight_fare SET seats_left = 2 WHERE flight_id = ? AND cabin_class = 'ECONOMY'", flight);   // 그 사이 다른 사람이 샀다고 가정
		int reservationsBefore = jdbc.queryForObject("SELECT COUNT(*) FROM reservation", Integer.class);
		mvc.perform(post("/checkout").session(s).with(csrf()).param("method", "CARD"))
			.andExpect(redirectedUrl("/cart"))
			.andExpect(flash().attributeExists("error"));
		assertThat(seatsLeft(flight, "ECONOMY")).isEqualTo(2);
		assertThat(jdbc.queryForObject("SELECT COUNT(*) FROM reservation", Integer.class)).isEqualTo(reservationsBefore);
		assertThat(jdbc.queryForObject("SELECT COUNT(*) FROM cart_item", Integer.class)).isEqualTo(1);   // 장바구니는 그대로
	}

	@Test
	void 담은_뒤_판매가_중지된_항공권은_결제할_수_없다() throws Exception {
		MockHttpSession s = user();
		long flight = flightId();
		addFlight(s, flight, "ECONOMY", 1);
		int before = seatsLeft(flight, "ECONOMY");
		jdbc.update("UPDATE flight SET status = 'DELETED' WHERE flight_id = ?", flight);
		mvc.perform(post("/checkout").session(s).with(csrf()).param("method", "CARD"))
			.andExpect(redirectedUrl("/cart"))
			.andExpect(flash().attributeExists("error"));
		assertThat(seatsLeft(flight, "ECONOMY")).isEqualTo(before);
	}

	@Test
	void 항공권이_아닌_상품은_결제해도_좌석에_영향이_없다() throws Exception {
		MockHttpSession s = user();
		int total = jdbc.queryForObject("SELECT SUM(seats_left) FROM flight_fare", Integer.class);
		Long hotel = jdbc.queryForObject("SELECT MIN(hotel_id) FROM hotel", Long.class);
		mvc.perform(post("/cart/add").session(s).with(csrf()).param("type", "HOTEL").param("refId", String.valueOf(hotel))
			.param("nights", "2").param("quantity", "1").param("date", LocalDate.now().plusDays(12).toString()))
			.andExpect(redirectedUrl("/cart?added"));
		mvc.perform(post("/checkout").session(s).with(csrf()).param("method", "CARD")).andExpect(status().is3xxRedirection());
		assertThat(jdbc.queryForObject("SELECT SUM(seats_left) FROM flight_fare", Integer.class)).isEqualTo(total);
	}
}
