package com.nadogam.globe;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.web.bind.annotation.GetMapping;
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
}
