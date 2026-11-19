package com.nadogam.travel;

import com.nadogam.common.Fmt;

// 특별기획 항공편의 좌석등급별 정가와 특가
public record CabinPrice(String cabinClass, int originalPrice, int salePrice, int limitedSeats) {

	public String cabinLabel() {
		return Fmt.cabin(cabinClass);
	}

	public int discountRate() {
		return Math.round((originalPrice - salePrice) * 100f / originalPrice);
	}

	public String originalLabel() {
		return Fmt.won(originalPrice);
	}

	public String saleLabel() {
		return Fmt.won(salePrice);
	}
}
