package com.nadogam.travel;

import java.time.LocalTime;

import com.nadogam.common.Fmt;

// 항공편 한 편의 기본 정보 (가격은 따로 붙인다)
public record FlightInfo(
		long flightId,
		String flightNo,
		String airlineName,
		String flightType,
		String originCode,
		String originCity,
		String arrivalCode,
		String arrivalCity,
		String viaCity,
		LocalTime departureTime,
		LocalTime arrivalTime,
		int arrivalDayOffset,
		int durationMinutes,
		Integer rankNo,
		Integer salesCount) {

	public boolean direct() {
		return "DIRECT".equals(flightType);
	}

	public String typeLabel() {
		return direct() ? "직항" : "경유 · " + (viaCity == null ? "" : viaCity);
	}

	public String routeLabel() {
		return originCity + " " + originCode + " → " + arrivalCity + " " + arrivalCode;
	}

	public String depLabel() {
		return Fmt.time(departureTime);
	}

	public String arrLabel() {
		return Fmt.time(arrivalTime) + (arrivalDayOffset > 0 ? " (+" + arrivalDayOffset + "일)" : "");
	}

	public String durationLabel() {
		return Fmt.duration(durationMinutes);
	}
}
