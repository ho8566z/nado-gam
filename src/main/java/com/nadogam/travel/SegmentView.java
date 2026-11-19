package com.nadogam.travel;

import com.nadogam.common.Fmt;

// 항공편 상세의 구간 한 개 (경유편은 2구간)
public record SegmentView(
		int seq,
		String fromAirport,
		String fromCity,
		String toAirport,
		String toCity,
		int durationMinutes,
		Integer layoverMinutes) {

	public String durationLabel() {
		return Fmt.duration(durationMinutes);
	}

	public boolean hasLayover() {
		return layoverMinutes != null;
	}

	public String layoverLabel() {
		return layoverMinutes == null ? "" : Fmt.duration(layoverMinutes);
	}
}
