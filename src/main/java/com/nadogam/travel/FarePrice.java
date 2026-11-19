package com.nadogam.travel;

import com.nadogam.common.Fmt;

// 항공편의 좌석등급별 가격 (표시 가격 = 운임 + 세금·유류할증료, 편도 성인 1인)
public record FarePrice(long flightId, String cabinClass, int price) {

	public String cabinLabel() {
		return Fmt.cabin(cabinClass);
	}

	public String priceLabel() {
		return Fmt.won(price);
	}
}
