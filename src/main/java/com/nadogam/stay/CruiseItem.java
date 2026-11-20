package com.nadogam.stay;

import com.nadogam.common.Fmt;

// 크루즈 한 상품(항구 도시 7곳). 객실 종류별 1인 가격.
public record CruiseItem(
		long cruiseId,
		long destinationId,
		String title,
		String shipName,
		String departurePort,
		String itinerary,
		int nights,
		int priceInside,
		int priceBalcony,
		String highlights) {

	public String periodLabel() {
		return nights + "박 " + (nights + 1) + "일";
	}

	public String insideLabel() {
		return Fmt.won(priceInside);
	}

	public String balconyLabel() {
		return Fmt.won(priceBalcony);
	}
}
