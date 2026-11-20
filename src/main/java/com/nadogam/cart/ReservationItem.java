package com.nadogam.cart;

import java.time.LocalDate;

import com.nadogam.common.Fmt;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

// 예약에 포함된 상품 한 줄(reservation_item). 장바구니 줄을 그대로 옮겨 저장한다.
@Entity
@Table(name = "reservation_item")
public class ReservationItem {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long reservationItemId;
	private Long reservationId;
	private String itemType;
	private Long refId;
	private String title;
	private String detail;
	private LocalDate travelDate;
	private int quantity;
	private int unitPrice;

	protected ReservationItem() {
	}

	public static ReservationItem from(Long reservationId, CartItem c) {
		ReservationItem i = new ReservationItem();
		i.reservationId = reservationId;
		i.itemType = c.getItemType();
		i.refId = c.getRefId();
		i.title = c.getTitle();
		i.detail = c.getDetail();
		i.travelDate = c.getTravelDate();
		i.quantity = c.getQuantity();
		i.unitPrice = c.getUnitPrice();
		return i;
	}

	public String getTypeLabel() {
		return ItemType.labelOf(itemType);
	}

	public String getAmountLabel() {
		return Fmt.won((long) unitPrice * quantity);
	}

	public Long getReservationItemId() { return reservationItemId; }
	public Long getReservationId() { return reservationId; }
	public String getItemType() { return itemType; }
	public Long getRefId() { return refId; }
	public String getTitle() { return title; }
	public String getDetail() { return detail; }
	public LocalDate getTravelDate() { return travelDate; }
	public int getQuantity() { return quantity; }
	public int getUnitPrice() { return unitPrice; }
}
