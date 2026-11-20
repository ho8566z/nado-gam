package com.nadogam.support;

import java.util.Arrays;
import java.util.Optional;

// 고객문의 분류. DB 에는 name() 을 저장하고 화면에는 label 을 보여 준다.
public enum InquiryCategory {
	FLIGHT("항공"), TOUR("투어"), HOTEL("호텔"), CRUISE("크루즈"), PAYMENT("결제"), ETC("기타");

	private final String label;

	InquiryCategory(String label) {
		this.label = label;
	}

	public String getLabel() {
		return label;
	}

	public static Optional<InquiryCategory> of(String name) {
		return Arrays.stream(values()).filter(c -> c.name().equals(name)).findFirst();
	}

	public static String labelOf(String name) {
		return of(name).map(InquiryCategory::getLabel).orElse("기타");
	}
}
