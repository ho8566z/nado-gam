package com.nadogam.tour;

import java.util.Arrays;
import java.util.List;

import com.nadogam.common.Fmt;

// 투어 상세(상품 정보). 기간 옵션과 일정은 따로 조회한다.
public record TourDetail(
		long tourId,
		String scope,
		String theme,
		String title,
		String subtitle,
		String collabBrand,
		String highlights,
		String includes,
		String excludes,
		String sourceNote,
		String status,
		String placeName,
		String placeEn,
		String colorFrom,
		String colorTo) {

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

	public List<String> highlightList() {
		return lines(highlights);
	}

	public List<String> includeList() {
		return lines(includes);
	}

	public List<String> excludeList() {
		return lines(excludes);
	}

	// 줄바꿈으로 구분해 저장한 문장을 목록으로 바꾼다.
	private static List<String> lines(String text) {
		return text == null ? List.of() : Arrays.stream(text.split("\\R")).map(String::trim).filter(s -> !s.isEmpty()).toList();
	}
}
