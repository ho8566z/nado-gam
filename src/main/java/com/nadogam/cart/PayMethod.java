package com.nadogam.cart;

import java.util.Optional;

// 모의 결제 수단. 카드번호 같은 결제 정보는 받지 않고 수단만 고른다.
public enum PayMethod {
	CARD("신용·체크카드"),
	BANK("계좌이체"),
	EASY("간편결제");

	private final String label;

	PayMethod(String label) {
		this.label = label;
	}

	public String getLabel() {
		return label;
	}

	public static Optional<PayMethod> of(String name) {
		for (PayMethod m : values()) {
			if (m.name().equals(name)) {
				return Optional.of(m);
			}
		}
		return Optional.empty();
	}

	public static String labelOf(String name) {
		return of(name).map(PayMethod::getLabel).orElse(name);
	}
}
