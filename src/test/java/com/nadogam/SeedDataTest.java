package com.nadogam;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;

// 설계서(nado_gam_word/design)의 더미데이터 규칙이 schema.sql / data.sql 에 그대로 들어갔는지 확인한다.
@SpringBootTest
class SeedDataTest {

	@Autowired
	JdbcTemplate jdbc;

	@Autowired
	PasswordEncoder passwordEncoder;

	private int count(String sql, Object... args) {
		Integer n = jdbc.queryForObject(sql, Integer.class, args);
		return n == null ? 0 : n;
	}

	@Test
	void 관리자와_사용자_계정은_테이블이_분리되고_비밀번호는_해시이다() {
		assertThat(count("SELECT COUNT(*) FROM admin_account")).isEqualTo(1);
		assertThat(count("SELECT COUNT(*) FROM member")).isEqualTo(1);

		String adminHash = jdbc.queryForObject("SELECT password_hash FROM admin_account WHERE login_id = 'admin'", String.class);
		String userHash = jdbc.queryForObject("SELECT password_hash FROM member WHERE login_id = 'user'", String.class);
		assertThat(adminHash).isNotEqualTo("1234");
		assertThat(passwordEncoder.matches("1234", adminHash)).isTrue();
		assertThat(passwordEncoder.matches("1234", userHash)).isTrue();

		assertThat(jdbc.queryForMap("SELECT name, phone, email, role FROM admin_account WHERE login_id = 'admin'"))
			.containsEntry("name", "admin").containsEntry("phone", "010-1234-5678")
			.containsEntry("email", "admin@gmail.com").containsEntry("role", "ROLE_ADMIN");
		assertThat(jdbc.queryForMap("SELECT name, phone, email, role FROM member WHERE login_id = 'user'"))
			.containsEntry("name", "user").containsEntry("phone", "010-1111-2222")
			.containsEntry("email", "user@naver.com").containsEntry("role", "ROLE_USER");
	}

	@Test
	void 여행지는_50곳이고_블라디보스토크만_운항_불가이다() {
		assertThat(count("SELECT COUNT(*) FROM destination")).isEqualTo(50);
		// 직접 지정한 27곳 + 도시 순위를 참고해 추가한 23곳
		List<String> names = jdbc.queryForList("SELECT name_ko FROM destination", String.class);
		assertThat(names).contains("파리", "런던", "베를린", "마드리드", "로마", "바르셀로나", "서울", "부산", "도쿄", "오사카", "후쿠오카", "삿포로",
			"베이징", "방콕", "블라디보스토크", "뉴욕", "워싱턴D.C.", "로스앤젤레스", "홍콩", "상하이", "두바이", "시카고", "시드니", "밴쿠버",
			"상파울루", "카이로", "케이프타운");
		assertThat(names).contains("밀라노", "암스테르담", "이스탄불", "프라하", "빈", "리스본", "에든버러", "싱가포르", "마카오", "타이베이", "다낭",
			"나트랑", "푸꾸옥", "발리", "하노이", "호치민", "쿠알라룸푸르", "샌프란시스코", "토론토", "호놀룰루", "멕시코시티", "멜버른", "괌");
		assertThat(jdbc.queryForList("SELECT DISTINCT name_ko FROM destination", String.class)).hasSize(50); // 중복 없음
		List<String> unavailable = jdbc.queryForList("SELECT name_ko FROM destination WHERE status = 'UNAVAILABLE'", String.class);
		assertThat(unavailable).containsExactly("블라디보스토크");
		assertThat(count("SELECT COUNT(*) FROM flight f JOIN destination d ON d.destination_id = f.destination_id WHERE d.name_ko = '블라디보스토크'"))
			.isZero();
	}

	@Test
	void 항공편은_154편이고_운항_가능_도시마다_2편_이상이다() {
		assertThat(count("SELECT COUNT(*) FROM flight")).isEqualTo(154);
		int fewFlights = count("""
			SELECT COUNT(*) FROM destination d
			WHERE d.status = 'AVAILABLE'
			  AND (SELECT COUNT(*) FROM flight f WHERE f.destination_id = d.destination_id) < 2
			""");
		assertThat(fewFlights).isZero();
	}

	@Test
	void 한국발_일본행_12개_조합이_모두_운항한다() {
		int combos = count("""
			SELECT COUNT(*) FROM (
			  SELECT DISTINCT f.origin_airport, f.destination_id
			  FROM flight f JOIN destination d ON d.destination_id = f.destination_id
			  WHERE f.origin_airport IN ('ICN', 'GMP', 'PUS') AND d.name_ko IN ('도쿄', '오사카', '후쿠오카', '삿포로')
			) t
			""");
		assertThat(combos).isEqualTo(12);
	}

	@Test
	void 여행지를_고르면_그_여행지의_출발지만_조회된다() {
		String sql = """
			SELECT DISTINCT f.origin_airport FROM flight f
			JOIN destination d ON d.destination_id = f.destination_id
			WHERE d.name_ko = ? AND f.status = 'ON_SALE' ORDER BY f.origin_airport
			""";
		assertThat(jdbc.queryForList(sql, String.class, "삿포로")).containsExactly("GMP", "ICN", "PUS");
		assertThat(jdbc.queryForList(sql, String.class, "파리")).containsExactly("ICN");
		assertThat(jdbc.queryForList(sql, String.class, "서울")).containsExactlyInAnyOrder("HND", "LAX", "BKK");
		assertThat(jdbc.queryForList(sql, String.class, "부산")).containsExactlyInAnyOrder("KIX", "FUK", "NRT");
	}

	@Test
	void 경유편은_구간이_2개이고_직항은_1개이며_대기_시간이_있다() {
		assertThat(count("SELECT COUNT(*) FROM flight f WHERE f.flight_type = 'DIRECT' AND (SELECT COUNT(*) FROM flight_segment s WHERE s.flight_id = f.flight_id) <> 1"))
			.isZero();
		assertThat(count("SELECT COUNT(*) FROM flight f WHERE f.flight_type = 'CONNECTING' AND (SELECT COUNT(*) FROM flight_segment s WHERE s.flight_id = f.flight_id) <> 2"))
			.isZero();
		assertThat(count("SELECT COUNT(*) FROM flight_segment WHERE seq = 1 AND layover_minutes IS NOT NULL AND layover_minutes < 60")).isZero();
		// 경유편 구간 시간 + 대기 = 총 소요 시간
		assertThat(count("""
			SELECT COUNT(*) FROM flight f
			WHERE f.flight_type = 'CONNECTING'
			  AND f.duration_minutes <> (SELECT SUM(s.duration_minutes) + MAX(COALESCE(s.layover_minutes, 0)) FROM flight_segment s WHERE s.flight_id = f.flight_id)
			""")).isZero();
	}

	@Test
	void 이달의_특별기획은_로마_삿포로_케이프타운_3곳이고_특가가_정가보다_낮다() {
		List<String> plans = jdbc.queryForList("""
			SELECT d.name_ko FROM monthly_plan p JOIN destination d ON d.destination_id = p.destination_id
			WHERE p.is_active = TRUE ORDER BY p.plan_id
			""", String.class);
		assertThat(plans).containsExactly("로마", "삿포로", "케이프타운");
		// 기획전마다 항공편이 3편씩이다
		assertThat(count("""
			SELECT COUNT(*) FROM monthly_plan p WHERE (SELECT COUNT(DISTINCT flight_id) FROM monthly_plan_flight m WHERE m.plan_id = p.plan_id) <> 3
			""")).isZero();
		assertThat(count("SELECT COUNT(*) FROM monthly_plan_flight WHERE sale_price >= original_price")).isZero();
		// 특가 정가는 flight_fare 의 실제 가격(base + tax)과 같아야 한다
		assertThat(count("""
			SELECT COUNT(*) FROM monthly_plan_flight m JOIN flight_fare f ON f.flight_id = m.flight_id AND f.cabin_class = m.cabin_class
			WHERE f.base_price + f.tax_fuel <> m.original_price
			""")).isZero();
	}

	@Test
	void 베스트셀러는_도쿄_5편_로스앤젤레스_3편_홍콩_3편이고_여행지_안에서_순위가_1부터_이어진다() {
		String sql = """
			SELECT s.rank_no FROM flight_sales_stat s
			JOIN flight f ON f.flight_id = s.flight_id JOIN destination d ON d.destination_id = f.destination_id
			WHERE d.name_ko = ? AND s.rank_no IS NOT NULL ORDER BY s.rank_no
			""";
		assertThat(jdbc.queryForList(sql, Integer.class, "도쿄")).containsExactly(1, 2, 3, 4, 5);
		assertThat(jdbc.queryForList(sql, Integer.class, "로스앤젤레스")).containsExactly(1, 2, 3);
		assertThat(jdbc.queryForList(sql, Integer.class, "홍콩")).containsExactly(1, 2, 3);
		// 순위가 높을수록 판매량이 많다 (여행지 안에서)
		assertThat(count("""
			SELECT COUNT(*) FROM flight_sales_stat a
			JOIN flight fa ON fa.flight_id = a.flight_id
			JOIN flight_sales_stat b ON b.rank_no = a.rank_no + 1
			JOIN flight fb ON fb.flight_id = b.flight_id AND fb.destination_id = fa.destination_id
			WHERE a.rank_no IS NOT NULL AND a.sales_count < b.sales_count
			""")).isZero();
	}

	@Test
	void 좌석등급_가격은_저비용은_일반석만이고_일등석은_두바이_상파울루_오아시스뿐이다() {
		assertThat(count("""
			SELECT COUNT(*) FROM flight_fare ff JOIN flight f ON f.flight_id = ff.flight_id JOIN airline a ON a.airline_code = f.airline_code
			WHERE a.carrier_type = 'LCC' AND ff.cabin_class <> 'ECONOMY'
			""")).isZero();
		assertThat(count("SELECT COUNT(*) FROM flight_fare WHERE cabin_class = 'FIRST'")).isEqualTo(2);
		assertThat(count("SELECT COUNT(*) FROM flight_fare WHERE seats_left > seats_total OR seats_left < 0")).isZero();
	}
}
