package com.nadogam.stay;

import com.nadogam.common.Fmt;

// 호텔 한 곳. 1박 가격과 묵는 박수를 곱한 전체 가격을 함께 보여 준다.
public record HotelItem(
		long hotelId,
		String name,
		int grade,
		String area,
		String summary,
		String amenities,
		int pricePerNight) {

	public String gradeLabel() {
		return "★".repeat(grade);
	}

	public String perNightLabel() {
		return Fmt.won(pricePerNight);
	}

	public String totalLabel(int nights) {
		return Fmt.won((long) pricePerNight * nights);
	}
}
