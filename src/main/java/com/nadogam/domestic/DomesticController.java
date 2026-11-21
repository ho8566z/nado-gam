package com.nadogam.domestic;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;

import com.nadogam.stay.StayController;
import com.nadogam.stay.StayRepository;
import com.nadogam.tour.TourRepository;

// 국내여행: 도시 목록, 도시 상세(출발지별 기차·버스·항공 이동편과 그 도시의 투어 3테마)
@Controller
public class DomesticController {

	private final DomesticRepository domestic;
	private final TourRepository tours;
	private final StayRepository stays;

	public DomesticController(DomesticRepository domestic, TourRepository tours, StayRepository stays) {
		this.domestic = domestic;
		this.tours = tours;
		this.stays = stays;
	}

	@GetMapping("/domestic")
	public String list(Model model) {
		model.addAttribute("cities", domestic.cities());
		model.addAttribute("active", "domestic");
		return "domestic/list";
	}

	@GetMapping("/domestic/{id}")
	public String detail(@PathVariable long id, @RequestParam(required = false) String origin,
		@RequestParam(required = false) Integer nights, Model model) {
		DomesticCity city = domestic.city(id).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
		// 출발지는 서울(기본)·대전만 허용한다. 서울 여행지는 서울에서 출발하는 이동편이 없어 항상 대전 출발이다.
		boolean seoul = "서울".equals(city.name());
		String selected = seoul || "DAEJEON".equals(origin) ? "DAEJEON" : "SEOUL";
		model.addAttribute("city", city);
		model.addAttribute("origin", selected);
		model.addAttribute("seoulCity", seoul);
		model.addAttribute("transports", domestic.transports(id, selected));
		model.addAttribute("tours", tours.cardsOfCity(id));
		int stay = StayController.safeNights(nights, 2);
		model.addAttribute("nights", stay);
		model.addAttribute("hotels", stays.hotelsOfCity(id));
		model.addAttribute("active", "domestic");
		return "domestic/detail";
	}
}
