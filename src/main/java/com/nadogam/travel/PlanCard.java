package com.nadogam.travel;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.Arrays;
import java.util.List;

import com.nadogam.common.Fmt;

// 이달의 특별기획 카드 한 장 (메인 캐로셀, 특별기획 목록, 상세 머리글에서 공통으로 쓴다)
public record PlanCard(
		long planId,
		long destinationId,
		String nameKo,
		String nameEn,
		String title,
		String subtitle,
		String badgeText,
		String highlights,
		String posterColorFrom,
		String posterColorTo,
		LocalDateTime endAt,
		int minSalePrice,
		int minOriginalPrice,
		int maxDiscount,
		int flightCount) {

	public String from() {
		return Fmt.color(posterColorFrom, "#2f6fed");
	}

	public String to() {
		return Fmt.color(posterColorTo, "#7c3aed");
	}

	public List<String> highlightList() {
		if (highlights == null) {
			return List.of();
		}
		return Arrays.stream(highlights.split("\\R")).map(String::trim).filter(s -> !s.isEmpty()).toList();
	}

	public String nameEnUpper() {
		return nameEn.toUpperCase();
	}

	public String minSaleLabel() {
		return Fmt.won(minSalePrice);
	}

	public String minOriginalLabel() {
		return Fmt.won(minOriginalPrice);
	}

	public String dDayLabel() {
		long days = ChronoUnit.DAYS.between(LocalDate.now(), endAt.toLocalDate());
		if (days < 0) {
			return "종료";
		}
		return days == 0 ? "오늘 마감" : "마감 D-" + days;
	}
}
