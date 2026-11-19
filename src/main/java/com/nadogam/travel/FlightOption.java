package com.nadogam.travel;

import java.util.List;

import com.nadogam.common.Fmt;

// 항공편 목록의 한 줄: 항공편 정보와 좌석등급별 가격
public record FlightOption(FlightInfo flight, List<FarePrice> fares) {

	public int lowestPrice() {
		return fares.stream().mapToInt(FarePrice::price).min().orElse(0);
	}

	public String lowestLabel() {
		return Fmt.won(lowestPrice());
	}
}
