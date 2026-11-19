package com.nadogam.travel;

import com.nadogam.common.Fmt;

// 베스트셀러 여행지 카드 한 장. 판매량은 그 여행지의 순위가 매겨진 항공편 판매 수의 합이다.
public record BestCard(
		long destinationId,
		String nameKo,
		String nameEn,
		String summary,
		String posterColorFrom,
		String posterColorTo,
		long totalSales,
		int flightCount,
		int minPrice) {

	public String from() {
		return Fmt.color(posterColorFrom, "#2f6fed");
	}

	public String to() {
		return Fmt.color(posterColorTo, "#7c3aed");
	}

	public String nameEnUpper() {
		return nameEn.toUpperCase();
	}

	public String totalSalesLabel() {
		return Fmt.count(totalSales);
	}

	public String minPriceLabel() {
		return Fmt.won(minPrice);
	}
}
