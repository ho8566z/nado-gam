package com.nadogam.home;

import java.time.LocalDateTime;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.nadogam.popup.PopupEventRepository;
import com.nadogam.travel.TravelQueryRepository;

@Controller
public class HomeController {

	private final TravelQueryRepository travel;
	private final PopupEventRepository popups;

	public HomeController(TravelQueryRepository travel, PopupEventRepository popups) {
		this.travel = travel;
		this.popups = popups;
	}

	// 메인(대시보드): 이달의 기획전 3개와 베스트셀러 3개를 카드로 보여주고, 노출 중인 이벤트 팝업이 있으면 함께 띄운다.
	@GetMapping("/")
	public String home(Model model) {
		LocalDateTime now = LocalDateTime.now();
		model.addAttribute("plans", travel.activePlans(now));
		model.addAttribute("bestsellers", travel.bestsellers(3));
		model.addAttribute("popup", popups.findShowing(now).orElse(null));
		return "index";
	}

}
