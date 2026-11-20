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
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.security.web.FilterChainProxy;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

// 관리자 상품 관리(호텔·항공편·특별전·투어): 등록·수정·삭제(삭제 탭)·복구·영구 삭제와 입력 검증, 사용자 화면 반영
@SpringBootTest
@Transactional
class AdminProductCrudTest {

	@Autowired
	WebApplicationContext context;

	@Autowired
	FilterChainProxy springSecurityFilterChain;

	@Autowired
	JdbcClient jdbc;

	MockMvc mvc;
	MockHttpSession admin;

	@BeforeEach
	void setUp() throws Exception {
		mvc = MockMvcBuilders.webAppContextSetup(context).addFilters(springSecurityFilterChain).build();
		admin = (MockHttpSession) mvc.perform(formLogin("/admin/login").user("admin").password("1234")).andReturn().getRequest().getSession();
	}

	private long one(String sql) {
		return jdbc.sql(sql).query(Long.class).single();
	}

	private String str(String sql) {
		return jdbc.sql(sql).query(String.class).single();
	}

	private MockHttpServletRequestBuilder postAs(String url, String... kv) {
		MockHttpServletRequestBuilder b = post(url).session(admin).with(csrf());
		for (int i = 0; i < kv.length; i += 2) {
			b.param(kv[i], kv[i + 1]);
		}
		return b;
	}

	// ---------------------------------------------------------------- 접근 권한
	@Test
	void 사용자와_비회원은_상품_관리_화면에_들어갈_수_없다() throws Exception {
		for (String path : new String[] { "/admin/hotels", "/admin/flights", "/admin/plans", "/admin/tours", "/admin/hotels/new" }) {
			mvc.perform(get(path)).andExpect(status().is3xxRedirection());
			MockHttpSession user = (MockHttpSession) mvc.perform(formLogin("/login").user("user").password("1234")).andReturn().getRequest().getSession();
			mvc.perform(get(path).session(user)).andExpect(status().is4xxClientError());
		}
		mvc.perform(post("/admin/hotels/1/delete").with(csrf())).andExpect(status().is3xxRedirection());
		assertThat(str("SELECT status FROM hotel WHERE hotel_id = 1")).isEqualTo("ON_SALE");
	}

	@Test
	void 관리자_메뉴에_상품_관리_네_가지가_있다() throws Exception {
		mvc.perform(get("/admin/hotels").session(admin)).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("특별전 관리")))
			.andExpect(content().string(Matchers.containsString("투어 관리")))
			.andExpect(content().string(Matchers.containsString("호텔 관리")))
			.andExpect(content().string(Matchers.containsString("항공편 관리")))
			.andExpect(content().string(Matchers.containsString("삭제됨")));
	}

	// ---------------------------------------------------------------- 호텔
	private String[] hotel(String name, String price) {
		long paris = one("SELECT destination_id FROM destination WHERE name_ko = '파리'");
		return new String[] { "scope", "OVERSEAS", "destinationId", String.valueOf(paris), "name", name, "grade", "4", "area", "시내 중심",
			"summary", "관리자가 등록한 테스트 호텔", "amenities", "무료 Wi-Fi, 조식", "pricePerNight", price, "sortOrder", "0" };
	}

	@Test
	void 호텔을_등록하면_사용자_호텔_목록에_나오고_잘못된_입력은_저장되지_않는다() throws Exception {
		long paris = one("SELECT destination_id FROM destination WHERE name_ko = '파리'");
		long before = one("SELECT COUNT(*) FROM hotel");
		mvc.perform(postAs("/admin/hotels", hotel("관리자 호텔", "5000"))).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("1박 가격은 10,000원 이상")));
		assertThat(one("SELECT COUNT(*) FROM hotel")).isEqualTo(before);

		mvc.perform(postAs("/admin/hotels", hotel("관리자 호텔", "230000"))).andExpect(redirectedUrl("/admin/hotels?saved"));
		assertThat(one("SELECT COUNT(*) FROM hotel")).isEqualTo(before + 1);
		assertThat(one("SELECT COUNT(*) FROM admin_audit_log WHERE action = 'HOTEL_CREATE'")).isEqualTo(1);
		mvc.perform(get("/travel/{id}/hotels", paris)).andExpect(content().string(Matchers.containsString("관리자 호텔")));
	}

	@Test
	void 호텔을_수정하고_삭제하면_삭제_탭으로_가고_복구와_영구_삭제가_된다() throws Exception {
		mvc.perform(postAs("/admin/hotels", hotel("관리자 호텔", "230000"))).andExpect(redirectedUrl("/admin/hotels?saved"));
		long id = one("SELECT MAX(hotel_id) FROM hotel");
		long paris = one("SELECT destination_id FROM destination WHERE name_ko = '파리'");

		String[] edit = hotel("관리자 호텔(수정)", "310000");
		mvc.perform(postAs("/admin/hotels/" + id, edit)).andExpect(redirectedUrl("/admin/hotels?saved"));
		assertThat(one("SELECT price_per_night FROM hotel WHERE hotel_id = " + id)).isEqualTo(310000);
		assertThat(str("SELECT name FROM hotel WHERE hotel_id = " + id)).isEqualTo("관리자 호텔(수정)");

		// 영구 삭제는 삭제 탭에 있는 것만
		mvc.perform(postAs("/admin/hotels/" + id + "/purge")).andExpect(status().is3xxRedirection());
		assertThat(one("SELECT COUNT(*) FROM hotel WHERE hotel_id = " + id)).isEqualTo(1);

		mvc.perform(postAs("/admin/hotels/" + id + "/delete")).andExpect(redirectedUrl("/admin/hotels?deleted"));
		assertThat(str("SELECT status FROM hotel WHERE hotel_id = " + id)).isEqualTo("DELETED");
		mvc.perform(get("/travel/{id}/hotels", paris)).andExpect(content().string(Matchers.not(Matchers.containsString("관리자 호텔(수정)"))));
		mvc.perform(get("/admin/hotels").session(admin).param("tab", "active")).andExpect(content().string(Matchers.not(Matchers.containsString("관리자 호텔(수정)"))));
		mvc.perform(get("/admin/hotels").session(admin).param("tab", "trash")).andExpect(content().string(Matchers.containsString("관리자 호텔(수정)")));
		mvc.perform(get("/admin/hotels/" + id + "/edit").session(admin)).andExpect(status().isNotFound());
		// 삭제 탭의 항목은 노출 관리에서 켤 수도 없다
		mvc.perform(postAs("/admin/catalog/hotel/" + id + "/toggle")).andExpect(status().isNotFound());

		mvc.perform(postAs("/admin/hotels/" + id + "/restore")).andExpect(redirectedUrl("/admin/hotels?tab=trash&restored"));
		assertThat(str("SELECT status FROM hotel WHERE hotel_id = " + id)).isEqualTo("ON_SALE");
		mvc.perform(get("/travel/{id}/hotels", paris)).andExpect(content().string(Matchers.containsString("관리자 호텔(수정)")));

		mvc.perform(postAs("/admin/hotels/" + id + "/delete")).andExpect(status().is3xxRedirection());
		mvc.perform(postAs("/admin/hotels/" + id + "/purge")).andExpect(redirectedUrl("/admin/hotels?tab=trash&purged"));
		assertThat(one("SELECT COUNT(*) FROM hotel WHERE hotel_id = " + id)).isZero();
	}

	// ---------------------------------------------------------------- 항공편
	private String[] flight(String no, String type, String via, String duration, boolean economy) {
		long paris = one("SELECT destination_id FROM destination WHERE name_ko = '파리'");
		java.util.List<String> p = new java.util.ArrayList<>(java.util.List.of("flightNo", no, "airlineCode", "MG", "destinationId", String.valueOf(paris),
			"originAirport", "ICN", "arrivalAirport", "CDG", "flightType", type, "departureTime", "10:00", "durationMinutes", duration,
			"aircraft", "B777-300ER", "baggageKg", "23", "mealIncluded", "true", "days", "1", "days", "2", "days", "3", "days", "4", "days", "5",
			"fares[0].cabin", "ECONOMY", "fares[1].cabin", "PREMIUM", "fares[2].cabin", "BUSINESS", "fares[3].cabin", "FIRST"));
		if (via != null) {
			p.addAll(java.util.List.of("viaAirport", via));
		}
		if (economy) {
			p.addAll(java.util.List.of("fares[0].enabled", "true", "fares[0].price", "900000", "fares[0].taxFuel", "100000", "fares[0].seatsTotal", "250",
				"fares[0].refundable", "true", "fares[0].changeFee", "100000", "fares[0].mileageRate", "1.0"));
		}
		return p.toArray(new String[0]);
	}

	@Test
	void 직항_항공편을_등록하면_도착_시각과_구간_요금이_계산되어_저장된다() throws Exception {
		mvc.perform(postAs("/admin/flights", flight("MG777", "DIRECT", null, "860", true))).andExpect(redirectedUrl("/admin/flights?saved"));
		long id = one("SELECT flight_id FROM flight WHERE flight_no = 'MG777'");
		// 10:00 출발 + 14시간 20분 + 시차(파리 -8시간) = 같은 날 16:20 도착
		assertThat(str("SELECT CAST(arrival_time AS VARCHAR) FROM flight WHERE flight_id = " + id)).startsWith("16:20");
		assertThat(one("SELECT arrival_day_offset FROM flight WHERE flight_id = " + id)).isZero();
		assertThat(str("SELECT operating_days FROM flight WHERE flight_id = " + id)).isEqualTo("1111100");
		assertThat(one("SELECT COUNT(*) FROM flight_segment WHERE flight_id = " + id)).isEqualTo(1);
		assertThat(one("SELECT base_price FROM flight_fare WHERE flight_id = " + id + " AND cabin_class = 'ECONOMY'")).isEqualTo(800000);
		assertThat(one("SELECT seats_left FROM flight_fare WHERE flight_id = " + id + " AND cabin_class = 'ECONOMY'")).isEqualTo(250);   // 비우면 전체 좌석
		assertThat(one("SELECT COUNT(*) FROM flight_fare WHERE flight_id = " + id)).isEqualTo(1);
		assertThat(one("SELECT COUNT(*) FROM flight_sales_stat WHERE flight_id = " + id)).isEqualTo(1);
		long paris = one("SELECT destination_id FROM destination WHERE name_ko = '파리'");
		mvc.perform(get("/travel/{id}", paris).param("origin", "ICN")).andExpect(content().string(Matchers.containsString("MG777")));
	}

	@Test
	void 경유_항공편은_구간_시간과_대기_시간이_자동으로_나뉜다() throws Exception {
		mvc.perform(postAs("/admin/flights", flight("MG778", "CONNECTING", "IST", "1000", true))).andExpect(redirectedUrl("/admin/flights?saved"));
		long id = one("SELECT flight_id FROM flight WHERE flight_no = 'MG778'");
		assertThat(one("SELECT COUNT(*) FROM flight_segment WHERE flight_id = " + id)).isEqualTo(2);
		assertThat(one("SELECT stops FROM flight WHERE flight_id = " + id)).isEqualTo(1);
		long sum = one("SELECT SUM(duration_minutes) FROM flight_segment WHERE flight_id = " + id) + one("SELECT layover_minutes FROM flight_segment WHERE flight_id = " + id + " AND seq = 1");
		assertThat(sum).isEqualTo(1000);   // 두 구간 + 대기 = 총 소요 시간
		assertThat(one("SELECT layover_minutes FROM flight_segment WHERE flight_id = " + id + " AND seq = 1")).isGreaterThanOrEqualTo(60);
		assertThat(str("SELECT to_airport FROM flight_segment WHERE flight_id = " + id + " AND seq = 1")).isEqualTo("IST");
	}

	@Test
	void 항공편_입력이_잘못되면_저장되지_않고_이유를_보여_준다() throws Exception {
		long before = one("SELECT COUNT(*) FROM flight");
		// 요금 등급을 하나도 체크하지 않음
		mvc.perform(postAs("/admin/flights", flight("MG779", "DIRECT", null, "860", false))).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("좌석 등급을 하나 이상 체크")));
		// 경유 공항 없음
		mvc.perform(postAs("/admin/flights", flight("MG779", "CONNECTING", null, "860", true))).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("경유 공항을 골라 주세요")));
		// 이미 있는 편명(MG901)
		mvc.perform(postAs("/admin/flights", flight("MG901", "DIRECT", null, "860", true))).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("이미 같은 편명이 있어요")));
		// 편명 형식 오류
		mvc.perform(postAs("/admin/flights", flight("12", "DIRECT", null, "860", true))).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("편명은 항공사 코드 2자")));
		// 경유인데 시간이 너무 짧음
		mvc.perform(postAs("/admin/flights", flight("MG780", "CONNECTING", "IST", "120", true))).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("경유 항공편은 총 소요 시간이 최소")));
		assertThat(one("SELECT COUNT(*) FROM flight")).isEqualTo(before);
	}

	@Test
	void 항공편을_삭제하면_사용자_화면과_특별전에서_빠지고_복구하면_돌아온다() throws Exception {
		long paris = one("SELECT destination_id FROM destination WHERE name_ko = '파리'");
		long id = one("SELECT flight_id FROM flight WHERE flight_no = 'MG901'");
		mvc.perform(get("/travel/{id}", paris).param("origin", "ICN")).andExpect(content().string(Matchers.containsString("MG901")));
		mvc.perform(postAs("/admin/flights/" + id + "/delete")).andExpect(redirectedUrl("/admin/flights?deleted"));
		mvc.perform(get("/travel/{id}", paris).param("origin", "ICN")).andExpect(content().string(Matchers.not(Matchers.containsString("MG901"))));
		mvc.perform(get("/admin/flights").session(admin).param("tab", "trash")).andExpect(content().string(Matchers.containsString("MG901")));

		// 특별전(로마 MG937)의 항공편을 지우면 그 특별전 상세에서 빠진다
		long plan = one("SELECT plan_id FROM monthly_plan WHERE title LIKE '로마%'");
		long rome = one("SELECT flight_id FROM flight WHERE flight_no = 'MG937'");
		mvc.perform(get("/special/{id}", plan)).andExpect(content().string(Matchers.containsString("MG937")));
		mvc.perform(postAs("/admin/flights/" + rome + "/delete")).andExpect(status().is3xxRedirection());
		mvc.perform(get("/special/{id}", plan)).andExpect(content().string(Matchers.not(Matchers.containsString("MG937"))));

		mvc.perform(postAs("/admin/flights/" + rome + "/restore")).andExpect(redirectedUrl("/admin/flights?tab=trash&restored"));
		mvc.perform(get("/special/{id}", plan)).andExpect(content().string(Matchers.containsString("MG937")));
	}

	@Test
	void 항공편_영구_삭제는_삭제_탭의_항공편만_되고_구간_요금_특별전_연결까지_지운다() throws Exception {
		long rome = one("SELECT flight_id FROM flight WHERE flight_no = 'MG937'");
		mvc.perform(postAs("/admin/flights/" + rome + "/purge")).andExpect(status().is3xxRedirection());
		assertThat(one("SELECT COUNT(*) FROM flight WHERE flight_id = " + rome)).isEqualTo(1);   // 삭제 탭에 없으면 못 지움
		mvc.perform(postAs("/admin/flights/" + rome + "/delete")).andExpect(status().is3xxRedirection());
		mvc.perform(postAs("/admin/flights/" + rome + "/purge")).andExpect(redirectedUrl("/admin/flights?tab=trash&purged"));
		for (String t : new String[] { "flight", "flight_segment", "flight_fare", "flight_sales_stat", "monthly_plan_flight" }) {
			assertThat(one("SELECT COUNT(*) FROM " + t + " WHERE flight_id = " + rome)).as(t).isZero();
		}
	}

	@Test
	void 항공편을_수정하면_요금과_좌석이_바뀌고_체크를_푼_등급은_사라진다() throws Exception {
		mvc.perform(postAs("/admin/flights", flight("MG777", "DIRECT", null, "860", true))).andExpect(redirectedUrl("/admin/flights?saved"));
		long id = one("SELECT flight_id FROM flight WHERE flight_no = 'MG777'");
		java.util.List<String> p = new java.util.ArrayList<>(java.util.List.of(flight("MG777", "DIRECT", null, "900", false)));
		p.addAll(java.util.List.of("fares[1].enabled", "true", "fares[1].price", "1500000", "fares[1].taxFuel", "100000", "fares[1].seatsTotal", "30",
			"fares[1].seatsLeft", "12", "fares[1].changeFee", "0", "fares[1].mileageRate", "1.25"));
		mvc.perform(postAs("/admin/flights/" + id, p.toArray(new String[0]))).andExpect(redirectedUrl("/admin/flights?saved"));
		assertThat(one("SELECT duration_minutes FROM flight WHERE flight_id = " + id)).isEqualTo(900);
		assertThat(one("SELECT COUNT(*) FROM flight_fare WHERE flight_id = " + id + " AND cabin_class = 'ECONOMY'")).isZero();   // 일반석 체크 해제
		assertThat(one("SELECT seats_left FROM flight_fare WHERE flight_id = " + id + " AND cabin_class = 'PREMIUM'")).isEqualTo(12);
	}

	// ---------------------------------------------------------------- 특별전
	private String[] plan(String sale, String flightNo) {
		long rome = one("SELECT destination_id FROM destination WHERE name_ko = '로마'");
		long flight = one("SELECT flight_id FROM flight WHERE flight_no = '" + flightNo + "'");
		java.time.LocalDateTime now = java.time.LocalDateTime.now().withSecond(0).withNano(0);
		return new String[] { "planMonth", "2026-12", "destinationId", String.valueOf(rome), "title", "관리자 특별전", "subtitle", "테스트 부제",
			"badgeText", "최대 40% OFF", "highlights", "하나\n둘", "startAt", now.minusDays(1).toString(), "endAt", now.plusDays(20).toString(), "active", "true",
			"deals[0].flightId", String.valueOf(flight), "deals[0].cabin", "ECONOMY", "deals[0].salePrice", sale, "deals[0].limitedSeats", "10" };
	}

	@Test
	void 특별전을_등록하면_정가는_실제_요금으로_채워지고_사용자_화면에_나온다() throws Exception {
		mvc.perform(postAs("/admin/plans", plan("500000", "MG937"))).andExpect(redirectedUrl("/admin/plans?saved"));
		long id = one("SELECT MAX(plan_id) FROM monthly_plan");
		assertThat(one("SELECT original_price FROM monthly_plan_flight WHERE plan_id = " + id)).isEqualTo(980000);   // MG937 일반석 실제 요금
		mvc.perform(get("/special/{id}", id)).andExpect(status().isOk()).andExpect(content().string(Matchers.containsString("관리자 특별전")));
		mvc.perform(get("/special")).andExpect(content().string(Matchers.containsString("관리자 특별전")));
	}

	@Test
	void 특별전_입력이_잘못되면_저장되지_않는다() throws Exception {
		long before = one("SELECT COUNT(*) FROM monthly_plan");
		// 특가가 정가보다 비쌈
		mvc.perform(postAs("/admin/plans", plan("990000", "MG937"))).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("정가(980,000원)보다 낮아야")));
		// 다른 여행지의 항공편(파리 MG901)
		mvc.perform(postAs("/admin/plans", plan("500000", "MG901"))).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("같은 여행지의 항공편만")));
		assertThat(one("SELECT COUNT(*) FROM monthly_plan")).isEqualTo(before);
	}

	@Test
	void 특별전을_삭제하면_삭제_탭으로_가고_사용자_화면에서_사라지며_복구_영구_삭제가_된다() throws Exception {
		mvc.perform(postAs("/admin/plans", plan("500000", "MG937"))).andExpect(redirectedUrl("/admin/plans?saved"));
		long id = one("SELECT MAX(plan_id) FROM monthly_plan");
		mvc.perform(postAs("/admin/plans/" + id + "/delete")).andExpect(redirectedUrl("/admin/plans?deleted"));
		mvc.perform(get("/special/{id}", id)).andExpect(status().isNotFound());
		mvc.perform(get("/admin/plans").session(admin).param("tab", "trash")).andExpect(content().string(Matchers.containsString("관리자 특별전")));
		mvc.perform(postAs("/admin/catalog/plan/" + id + "/toggle")).andExpect(status().isNotFound());
		mvc.perform(postAs("/admin/plans/" + id + "/restore")).andExpect(redirectedUrl("/admin/plans?tab=trash&restored"));
		mvc.perform(get("/special/{id}", id)).andExpect(status().isOk());
		mvc.perform(postAs("/admin/plans/" + id + "/purge")).andExpect(status().is3xxRedirection());
		assertThat(one("SELECT COUNT(*) FROM monthly_plan WHERE plan_id = " + id)).isEqualTo(1);
		mvc.perform(postAs("/admin/plans/" + id + "/delete")).andExpect(status().is3xxRedirection());
		mvc.perform(postAs("/admin/plans/" + id + "/purge")).andExpect(redirectedUrl("/admin/plans?tab=trash&purged"));
		assertThat(one("SELECT COUNT(*) FROM monthly_plan WHERE plan_id = " + id)).isZero();
		assertThat(one("SELECT COUNT(*) FROM monthly_plan_flight WHERE plan_id = " + id)).isZero();
	}

	// ---------------------------------------------------------------- 투어
	// 마닐라는 1테마 투어만 있으므로 그 테마가 아닌 테마로 새 투어를 만든다.
	private String freeTheme(long dest) {
		String existing = str("SELECT theme FROM tour WHERE destination_id = " + dest);
		return java.util.List.of("FOOD_DRINK", "SPORTS_ACTIVITY", "ART_REST").stream().filter(t -> !t.equals(existing)).findFirst().orElseThrow();
	}

	private String[] tour(long dest, String theme, int nights, int dayRows) {
		java.util.List<String> p = new java.util.ArrayList<>(java.util.List.of("scope", "OVERSEAS", "destinationId", String.valueOf(dest), "theme", theme,
			"title", "관리자 투어", "subtitle", "테스트 투어 부제", "collabBrand", "테스트 브랜드", "highlights", "하나\n둘", "includes", "가이드", "excludes", "항공권",
			"sortOrder", "0", "options[0].nights", String.valueOf(nights), "options[0].price", "500000", "options[0].minPeople", "2", "options[0].maxPeople", "10"));
		for (int i = 0; i < dayRows; i++) {
			p.addAll(java.util.List.of("options[0].days[" + i + "].title", (i + 1) + "일차 제목", "options[0].days[" + i + "].description", (i + 1) + "일차 설명"));
		}
		return p.toArray(new String[0]);
	}

	@Test
	void 투어를_등록하면_옵션과_일정이_저장되고_사용자_화면에서_보인다() throws Exception {
		long dest = one("SELECT destination_id FROM destination WHERE name_ko = '마닐라'");
		mvc.perform(postAs("/admin/tours", tour(dest, freeTheme(dest), 2, 3))).andExpect(redirectedUrl("/admin/tours?saved"));
		long id = one("SELECT MAX(tour_id) FROM tour");
		assertThat(one("SELECT COUNT(*) FROM tour_option WHERE tour_id = " + id)).isEqualTo(1);
		assertThat(one("SELECT COUNT(*) FROM tour_day WHERE option_id IN (SELECT option_id FROM tour_option WHERE tour_id = " + id + ")")).isEqualTo(3);
		mvc.perform(get("/tour/{id}", id)).andExpect(status().isOk()).andExpect(content().string(Matchers.containsString("관리자 투어")))
			.andExpect(content().string(Matchers.containsString("3일차 제목")));
	}

	@Test
	void 투어_입력이_잘못되면_저장되지_않는다() throws Exception {
		long dest = one("SELECT destination_id FROM destination WHERE name_ko = '마닐라'");
		long before = one("SELECT COUNT(*) FROM tour");
		// 2박 3일인데 일정이 2일치
		mvc.perform(postAs("/admin/tours", tour(dest, freeTheme(dest), 2, 2))).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("일정이 3일치여야")));
		// 같은 여행지·테마의 투어가 이미 있음
		mvc.perform(postAs("/admin/tours", tour(dest, str("SELECT theme FROM tour WHERE destination_id = " + dest), 2, 3))).andExpect(status().isOk())
			.andExpect(content().string(Matchers.containsString("같은 테마의 투어가 이미 있어요")));
		assertThat(one("SELECT COUNT(*) FROM tour")).isEqualTo(before);
	}

	@Test
	void 투어를_수정하면_옵션과_일정이_새로_저장되고_삭제_복구_영구_삭제가_된다() throws Exception {
		long dest = one("SELECT destination_id FROM destination WHERE name_ko = '마닐라'");
		String theme = freeTheme(dest);
		mvc.perform(postAs("/admin/tours", tour(dest, theme, 2, 3))).andExpect(redirectedUrl("/admin/tours?saved"));
		long id = one("SELECT MAX(tour_id) FROM tour");

		mvc.perform(postAs("/admin/tours/" + id, tour(dest, theme, 1, 2))).andExpect(redirectedUrl("/admin/tours?saved"));
		assertThat(one("SELECT nights FROM tour_option WHERE tour_id = " + id)).isEqualTo(1);
		assertThat(one("SELECT COUNT(*) FROM tour_day WHERE option_id IN (SELECT option_id FROM tour_option WHERE tour_id = " + id + ")")).isEqualTo(2);

		mvc.perform(postAs("/admin/tours/" + id + "/delete")).andExpect(redirectedUrl("/admin/tours?deleted"));
		mvc.perform(get("/tour/{id}", id)).andExpect(status().isNotFound());
		mvc.perform(postAs("/admin/tours/" + id + "/restore")).andExpect(redirectedUrl("/admin/tours?tab=trash&restored"));
		mvc.perform(get("/tour/{id}", id)).andExpect(status().isOk());

		mvc.perform(postAs("/admin/tours/" + id + "/delete")).andExpect(status().is3xxRedirection());
		mvc.perform(postAs("/admin/tours/" + id + "/purge")).andExpect(redirectedUrl("/admin/tours?tab=trash&purged"));
		assertThat(one("SELECT COUNT(*) FROM tour WHERE tour_id = " + id)).isZero();
		assertThat(one("SELECT COUNT(*) FROM tour_option WHERE tour_id = " + id)).isZero();
	}

	@Test
	void 등록과_수정_화면이_열린다() throws Exception {
		long hotel = one("SELECT MIN(hotel_id) FROM hotel");
		long flight = one("SELECT MIN(flight_id) FROM flight");
		long plan = one("SELECT MIN(plan_id) FROM monthly_plan");
		long tour = one("SELECT MIN(tour_id) FROM tour");
		for (String path : new String[] { "/admin/hotels/new", "/admin/hotels/" + hotel + "/edit", "/admin/flights/new", "/admin/flights/" + flight + "/edit",
			"/admin/plans/new", "/admin/plans/" + plan + "/edit", "/admin/tours/new", "/admin/tours/" + tour + "/edit" }) {
			mvc.perform(get(path).session(admin)).andExpect(status().isOk());
		}
	}
}
