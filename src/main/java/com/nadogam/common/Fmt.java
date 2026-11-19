package com.nadogam.common;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

// 화면에 표시할 값(가격, 시각, 소요시간 등)을 문자열로 바꾸는 도우미
public final class Fmt {

	private static final DateTimeFormatter HHMM = DateTimeFormatter.ofPattern("HH:mm");

	private Fmt() {
	}

	public static String won(long value) {
		return "₩" + count(value);
	}

	public static String count(long value) {
		return String.format(Locale.US, "%,d", value);
	}

	public static String time(LocalTime time) {
		return time.format(HHMM);
	}

	public static String duration(int minutes) {
		int h = minutes / 60;
		int m = minutes % 60;
		return m == 0 ? h + "시간" : h + "시간 " + m + "분";
	}

	// DB 의 색상 값이 #RRGGBB 형식이 아니면 기본 색을 쓴다(style 속성에 그대로 들어가므로 형식을 검증한다).
	public static String color(String value, String fallback) {
		return value != null && value.matches("#[0-9a-fA-F]{6}") ? value : fallback;
	}

	public static String cabin(String cabinClass) {
		return switch (cabinClass) {
			case "ECONOMY" -> "일반석";
			case "PREMIUM" -> "프리미엄 일반석";
			case "BUSINESS" -> "비즈니스석";
			case "FIRST" -> "일등석";
			default -> cabinClass;
		};
	}
}
