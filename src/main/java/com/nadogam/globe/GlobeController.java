package com.nadogam.globe;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.nadogam.travel.BestCard;
import com.nadogam.travel.PlanCard;
import com.nadogam.travel.TravelQueryRepository;

@RestController
public class GlobeController {

	private final GlobeRepository globeRepository;
	private final TravelQueryRepository travel;

	public GlobeController(GlobeRepository globeRepository, TravelQueryRepository travel) {
		this.globeRepository = globeRepository;
		this.travel = travel;
	}

	// 메인 지구본용 경로. 기획전·베스트셀러 여행지는 featured 로 표시해 더 밝게 그린다.
	@GetMapping("/api/globe/routes")
	public List<GlobeRoute> routes() {
		Set<Long> featured = new HashSet<>();
		travel.activePlans(LocalDateTime.now()).stream().map(PlanCard::destinationId).forEach(featured::add);
		travel.bestsellers(3).stream().map(BestCard::destinationId).forEach(featured::add);
		return globeRepository.routesFromIncheon(featured);
	}

	// 해외 여행 화면: 여행지(와 출발지)의 모든 항공편 경로
	@GetMapping("/api/travel/routes")
	public List<FlightRoute> destinationRoutes(@RequestParam long destinationId, @RequestParam(required = false) String origin) {
		return globeRepository.routesOfDestination(destinationId, origin == null || origin.isBlank() ? null : origin);
	}

	// 항공편 상세 화면: 한 편의 경로(목록 1개)
	@GetMapping("/api/travel/flights/{flightId}/route")
	public List<FlightRoute> flightRoute(@PathVariable long flightId) {
		return globeRepository.routeOfFlight(flightId);
	}
}
