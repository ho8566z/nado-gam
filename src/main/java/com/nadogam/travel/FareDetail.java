package com.nadogam.travel;

import com.nadogam.common.Fmt;

// 항공편 상세의 좌석등급별 요금과 조건
public record FareDetail(
		String cabinClass,
		int basePrice,
		int taxFuel,
		int seatsLeft,
		int seatsTotal,
		boolean refundable,
		int changeFee,
		double mileageRate) {

	public String cabinLabel() {
		return Fmt.cabin(cabinClass);
	}

	public int total() {
		return basePrice + taxFuel;
	}

	public String totalLabel() {
		return Fmt.won(total());
	}

	public String baseLabel() {
		return Fmt.won(basePrice);
	}

	public String taxLabel() {
		return Fmt.won(taxFuel);
	}

	public boolean scarce() {
		return seatsLeft <= 10;
	}

	public String refundLabel() {
		return refundable ? "가능" : "불가";
	}

	public String changeFeeLabel() {
		return changeFee == 0 ? "무료" : Fmt.won(changeFee);
	}

	public String mileageLabel() {
		return mileageRate <= 0 ? "적립 없음" : String.format(java.util.Locale.US, "%.0f%%", mileageRate * 100);
	}
}
