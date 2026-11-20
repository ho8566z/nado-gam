package com.nadogam.cart;

import java.time.LocalDate;
import java.time.LocalDateTime;

import com.nadogam.common.Fmt;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

// 장바구니 한 줄(cart_item). 담는 순간의 이름·설명·단가를 그대로 저장한다. 금액 = 단가 × 수량.
@Entity
@Table(name = "cart_item")
public class CartItem {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long cartItemId;
	private Long memberId;
	private String itemType;
	private Long refId;
	private String title;
	private String detail;
	private String cabinClass;
	private LocalDate travelDate;
	private int quantity;
	private int unitPrice;
	private LocalDateTime createdAt;

	protected CartItem() {
	}

	public static CartItem create(Long memberId, CartLine line, LocalDate travelDate) {
		CartItem c = new CartItem();
		c.memberId = memberId;
		c.itemType = line.type().name();
		c.refId = line.refId();
		c.title = line.title();
		c.detail = line.detail();
		c.cabinClass = line.cabin();
		c.travelDate = travelDate;
		c.quantity = line.quantity();
		c.unitPrice = line.unitPrice();
		c.createdAt = LocalDateTime.now();
		return c;
	}

	public long getLineAmount() {
		return (long) unitPrice * quantity;
	}

	public String getTypeLabel() {
		return ItemType.labelOf(itemType);
	}

	public String getAmountLabel() {
		return Fmt.won(getLineAmount());
	}

	public String getUnitLabel() {
		return Fmt.won(unitPrice);
	}

	public Long getCartItemId() { return cartItemId; }
	public Long getMemberId() { return memberId; }
	public String getItemType() { return itemType; }
	public Long getRefId() { return refId; }
	public String getTitle() { return title; }
	public String getDetail() { return detail; }
	public String getCabinClass() { return cabinClass; }
	public LocalDate getTravelDate() { return travelDate; }
	public int getQuantity() { return quantity; }
	public int getUnitPrice() { return unitPrice; }
	public LocalDateTime getCreatedAt() { return createdAt; }
}
