package com.nadogam;

import static org.assertj.core.api.Assertions.assertThat;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Set;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.nadogam.globe.GlobeRepository;
import com.nadogam.globe.GlobeRoute;
import com.nadogam.travel.BestCard;
import com.nadogam.travel.BestDetail;
import com.nadogam.travel.PlanCard;
import com.nadogam.travel.PlanDetail;
import com.nadogam.travel.TravelQueryRepository;

// 메인 화면(기획전 3개, 베스트셀러 3개, 지구본 경로)에 쓰는 조회가 요구사항대로 나오는지 확인한다.
@SpringBootTest
class DashboardQueryTest {

	@Autowired
	TravelQueryRepository travel;

	@Autowired
	GlobeRepository globe;

	private final LocalDateTime now = LocalDateTime.of(2026, 11, 19, 12, 0);

	@Test
	void 메인의_이달의_기획전은_로마_삿포로_케이프타운_순서로_3개이다() {
		List<PlanCard> plans = travel.activePlans(now);
		assertThat(plans).extracting(PlanCard::nameKo).containsExactly("로마", "삿포로", "케이프타운");
		assertThat(plans).extracting(PlanCard::badgeText).containsExactly("최대 33% OFF", "최대 25% OFF", "최대 26% OFF");
		assertThat(plans).extracting(PlanCard::maxDiscount).containsExactly(33, 25, 26);
		assertThat(plans).extracting(PlanCard::minSalePrice).containsExactly(490000, 159000, 920000);
		assertThat(plans).allSatisfy(p -> {
			assertThat(p.minOriginalPrice()).isGreaterThan(p.minSalePrice());
			assertThat(p.highlightList()).hasSize(3);
			assertThat(p.flightCount()).isEqualTo(3);
		});
	}

	@Test
	void 기획전_기간이_끝나면_메인에서_사라진다() {
		assertThat(travel.activePlans(LocalDateTime.of(2027, 1, 1, 0, 0))).isEmpty();
		assertThat(travel.activePlans(LocalDateTime.of(2026, 10, 31, 23, 59))).isEmpty();
	}

	@Test
	void 메인의_베스트셀러는_도쿄_로스앤젤레스_홍콩_순서로_3개이다() {
		List<BestCard> best = travel.bestsellers(3);
		assertThat(best).extracting(BestCard::nameKo).containsExactly("도쿄", "로스앤젤레스", "홍콩");
		assertThat(best).extracting(BestCard::flightCount).containsExactly(5, 3, 3);
		assertThat(best).extracting(BestCard::totalSales).containsExactly(4240L, 2450L, 2260L);
		assertThat(best).extracting(BestCard::minPrice).containsExactly(150000, 820000, 290000);
	}

	@Test
	void 특별기획_상세는_항공편마다_좌석등급별_특가를_가진다() {
		PlanDetail sapporo = travel.planDetail(2, now).orElseThrow();
		assertThat(sapporo.flights()).hasSize(3);
		assertThat(sapporo.flights().get(0).flight().flightNo()).isEqualTo("MG767");
		assertThat(sapporo.flights().get(0).cabins()).extracting(c -> c.cabinClass()).containsExactly("ECONOMY", "BUSINESS");
		// LCC 는 일반석만
		assertThat(sapporo.flights().get(1).cabins()).extracting(c -> c.cabinClass()).containsExactly("ECONOMY");

		PlanDetail capeTown = travel.planDetail(3, now).orElseThrow();
		assertThat(capeTown.flights().get(0).flight().direct()).isFalse();
		assertThat(capeTown.flights().get(0).flight().viaCity()).isEqualTo("두바이");
		assertThat(travel.planDetail(99, now)).isEmpty();
	}

	@Test
	void 베스트셀러_상세는_순위순이고_좌석등급별_가격이_있다() {
		BestDetail tokyo = travel.bestDetail(9).orElseThrow();
		assertThat(tokyo.flights()).extracting(f -> f.flight().rankNo()).containsExactly(1, 2, 3, 4, 5);
		assertThat(tokyo.flights().get(0).flight().flightNo()).isEqualTo("HR1101");
		assertThat(tokyo.flights().get(0).fares()).extracting(f -> f.cabinClass()).containsExactly("ECONOMY");
		assertThat(tokyo.flights().get(0).fares().get(0).price()).isEqualTo(150000);
		assertThat(travel.bestDetail(1)).isEmpty(); // 파리는 베스트셀러가 아니다
	}

	@Test
	void 지구본_경로는_인천_출발이고_운항_가능_도시만_포함하며_경유편은_중간_공항을_가진다() {
		List<GlobeRoute> routes = globe.routesFromIncheon(Set.of(5L, 12L, 27L));
		assertThat(routes).hasSize(47); // 운항 가능 49개 도시 중 인천에서 출발하지 않는 서울·부산 제외
		assertThat(routes).allSatisfy(r -> assertThat(r.points().get(0).code()).isEqualTo("ICN"));
		assertThat(routes).extracting(GlobeRoute::name).doesNotContain("블라디보스토크", "서울", "부산");
		assertThat(routes).filteredOn(GlobeRoute::featured).extracting(GlobeRoute::name).containsExactlyInAnyOrder("로마", "삿포로", "케이프타운");

		GlobeRoute berlin = routes.stream().filter(r -> r.name().equals("베를린")).findFirst().orElseThrow();
		assertThat(berlin.points()).extracting(GlobeRoute.GlobePoint::code).containsExactly("ICN", "HEL", "BER");
		GlobeRoute rome = routes.stream().filter(r -> r.name().equals("로마")).findFirst().orElseThrow();
		assertThat(rome.points()).extracting(GlobeRoute.GlobePoint::code).containsExactly("ICN", "FCO"); // 직항
	}
}
