package com.nadogam.tour;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;

// 투어: 목록(범위·테마·검색)과 상세(기간 옵션별 일정·포함/불포함)
@Controller
public class TourController {

	private final TourRepository tours;

	public TourController(TourRepository tours) {
		this.tours = tours;
	}

	@GetMapping("/tour")
	public String list(@RequestParam(required = false) String scope, @RequestParam(required = false) String theme,
		@RequestParam(required = false) String q, Model model) {
		String scopeFilter = "OVERSEAS".equals(scope) || "DOMESTIC".equals(scope) ? scope : null;
		String themeFilter = TourTheme.of(theme).map(Enum::name).orElse(null);
		String keyword = q == null ? null : q.trim();
		List<TourCard> cards = tours.cards(scopeFilter, themeFilter, keyword);
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
