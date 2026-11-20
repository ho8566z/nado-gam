package com.nadogam.cart;

// 담으려는 상품 한 줄을 서버가 DB 값으로 계산한 결과(화면에서 온 가격은 믿지 않는다).
public record CartLine(ItemType type, long refId, String title, String detail, int unitPrice, int quantity) {
}
