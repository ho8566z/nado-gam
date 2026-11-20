package com.nadogam.tour;

import com.nadogam.common.Fmt;

// 투어 목록의 카드 한 장
public record TourCard(
		long tourId,
		String scope,
		String theme,
		String title,
		String subtitle,
		String collabBrand,
		String placeName,
		String placeEn,
		String colorFrom,
		String colorTo,
		int minPrice,
		int minNights,
		int maxNights) {

	public String themeLabel() {
		return TourTheme.labelOf(theme);
	}

	public String scopeLabel() {
		return "DOMESTIC".equals(scope) ? "국내" : "해외";
	}

	public String from() {
		return Fmt.color(colorFrom, "#f76707");
	}

	public String to() {
		return Fmt.color(colorTo, "#862e9c");
	}

	public String priceLabel() {
		return Fmt.won(minPrice) + "~";
	}

	public String periodLabel() {
		String a = minNights + "박 " + (minNights + 1) + "일";
		String b = maxNights + "박 " + (maxNights + 1) + "일";
		return minNights == maxNights ? a : a + " ~ " + b;
	}
}
