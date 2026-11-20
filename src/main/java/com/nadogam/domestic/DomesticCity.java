package com.nadogam.domestic;

import com.nadogam.common.Fmt;

// 국내 여행지 한 곳(목록 카드·상세 머리말)
public record DomesticCity(
		long cityId,
		String name,
		String province,
		String summary,
		String colorFrom,
		String colorTo,
		int tourCount,
		int minFare) {

	public String from() {
		return Fmt.color(colorFrom, "#f76707");
	}

	public String to() {
		return Fmt.color(colorTo, "#862e9c");
	}

	public String fareLabel() {
		return Fmt.won(minFare) + "~";
	}
}
