package com.nadogam.tour;

import java.util.Arrays;
import java.util.Optional;

// 투어 테마 3가지. DB 에는 name() 을 저장하고 화면에는 label 을 보여 준다.
public enum TourTheme {
	FOOD_DRINK("음식과 주류 투어", "음식·주류"),
	SPORTS_ACTIVITY("스포츠와 액티비티 투어", "스포츠·액티비티"),
	ART_REST("예술과 휴식 투어", "예술·휴식");

	private final String label;
	private final String shortLabel;

	TourTheme(String label, String shortLabel) {
		this.label = label;
		this.shortLabel = shortLabel;
	}

	public String getLabel() {
		return label;
	}

	public String getShortLabel() {
		return shortLabel;
	}

	public static Optional<TourTheme> of(String name) {
		return Arrays.stream(values()).filter(t -> t.name().equals(name)).findFirst();
	}

	public static String labelOf(String name) {
		return of(name).map(TourTheme::getLabel).orElse(name);
	}
}
