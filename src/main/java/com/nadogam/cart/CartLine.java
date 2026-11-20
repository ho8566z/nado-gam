package com.nadogam.cart;

// 담으려는 상품 한 줄을 서버가 DB 값으로 계산한 결과(화면에서 온 가격은 믿지 않는다).
// cabin 은 항공권의 좌석 등급 코드(결제할 때 그 등급의 남은 좌석을 줄이는 데 쓴다). 그 밖의 상품은 null 이다.
public record CartLine(ItemType type, long refId, String title, String detail, int unitPrice, int quantity, String cabin) {

	public CartLine(ItemType type, long refId, String title, String detail, int unitPrice, int quantity) {
		this(type, refId, title, detail, unitPrice, quantity, null);
	}
}
