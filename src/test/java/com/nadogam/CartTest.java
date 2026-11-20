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
import java.util.List;

import org.hamcrest.Matchers;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.security.web.FilterChainProxy;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import com.nadogam.auth.Member;
import com.nadogam.auth.MemberRepository;
import com.nadogam.cart.CartItem;
import com.nadogam.cart.CartItemRepository;
import com.nadogam.cart.CartLine;
import com.nadogam.cart.CartService;
import com.nadogam.cart.Reservation;
import com.nadogam.cart.ReservationItemRepository;
import com.nadogam.cart.ReservationRepository;

// 장바구니·모의 결제·내 예약: 가격은 서버가 계산, 로그인·본인 것만, 결제하면 예약이 되고 장바구니가 비워진다.
@SpringBootTest
@Transactional
class CartTest {

	@Autowired
	WebApplicationContext context;

	@Autowired
	FilterChainProxy springSecurityFilterChain;

	@Autowired
	JdbcTemplate jdbc;

	@Autowired
	CartService service;

	@Autowired
	CartItemRepository carts;

	@Autowired
	ReservationRepository reservations;

	@Autowired
	ReservationItemRepository reservationItems;

	@Autowired
	MemberRepository members;

	MockMvc mvc;

	@BeforeEach
	void setUp() {
		mvc = MockMvcBuilders.webAppContextSetup(context).addFilters(springSecurityFilterChain).build();
	}

	private MockHttpSession login(String url, String id) throws Exception {
		return (MockHttpSession) mvc.perform(formLogin(url).user(id).password("1234")).andReturn().getRequest().getSession();
	}

	private MockHttpSession user() throws Exception { return login("/login", "user"); }

	private String date() { return LocalDate.now().plusDays(30).toString(); }

	private long tourId() {
		return jdbc.queryForObject("SELECT t.tour_id FROM tour t JOIN destination d ON d.destination_id = t.destination_id WHERE d.name_ko = '로마' AND t.theme = 'FOOD_DRINK'", Long.class);
	}

	private long optionId(long tourId, int nights) {
		return jdbc.queryForObject("SELECT option_id FROM tour_option WHERE tour_id = ? AND nights = ?", Long.class, tourId, nights);
	}

	private MockHttpServletRequestBuilder add(MockHttpSession s, String type, Object refId, String... kv) {
		MockHttpServletRequestBuilder b = post("/cart/add").session(s).with(csrf()).param("type", type).param("refId", String.valueOf(refId));
		for (int i = 0; i < kv.length; i += 2) {
			b.param(kv[i], kv[i + 1]);
		}
		return b;
	}

	@Test
	void 로그인해야_장바구니와_예약을_볼_수_있고_관리자는_들어올_수_없다() throws Exception {
		mvc.perform(get("/cart")).andExpect(status().is3xxRedirection()).andExpect(redirectedUrl("/login"));
		mvc.perform(get("/reservations")).andExpect(status().is3xxRedirection()).andExpect(redirectedUrl("/login"));
		mvc.perform(post("/cart/add").with(csrf()).param("type", "TOUR")).andExpect(status().is3xxRedirection()).andExpect(redirectedUrl("/login"));
		mvc.perform(get("/cart").session(login("/admin/login", "admin"))).andExpect(status().isForbidden());
		mvc.perform(get("/cart").session(user())).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("장바구니가 비어 있어요")));
	}

	@Test
	void 투어를_담으면_가격은_DB_값으로_계산된다() throws Exception {
		long tour = tourId();
		long opt = optionId(tour, 6);
		int price = jdbc.queryForObject("SELECT price_per_person FROM tour_option WHERE option_id = ?", Integer.class, opt);
		MockHttpSession s = user();
		// 화면에서 가격을 보내도 무시한다.
		mvc.perform(add(s, "TOUR", tour, "optionId", String.valueOf(opt), "quantity", "3", "date", date(), "unitPrice", "1"))
			.andExpect(status().is3xxRedirection()).andExpect(redirectedUrl("/cart?added"));
		List<CartItem> items = carts.findByMemberIdOrderByCreatedAtDesc(1L);
		assertThat(items).hasSize(1);
		assertThat(items.get(0).getUnitPrice()).isEqualTo(price);
		assertThat(items.get(0).getLineAmount()).isEqualTo(price * 3L);
		assertThat(items.get(0).getDetail()).contains("6박 7일").contains("3명");
		mvc.perform(get("/cart").session(s)).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("로마 미식·주류 투어")))
			.andExpect(content().string(Matchers.containsString("₩" + String.format("%,d", price * 3L))));
	}

	@Test
	void 호텔은_1박_가격에_박수를_곱하고_크루즈는_객실_종류별_가격이다() throws Exception {
		long hotel = jdbc.queryForObject("SELECT MIN(hotel_id) FROM hotel", Long.class);
		int perNight = jdbc.queryForObject("SELECT price_per_night FROM hotel WHERE hotel_id = ?", Integer.class, hotel);
		CartLine h = service.price("HOTEL", hotel, null, null, 4, 2);
		assertThat(h.unitPrice()).isEqualTo(perNight * 4);
		assertThat(h.quantity()).isEqualTo(2);
		long cruise = jdbc.queryForObject("SELECT MIN(cruise_id) FROM cruise", Long.class);
		int inside = jdbc.queryForObject("SELECT price_inside FROM cruise WHERE cruise_id = ?", Integer.class, cruise);
		int balcony = jdbc.queryForObject("SELECT price_balcony FROM cruise WHERE cruise_id = ?", Integer.class, cruise);
		assertThat(service.price("CRUISE", cruise, null, "INSIDE", null, 2).unitPrice()).isEqualTo(inside);
		assertThat(service.price("CRUISE", cruise, null, "BALCONY", null, 2).unitPrice()).isEqualTo(balcony);
	}

	@Test
	void 잘못된_입력은_담기지_않고_메시지를_보여_준다() throws Exception {
		long tour = tourId();
		long opt = optionId(tour, 6);
		MockHttpSession s = user();
		// 지난 날짜, 1년 넘은 날짜, 날짜 없음
		mvc.perform(add(s, "TOUR", tour, "optionId", String.valueOf(opt), "quantity", "2", "date", LocalDate.now().toString()))
			.andExpect(flash().attribute("error", "여행 날짜는 내일부터 1년 안에서 골라 주세요."));
		mvc.perform(add(s, "TOUR", tour, "optionId", String.valueOf(opt), "quantity", "2", "date", LocalDate.now().plusYears(2).toString()))
			.andExpect(flash().attributeExists("error"));
		mvc.perform(add(s, "TOUR", tour, "optionId", String.valueOf(opt), "quantity", "2"))
			.andExpect(flash().attribute("error", "여행 날짜를 골라 주세요."));
		// 인원 범위 밖, 다른 투어의 옵션, 없는 상품, 알 수 없는 종류
		mvc.perform(add(s, "TOUR", tour, "optionId", String.valueOf(opt), "quantity", "999", "date", date()))
			.andExpect(flash().attributeExists("error"));
		mvc.perform(add(s, "TOUR", tour + 1, "optionId", String.valueOf(opt), "quantity", "2", "date", date()))
			.andExpect(flash().attribute("error", "없는 투어예요."));
		mvc.perform(add(s, "HOTEL", 999999, "nights", "3", "quantity", "1", "date", date()))
			.andExpect(flash().attribute("error", "없는 호텔이에요."));
		mvc.perform(add(s, "HOTEL", 1, "nights", "99", "quantity", "1", "date", date()))
			.andExpect(flash().attributeExists("error"));
		mvc.perform(add(s, "CRUISE", 1, "cabin", "SUITE", "quantity", "1", "date", date()))
			.andExpect(flash().attribute("error", "객실 종류를 골라 주세요."));
		mvc.perform(add(s, "BUS", 1, "quantity", "1", "date", date()))
			.andExpect(flash().attribute("error", "담을 수 없는 상품이에요."));
		assertThat(carts.countByMemberId(1L)).isZero();
		assertThatThrownBy(() -> CartService.checkDate(null, LocalDate.now())).isInstanceOf(IllegalArgumentException.class);
	}

	@Test
	void 장바구니에는_20개까지만_담을_수_있다() throws Exception {
		CartLine line = service.price("HOTEL", 1L, null, null, 1, 1);
		for (int i = 0; i < CartService.MAX_CART_ITEMS; i++) {
			service.add(1L, line, LocalDate.now().plusDays(10));
		}
		assertThatThrownBy(() -> service.add(1L, line, LocalDate.now().plusDays(10)))
			.isInstanceOf(IllegalArgumentException.class).hasMessageContaining("최대 20개");
	}

	@Test
	void 결제하면_예약이_만들어지고_장바구니가_비워진다() throws Exception {
		long tour = tourId();
		long opt = optionId(tour, 6);
		int price = jdbc.queryForObject("SELECT price_per_person FROM tour_option WHERE option_id = ?", Integer.class, opt);
		MockHttpSession s = user();
		mvc.perform(add(s, "TOUR", tour, "optionId", String.valueOf(opt), "quantity", "2", "date", date()));
		mvc.perform(add(s, "HOTEL", 1, "nights", "2", "quantity", "1", "date", date()));
		int hotelAmount = jdbc.queryForObject("SELECT price_per_night FROM hotel WHERE hotel_id = 1", Integer.class) * 2;
		assertThat(carts.countByMemberId(1L)).isEqualTo(2);

		var result = mvc.perform(post("/checkout").session(s).with(csrf()).param("method", "CARD")).andExpect(status().is3xxRedirection()).andReturn();
		List<Reservation> mine = reservations.findByMemberIdOrderByPaidAtDesc(1L);
		assertThat(mine).hasSize(1);
		Reservation r = mine.get(0);
		assertThat(r.getTotalAmount()).isEqualTo(price * 2L + hotelAmount);
		assertThat(r.getStatus()).isEqualTo("PAID");
		assertThat(r.getReservationNo()).matches("NG\\d{8}-[0-9A-F]{6}");
		assertThat(result.getResponse().getRedirectedUrl()).isEqualTo("/reservations/" + r.getReservationId() + "?paid");
		assertThat(reservationItems.findByReservationIdOrderByReservationItemId(r.getReservationId())).hasSize(2);
		assertThat(carts.countByMemberId(1L)).isZero();

		mvc.perform(get("/reservations/" + r.getReservationId() + "?paid").session(s)).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("결제가 완료되었습니다")))
			.andExpect(content().string(Matchers.containsString("로마 미식·주류 투어")));
		mvc.perform(get("/reservations").session(s)).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString(r.getReservationNo())));
	}

	@Test
	void 빈_장바구니나_잘못된_결제_수단은_결제되지_않는다() throws Exception {
		MockHttpSession s = user();
		mvc.perform(post("/checkout").session(s).with(csrf()).param("method", "CARD"))
			.andExpect(flash().attribute("error", "장바구니가 비어 있어요."));
		mvc.perform(add(s, "HOTEL", 1, "nights", "1", "quantity", "1", "date", date()));
		mvc.perform(post("/checkout").session(s).with(csrf()).param("method", "BITCOIN"))
			.andExpect(flash().attribute("error", "결제 수단을 골라 주세요."));
		mvc.perform(post("/checkout").session(s).with(csrf()))
			.andExpect(flash().attribute("error", "결제 수단을 골라 주세요."));
		assertThat(reservations.count()).isZero();
		assertThat(carts.countByMemberId(1L)).isEqualTo(1);
	}

	@Test
	void 남의_장바구니_줄은_빼지_못하고_남의_예약은_404다() throws Exception {
		Member other = members.save(Member.register("other1", "x", "다른사람", "010-0000-0000", "o@example.com"));
		CartItem theirs = carts.save(CartItem.create(other.getMemberId(), service.price("HOTEL", 1L, null, null, 1, 1), LocalDate.now().plusDays(5)));
		Reservation theirRes = reservations.save(Reservation.paid(other.getMemberId(), "NG20990101-AAAAAA", 100000, com.nadogam.cart.PayMethod.BANK));
		MockHttpSession s = user();
		mvc.perform(post("/cart/" + theirs.getCartItemId() + "/delete").session(s).with(csrf())).andExpect(status().is3xxRedirection());
		assertThat(carts.findById(theirs.getCartItemId())).isPresent();
		mvc.perform(get("/reservations/" + theirRes.getReservationId()).session(s)).andExpect(status().isNotFound());

		mvc.perform(add(s, "HOTEL", 1, "nights", "1", "quantity", "1", "date", date()));
		CartItem mine = carts.findByMemberIdOrderByCreatedAtDesc(1L).get(0);
		mvc.perform(post("/cart/" + mine.getCartItemId() + "/delete").session(s).with(csrf())).andExpect(redirectedUrl("/cart?removed"));
		assertThat(carts.countByMemberId(1L)).isZero();
	}

	@Test
	void 상품_화면에_담기_폼이_있다() throws Exception {
		long tour = tourId();
		mvc.perform(get("/tour/" + tour)).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("장바구니 담기")))
			.andExpect(content().string(Matchers.containsString("name=\"optionId\"")));
		Long rome = jdbc.queryForObject("SELECT destination_id FROM destination WHERE name_ko = '로마'", Long.class);
		mvc.perform(get("/travel/" + rome + "/hotels")).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("value=\"HOTEL\"")));
		mvc.perform(get("/travel/" + rome + "/cruise")).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("value=\"CRUISE\"")));
		mvc.perform(get("/").session(user())).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString(">장바구니</a>")))
			.andExpect(content().string(Matchers.containsString(">내 예약</a>")));
	}
}
