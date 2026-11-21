package com.nadogam.tour;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;

import com.nadogam.common.Fmt;

// 투어: 목록(범위·테마·대륙·국가·검색)과 상세(기간 옵션별 일정·포함/불포함)
@Controller
public class TourController {

	private final TourRepository tours;

	public TourController(TourRepository tours) {
		this.tours = tours;
	}

	@GetMapping("/tour")
	public String list(@RequestParam(required = false) String scope, @RequestParam(required = false) String theme,
		@RequestParam(required = false) String q, @RequestParam(required = false) String region,
		@RequestParam(required = false) String country, Model model) {
		String scopeFilter = "OVERSEAS".equals(scope) || "DOMESTIC".equals(scope) ? scope : null;
		String themeFilter = TourTheme.of(theme).map(Enum::name).orElse(null);
		String keyword = q == null ? null : q.trim();
		// 대륙·국가 칩: 범위·테마·검색어를 적용한 투어 수. 주소의 값이 칩에 없으면(잘못된 값) 거르지 않는다.
		List<TourRepository.Facet> facets = tours.facets(scopeFilter, themeFilter, keyword);
		Map<String, Long> regions = new LinkedHashMap<>();
		for (String r : List.of("EUROPE", "ASIA", "NORTH_AMERICA", "SOUTH_AMERICA", "MIDDLE_EAST", "AFRICA", "OCEANIA")) {
			long n = facets.stream().filter(f -> f.region().equals(r)).mapToLong(TourRepository.Facet::count).sum();
			if (n > 0) {
				regions.put(r, n);
			}
		}
		String regionFilter = region != null && regions.containsKey(region) ? region : null;
		List<TourRepository.Facet> countries = regionFilter == null ? List.of()
			: facets.stream().filter(f -> f.region().equals(regionFilter)).toList();
		String countryFilter = country != null && countries.stream().anyMatch(f -> f.countryCode().equals(country)) ? country : null;
		List<TourCard> cards = tours.cards(scopeFilter, themeFilter, keyword, regionFilter, countryFilter);
		model.addAttribute("regions", regions);
		model.addAttribute("regionLabels", regions.keySet().stream().collect(
			java.util.stream.Collectors.toMap(r -> r, Fmt::region, (a, b) -> a, LinkedHashMap::new)));
		model.addAttribute("regionTotal", regions.values().stream().mapToLong(Long::longValue).sum());
		model.addAttribute("countries", countries);
		model.addAttribute("region", regionFilter);
		model.addAttribute("country", countryFilter);
		model.addAttribute("tours", cards);
		model.addAttribute("themes", TourTheme.values());
		model.addAttribute("scope", scopeFilter);
		model.addAttribute("theme", themeFilter);
		model.addAttribute("q", keyword == null ? "" : keyword);
		model.addAttribute("total", tours.cards(null, null, null).size());
		model.addAttribute("active", "tour");
		return "tour/list";
	}

	@GetMapping("/tour/{id}")
	public String detail(@PathVariable long id, @RequestParam(required = false) Long option, Model model) {
		TourDetail tour = tours.detail(id).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
		List<TourOptionView> options = tours.options(id);
		if (options.isEmpty()) {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND);
		}
		tours.countView(id);
		// 주소의 option 이 이 투어의 옵션이 아니면 첫 번째 옵션을 보여 준다.
		TourOptionView selected = options.stream().filter(o -> option != null && o.optionId() == option).findFirst().orElse(options.get(0));
		model.addAttribute("tour", tour);
		model.addAttribute("options", options);
		model.addAttribute("selected", selected);
		model.addAttribute("days", tours.days(selected.optionId()));
		model.addAttribute("active", "tour");
		return "tour/detail";
	}
}
