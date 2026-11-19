package com.nadogam.travel;

import com.nadogam.common.Fmt;

// 여행지를 고른 뒤 보여줄 출발지 선택지 (그 여행지로 가는 항공편이 있는 출발지만)
public record OriginOption(String airportCode, String cityName, String airportName, int flightCount, int minPrice) {

	public String minPriceLabel() {
		return Fmt.won(minPrice);
	}
}
