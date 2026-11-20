package com.nadogam.cart;

import java.util.Optional;

// 장바구니에 담을 수 있는 상품 종류
public enum ItemType {
	TOUR("투어"),
	HOTEL("호텔"),
	CRUISE("크루즈");

	private final String label;

	ItemType(String label) {
		this.label = label;
	}

	public String getLabel() {
		return label;
	}

	public static Optional<ItemType> of(String name) {
		for (ItemType t : values()) {
			if (t.name().equals(name)) {
				return Optional.of(t);
			}
		}
		return Optional.empty();
	}

	public static String labelOf(String name) {
		return of(name).map(ItemType::getLabel).orElse(name);
	}
}
