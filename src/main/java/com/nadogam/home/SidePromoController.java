package com.nadogam.home;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.nadogam.common.DestPhotos;
import com.nadogam.travel.TravelQueryRepository;

// 화면 옆에 따라다니는 사이드바용 데이터: 이달의 기획전과 베스트셀러 요약(로그인 없이 조회)
@RestController
public class SidePromoController {

	public record Item(String kind, String href, String name, String title, String price, String badge, String from, String to,
			String photo) {
	}

	private final TravelQueryRepository travel;
	private final DestPhotos photos;

	public SidePromoController(TravelQueryRepository travel, DestPhotos photos) {
		this.travel = travel;
		this.photos = photos;
	}

	@GetMapping("/api/side-promos")
	public List<Item> promos() {
		List<Item> items = new ArrayList<>();
		travel.activePlans(LocalDateTime.now()).stream().limit(3).forEach(p -> items.add(new Item("plan",
				"/special/" + p.planId(), p.nameKo(), p.title(), p.minSaleLabel() + "~", p.dDayLabel(), p.from(), p.to(),
				photos.style("overseas", p.destinationId()))));
		travel.bestsellers(3).forEach(b -> items.add(new Item("best", "/bestseller/" + b.destinationId(), b.nameKo(),
				b.summary(), b.minPriceLabel() + "~", "누적 " + b.totalSalesLabel() + "건", b.from(), b.to(),
				photos.style("overseas", b.destinationId()))));
		return items;
	}
}
