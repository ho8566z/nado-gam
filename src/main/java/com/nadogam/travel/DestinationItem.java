package com.nadogam.travel;

import com.nadogam.common.Fmt;

// 해외 여행 첫 화면(여행지 선택)의 카드 한 장
public record DestinationItem(
		long destinationId,
		String nameKo,
		String nameEn,
		String countryName,
		String region,
		String status,
		String unavailableReason,
		String summary,
		String posterColorFrom,
		String posterColorTo,
		int flightCount,
		Integer minPrice,
		long viewCount,
		long salesCount,
		int agencyPick) {

	public boolean available() {
		return "AVAILABLE".equals(status);
	}

	public String regionLabel() {
		return Fmt.region(region);
	}

	// 포스터 색이 비어 있으면 권역별 기본 색을 쓴다.
	public String from() {
		return Fmt.color(posterColorFrom, switch (region) {
			case "EUROPE" -> "#4c6ef5";
			case "ASIA" -> "#f76707";
			case "NORTH_AMERICA" -> "#1c7ed6";
			case "SOUTH_AMERICA" -> "#2f9e44";
			case "MIDDLE_EAST" -> "#c2255c";
			case "AFRICA" -> "#e67700";
			default -> "#0ca678";
		});
	}

	public String to() {
		return Fmt.color(posterColorTo, switch (region) {
			case "EUROPE" -> "#9775fa";
			case "ASIA" -> "#f783ac";
			case "NORTH_AMERICA" -> "#22b8cf";
			case "SOUTH_AMERICA" -> "#fcc419";
			case "MIDDLE_EAST" -> "#f59f00";
			case "AFRICA" -> "#74b816";
			default -> "#4dabf7";
		});
	}

	public String viewCountLabel() {
		return Fmt.count(viewCount);
	}

	public String salesCountLabel() {
		return Fmt.count(salesCount);
	}

	public boolean picked() {
		return agencyPick > 0;
	}

	public String minPriceLabel() {
		return minPrice == null ? "-" : Fmt.won(minPrice);
	}
}
