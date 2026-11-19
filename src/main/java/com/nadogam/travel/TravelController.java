package com.nadogam.travel;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;

import com.nadogam.common.Fmt;

// 해외 여행: 여행지 선택 → 출발지 선택 → 직항/경유 선택과 항공편 목록 → 항공편 상세
@Controller
public class TravelController {

	private static final Set<String> TYPES = Set.of(TravelSearchRepository.TYPE_ALL, TravelSearchRepository.TYPE_DIRECT, TravelSearchRepository.TYPE_CONNECTING);
	private static final Set<String> SORTS = Set.of(TravelSearchRepository.SORT_PRICE, TravelSearchRepository.SORT_DURATION, TravelSearchRepository.SORT_DEPARTURE);

	private final TravelSearchRepository search;

	public TravelController(TravelSearchRepository search) {
		this.search = search;
	}

	// 1단계: 여행지 선택 (권역별 탭과 검색은 화면에서 거른다)
	@GetMapping("/travel")
	public String destinations(Model model) {
		List<DestinationItem> destinations = search.destinations();
		Map<String, Long> regions = new LinkedHashMap<>();
		for (String region : List.of("EUROPE", "ASIA", "NORTH_AMERICA", "SOUTH_AMERICA", "MIDDLE_EAST", "AFRICA", "OCEANIA")) {
			long count = destinations.stream().filter(d -> d.region().equals(region)).count();
			if (count > 0) {
				regions.put(region, count);
			}
		}
		model.addAttribute("destinations", destinations);
		model.addAttribute("regions", regions);
		model.addAttribute("regionLabels", regions.keySet().stream().collect(
			java.util.stream.Collectors.toMap(r -> r, Fmt::region, (a, b) -> a, LinkedHashMap::new)));
		model.addAttribute("availableCount", destinations.stream().filter(DestinationItem::available).count());
		model.addAttribute("active", "travel");
		return "travel/index";
	}

	// 2~3단계: 출발지 선택과 항공편 목록. 출발지가 하나뿐이면 자동으로 골라서 넘어간다.
	@GetMapping("/travel/{destinationId}")
	public String flights(@PathVariable long destinationId,
			@RequestParam(required = false) String origin,
			@RequestParam(defaultValue = "all") String type,
			@RequestParam(defaultValue = "price") String sort,
			Model model) {
		DestinationItem destination = search.destination(destinationId)
			.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "없는 여행지입니다."));
		model.addAttribute("destination", destination);
		model.addAttribute("active", "travel");

		if (!destination.available()) {
			return "travel/destination";
		}
		List<OriginOption> origins = search.origins(destinationId);
		model.addAttribute("origins", origins);

		OriginOption selected = origins.stream().filter(o -> o.airportCode().equals(origin)).findFirst()
			.orElse(origins.size() == 1 ? origins.get(0) : null);
		if (selected == null) {
			return "travel/destination"; // 출발지 선택 단계
		}
		String safeType = TYPES.contains(type) ? type : TravelSearchRepository.TYPE_ALL;
		String safeSort = SORTS.contains(sort) ? sort : TravelSearchRepository.SORT_PRICE;
		model.addAttribute("selected", selected);
		model.addAttribute("type", safeType);
		model.addAttribute("sort", safeSort);
		model.addAttribute("result", search.search(destinationId, selected.airportCode(), safeType, safeSort));
		return "travel/destination";
	}

	@GetMapping("/travel/flights/{flightId}")
	public String flight(@PathVariable long flightId, Model model) {
		FlightDetail detail = search.flightDetail(flightId)
			.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "없는 항공편입니다."));
		model.addAttribute("detail", detail);
		model.addAttribute("active", "travel");
		return "travel/flight";
	}
}
