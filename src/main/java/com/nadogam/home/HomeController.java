package com.nadogam.home;

import java.time.LocalDateTime;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.nadogam.travel.TravelQueryRepository;

@Controller
public class HomeController {

	private final TravelQueryRepository travel;

	public HomeController(TravelQueryRepository travel) {
		this.travel = travel;
	}

	// 메인(대시보드): 이달의 기획전 3개와 베스트셀러 3개를 카드로 보여준다.
	@GetMapping("/")
	public String home(Model model) {
		model.addAttribute("plans", travel.activePlans(LocalDateTime.now()));
		model.addAttribute("bestsellers", travel.bestsellers(3));
		return "index";
	}

}
