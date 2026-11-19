package com.nadogam.bestseller;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.server.ResponseStatusException;

import com.nadogam.travel.TravelQueryRepository;

@Controller
public class BestsellerController {

	private final TravelQueryRepository travel;

	public BestsellerController(TravelQueryRepository travel) {
		this.travel = travel;
	}

	@GetMapping("/bestseller")
	public String list(Model model) {
		model.addAttribute("bestsellers", travel.bestsellers(3));
		return "bestseller/list";
	}

	@GetMapping("/bestseller/{destinationId}")
	public String detail(@PathVariable long destinationId, Model model) {
		var detail = travel.bestDetail(destinationId)
			.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "베스트셀러 여행지가 아닙니다."));
		model.addAttribute("detail", detail);
		return "bestseller/detail";
	}
}
