package com.nadogam.stay;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;

import com.nadogam.travel.DestinationItem;
import com.nadogam.travel.TravelSearchRepository;

// 해외 여행지의 호텔(1박·전체 가격)과 크루즈. 항공편 화면(/travel/{id})과 같은 여행지 머리말을 쓴다.
@Controller
public class StayController {

	public static final int DEFAULT_NIGHTS = 3;
	public static final int MAX_NIGHTS = 14;

	private final TravelSearchRepository search;
	private final StayRepository stays;

	public StayController(TravelSearchRepository search, StayRepository stays) {
		this.search = search;
		this.stays = stays;
	}

	// 박수는 1~14 로 맞춘다(범위 밖이거나 없으면 기본값).
	public static int safeNights(Integer nights, int fallback) {
		return nights == null || nights < 1 || nights > MAX_NIGHTS ? fallback : nights;
	}

	private void destination(long id, Model model) {
		DestinationItem destination = search.destination(id)
			.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "없는 여행지입니다."));
		model.addAttribute("destination", destination);
		model.addAttribute("hasCruise", stays.cruiseOfDestination(id).isPresent());
		model.addAttribute("active", "travel");
	}

	@GetMapping("/travel/{destinationId}/hotels")
	public String hotels(@PathVariable long destinationId, @RequestParam(required = false) Integer nights, Model model) {
		destination(destinationId, model);
		model.addAttribute("nights", safeNights(nights, DEFAULT_NIGHTS));
		model.addAttribute("hotels", stays.hotelsOfDestination(destinationId));
		return "travel/hotels";
	}

	@GetMapping("/travel/{destinationId}/cruise")
	public String cruise(@PathVariable long destinationId, Model model) {
		destination(destinationId, model);
		model.addAttribute("cruise", stays.cruiseOfDestination(destinationId).orElse(null));
		return "travel/cruise";
	}
}
