package com.nadogam.special;

import java.time.LocalDateTime;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.server.ResponseStatusException;

import com.nadogam.travel.TravelQueryRepository;

@Controller
public class SpecialController {

	private final TravelQueryRepository travel;

	public SpecialController(TravelQueryRepository travel) {
		this.travel = travel;
	}

	@GetMapping("/special")
	public String list(Model model) {
		model.addAttribute("plans", travel.activePlans(LocalDateTime.now()));
		return "special/list";
	}

	@GetMapping("/special/{planId}")
	public String detail(@PathVariable long planId, Model model) {
		var detail = travel.planDetail(planId, LocalDateTime.now())
			.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "진행 중인 기획전이 아닙니다."));
		model.addAttribute("detail", detail);
		return "special/detail";
	}
}
