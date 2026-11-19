package com.nadogam;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.nadogam.globe.FlightRoute;
import com.nadogam.globe.GlobeRepository;
import com.nadogam.travel.DestinationItem;
import com.nadogam.travel.FlightDetail;
import com.nadogam.travel.FlightOption;
import com.nadogam.travel.FlightSearch;
import com.nadogam.travel.OriginOption;
import com.nadogam.travel.TravelSearchRepository;

// 해외 여행 화면: 여행지 선택 → 출발지 선택 → 직항·경유 선택 → 항공편 상세
@SpringBootTest
class TravelSearchTest {

	@Autowired
	TravelSearchRepository search;

	@Autowired
	GlobeRepository globe;

	// destination_id 는 data.sql 입력 순서: 1 파리, 7 서울, 8 부산, 9 도쿄, 12 삿포로, 15 블라디보스토크
	private static final long PARIS = 1, SEOUL = 7, BUSAN = 8, TOKYO = 9, SAPPORO = 12, VLADIVOSTOK = 15;

	private List<String> origins(long destinationId) {
		return search.origins(destinationId).stream().map(OriginOption::airportCode).toList();
	}

	private List<String> flightNos(FlightSearch result) {
		return result.flights().stream().map(f -> f.flight().flightNo()).toList();
	}

	@Test
	void 여행지는_50곳이고_블라디보스토크만_운항_불가이며_항공편이_없다() {
		List<DestinationItem> all = search.destinations();
		assertThat(all).hasSize(50);
		assertThat(all.stream().filter(d -> !d.available())).extracting(DestinationItem::nameKo).containsExactly("블라디보스토크");

		DestinationItem vvo = search.destination(VLADIVOSTOK).orElseThrow();
		assertThat(vvo.available()).isFalse();
		assertThat(vvo.unavailableReason()).contains("운항 중단");
		assertThat(vvo.flightCount()).isZero();
		assertThat(vvo.minPrice()).isNull();

		DestinationItem tokyo = search.destination(TOKYO).orElseThrow();
		assertThat(tokyo.flightCount()).isEqualTo(6);
		assertThat(tokyo.minPrice()).isEqualTo(150000);
		assertThat(search.destination(999)).isEmpty();
	}

	@Test
	void 여행지마다_색이_있고_권역_이름이_한글이다() {
		assertThat(search.destinations()).allSatisfy(d -> {
			assertThat(d.from()).matches("#[0-9a-fA-F]{6}");
			assertThat(d.to()).matches("#[0-9a-fA-F]{6}");
			assertThat(d.regionLabel()).isNotEqualTo(d.region());
		});
	}

	@Test
	void 여행지를_고르면_그_여행지로_가는_출발지만_나온다() {
		assertThat(origins(TOKYO)).containsExactlyInAnyOrder("ICN", "GMP", "PUS"); // 한국발 일본행은 3개 공항 모두
		assertThat(origins(SAPPORO)).containsExactlyInAnyOrder("ICN", "GMP", "PUS");
		assertThat(origins(PARIS)).containsExactly("ICN");                          // 유럽은 인천만 → 화면에서 자동 선택
		assertThat(origins(SEOUL)).containsExactlyInAnyOrder("HND", "LAX", "BKK");  // 서울행은 해외 도시가 출발지
		assertThat(origins(BUSAN)).containsExactlyInAnyOrder("KIX", "FUK", "NRT");
		assertThat(origins(VLADIVOSTOK)).isEmpty();
	}

	@Test
	void 출발지_목록에는_항공편_수와_최저가가_있다() {
		OriginOption icn = search.origins(TOKYO).stream().filter(o -> o.airportCode().equals("ICN")).findFirst().orElseThrow();
		assertThat(icn.cityName()).isEqualTo("인천");
		assertThat(icn.flightCount()).isEqualTo(4);
		assertThat(icn.minPrice()).isEqualTo(150000);
		assertThat(search.origins(TOKYO).get(0).airportCode()).isEqualTo("ICN"); // 항공편이 많은 출발지가 먼저
	}

	@Test
	void 직항_경유_필터와_개수가_맞다() {
		FlightSearch all = search.search(TOKYO, "ICN", "all", "price");
		assertThat(all.allCount()).isEqualTo(4);
		assertThat(all.directCount()).isEqualTo(3);
		assertThat(all.connectingCount()).isEqualTo(1);

		FlightSearch direct = search.search(TOKYO, "ICN", "direct", "price");
		assertThat(direct.flights()).hasSize(3).allSatisfy(f -> assertThat(f.flight().direct()).isTrue());

		FlightSearch connecting = search.search(TOKYO, "ICN", "connecting", "price");
		assertThat(flightNos(connecting)).containsExactly("EB163");
		assertThat(connecting.flights().get(0).flight().viaCity()).isEqualTo("타이베이");
		assertThat(connecting.directCount()).isEqualTo(3); // 필터를 바꿔도 칩의 개수는 그대로
	}

	@Test
	void 정렬은_가격_소요시간_출발시각_순이다() {
		assertThat(flightNos(search.search(TOKYO, "ICN", "all", "price"))).containsExactly("HR1101", "EB163", "AQ1081", "MG2701");
		assertThat(flightNos(search.search(TOKYO, "ICN", "all", "duration"))).containsExactly("AQ1081", "HR1101", "MG2701", "EB163");
		assertThat(flightNos(search.search(TOKYO, "ICN", "all", "departure"))).containsExactly("HR1101", "AQ1081", "EB163", "MG2701");
		// 알 수 없는 값은 가격 순으로 처리하는 것이 아니라 컨트롤러가 걸러낸다(여기서는 기본 분기)
		assertThat(flightNos(search.search(TOKYO, "ICN", "all", "unknown"))).containsExactly("HR1101", "EB163", "AQ1081", "MG2701");
	}

	@Test
	void 다른_출발지의_항공편은_섞이지_않는다() {
		assertThat(flightNos(search.search(TOKYO, "GMP", "all", "price"))).containsExactly("SK094");
		assertThat(flightNos(search.search(TOKYO, "PUS", "all", "price"))).containsExactly("BD164");
		assertThat(search.search(TOKYO, "GMP", "connecting", "price").flights()).isEmpty();
		assertThat(search.search(PARIS, "PUS", "all", "price").flights()).isEmpty();
	}

	@Test
	void 항공편_목록에는_좌석등급별_가격이_있고_최저가가_일반석이다() {
		FlightOption ke = search.search(TOKYO, "ICN", "all", "price").flights().stream()
			.filter(f -> f.flight().flightNo().equals("MG2701")).findFirst().orElseThrow();
		assertThat(ke.fares()).extracting(f -> f.cabinClass()).containsExactly("ECONOMY", "BUSINESS");
		assertThat(ke.lowestPrice()).isEqualTo(250000);
		assertThat(ke.lowestLabel()).isEqualTo("₩250,000");
	}

	@Test
	void 항공편_상세는_구간과_요금_조건을_가진다() {
		long brId = search.search(TOKYO, "ICN", "connecting", "price").flights().get(0).flight().flightId();
		FlightDetail br = search.flightDetail(brId).orElseThrow();
		assertThat(br.segments()).hasSize(2);
		assertThat(br.segments().get(0).hasLayover()).isTrue();
		assertThat(br.segments().get(0).toCity()).isEqualTo("타이베이");
		assertThat(br.segments().get(1).hasLayover()).isFalse();
		assertThat(br.segments().stream().mapToInt(s -> s.durationMinutes() + (s.layoverMinutes() == null ? 0 : s.layoverMinutes())).sum())
			.isEqualTo(br.flight().durationMinutes());
		assertThat(br.operatingLabel()).isEqualTo("매일 운항");
		assertThat(br.fares()).extracting(f -> f.cabinClass()).containsExactly("ECONOMY", "BUSINESS");
		assertThat(br.fares().get(0).total()).isEqualTo(190000);
		assertThat(br.fares()).allSatisfy(f -> assertThat(f.seatsLeft()).isBetween(1, f.seatsTotal()));

		long lccId = search.search(TOKYO, "ICN", "direct", "price").flights().get(0).flight().flightId();
		FlightDetail lcc = search.flightDetail(lccId).orElseThrow();
		assertThat(lcc.flight().flightNo()).isEqualTo("HR1101");
		assertThat(lcc.segments()).hasSize(1);
		assertThat(lcc.mealIncluded()).isFalse();
		assertThat(lcc.baggageKg()).isEqualTo(15);
		assertThat(lcc.fares()).hasSize(1);
		assertThat(lcc.fares().get(0).refundable()).isFalse();

		assertThat(search.flightDetail(99999)).isEmpty();
	}

	@Test
	void 지구본_경로는_여행지와_출발지_또는_항공편_기준으로_나온다() {
		List<FlightRoute> icnToTokyo = globe.routesOfDestination(TOKYO, "ICN");
		assertThat(icnToTokyo).hasSize(4);
		assertThat(icnToTokyo).allSatisfy(r -> assertThat(r.points().get(0).code()).isEqualTo("ICN"));
		assertThat(icnToTokyo.stream().filter(r -> r.points().size() == 3)).hasSize(1); // 경유 1편은 점 3개

		assertThat(globe.routesOfDestination(TOKYO, null)).hasSize(6); // 출발지를 정하지 않으면 모든 출발지
		assertThat(globe.routesOfDestination(VLADIVOSTOK, null)).isEmpty();

		List<FlightRoute> one = globe.routeOfFlight(icnToTokyo.get(0).flightId());
		assertThat(one).hasSize(1);
		assertThat(one.get(0).points().get(one.get(0).points().size() - 1).city()).isEqualTo("도쿄");
	}
}
