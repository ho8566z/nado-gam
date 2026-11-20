package com.nadogam.domestic;

import java.time.LocalTime;

import com.nadogam.common.Fmt;

// 서울·대전에서 국내 여행지로 가는 이동편(성인 편도 1인 요금)
public record DomesticTransport(
		long transportId,
		String origin,
		String mode,
		String name,
		LocalTime departTime,
		int durationMinutes,
		int fare,
		String note) {

	public String originLabel() {
		return "DAEJEON".equals(origin) ? "대전" : "서울";
	}

	public String modeLabel() {
		return switch (mode) {
			case "TRAIN" -> "기차";
			case "EXPRESS_BUS" -> "고속버스";
			case "INTERCITY_BUS" -> "시외버스";
			case "FLIGHT" -> "항공";
			default -> mode;
		};
	}

	public String departLabel() {
		return Fmt.time(departTime);
	}

	public String durationLabel() {
		return Fmt.duration(durationMinutes);
	}

	public String fareLabel() {
		return Fmt.won(fare);
	}
}
