package com.nadogam.domestic;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;

import com.nadogam.tour.TourRepository;

// 국내여행: 도시 목록, 도시 상세(출발지별 기차·버스·항공 이동편과 그 도시의 투어 3테마)
@Controller
public class DomesticController {

	private final DomesticRepository domestic;
	private final TourRepository tours;

	public DomesticController(DomesticRepository domestic, TourRepository tours) {
		this.domestic = domestic;
		this.tours = tours;
	}

	@GetMapping("/domestic")
	public String list(Model model) {
		model.addAttribute("cities", domestic.cities());
		model.addAttribute("active", "domestic");
		return "domestic/list";
	}

	@GetMapping("/domestic/{id}")
	public String detail(@PathVariable long id, @RequestParam(required = false) String origin, Model model) {
		DomesticCity city = domestic.city(id).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
		// 출발지는 서울(기본)·대전만 허용한다.
		String selected = "DAEJEON".equals(origin) ? "DAEJEON" : "SEOUL";
		model.addAttribute("city", city);
		model.addAttribute("origin", selected);
		model.addAttribute("transports", domestic.transports(id, selected));
		model.addAttribute("tours", tours.cardsOfCity(id));
		model.addAttribute("active", "domestic");
		return "domestic/detail";
	}
}
