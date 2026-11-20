package com.nadogam.tour;

import com.nadogam.common.Fmt;

// 투어의 기간 옵션(예: 3박 4일 / 1인 1,280,000원)
public record TourOptionView(long optionId, int nights, int days, int pricePerPerson, int minPeople, int maxPeople) {

	public String periodLabel() {
		return nights + "박 " + days + "일";
	}

	public String priceLabel() {
		return Fmt.won(pricePerPerson);
	}
}
