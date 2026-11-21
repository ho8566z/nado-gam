package com.nadogam.common;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

// 여행지 사진의 출처·저작자·라이선스 목록(Wikimedia Commons 사진은 CC 라이선스라 출처 표기가 필요하다)
@Controller
public class PhotoCreditsController {

	private final DestPhotos photos;
	private final TourPhotos tourPhotos;

	public PhotoCreditsController(DestPhotos photos, TourPhotos tourPhotos) {
		this.photos = photos;
		this.tourPhotos = tourPhotos;
	}

	@GetMapping("/photo-credits")
	public String credits(Model model) {
		model.addAttribute("credits", photos.credits());
		model.addAttribute("tourCredits", tourPhotos.credits());
		return "photo-credits";
	}
}
