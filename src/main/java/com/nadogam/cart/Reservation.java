package com.nadogam.cart;

import java.time.LocalDateTime;

import com.nadogam.common.Fmt;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

// 예약(reservation). 모의 결제라 만들어지는 순간 결제 완료(PAID)다. 실제 결제는 일어나지 않는다.
@Entity
@Table(name = "reservation")
public class Reservation {

	public static final String PAID = "PAID";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long reservationId;
	private Long memberId;
	private String reservationNo;
	private long totalAmount;
	private String payMethod;
	private String status;
	private LocalDateTime paidAt;

	protected Reservation() {
	}

	public static Reservation paid(Long memberId, String reservationNo, long totalAmount, PayMethod method) {
		Reservation r = new Reservation();
		r.memberId = memberId;
		r.reservationNo = reservationNo;
		r.totalAmount = totalAmount;
		r.payMethod = method.name();
		r.status = PAID;
		r.paidAt = LocalDateTime.now();
		return r;
	}

	public String getPayMethodLabel() {
		return PayMethod.labelOf(payMethod);
	}

	public String getTotalLabel() {
		return Fmt.won(totalAmount);
	}

	public String getStatusLabel() {
		return PAID.equals(status) ? "결제 완료" : status;
	}

	public Long getReservationId() { return reservationId; }
	public Long getMemberId() { return memberId; }
	public String getReservationNo() { return reservationNo; }
	public long getTotalAmount() { return totalAmount; }
	public String getPayMethod() { return payMethod; }
	public String getStatus() { return status; }
	public LocalDateTime getPaidAt() { return paidAt; }
}
