package com.nadogam.travel;

import java.util.List;

// 항공편 상세 화면 한 장에 필요한 모든 정보
public record FlightDetail(
		FlightInfo flight,
		long destinationId,
		String destinationName,
		String aircraft,
		Integer baggageKg,
		boolean mealIncluded,
		String operatingDays,
		List<SegmentView> segments,
		List<FareDetail> fares) {

	private static final String[] DAYS = {"월", "화", "수", "목", "금", "토", "일"};

	public String operatingLabel() {
		if (operatingDays == null || operatingDays.chars().allMatch(c -> c == '1')) {
			return "매일 운항";
		}
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < Math.min(7, operatingDays.length()); i++) {
			if (operatingDays.charAt(i) == '1') {
				sb.append(sb.length() > 0 ? ", " : "").append(DAYS[i]);
			}
		}
		return sb + " 운항";
	}

	public String baggageLabel() {
		return baggageKg == null ? "-" : "위탁 수하물 " + baggageKg + "kg";
	}

	public String mealLabel() {
		return mealIncluded ? "기내식 제공" : "기내식 없음(유료)";
	}

	public int lowestPrice() {
		return fares.stream().mapToInt(FareDetail::total).min().orElse(0);
	}
}
