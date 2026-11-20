package com.nadogam.cart;

import java.time.LocalDateTime;
import java.util.UUID;

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
	public static final String CHECKED_IN = "CHECKED_IN";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long reservationId;
	private Long memberId;
	private String reservationNo;
	private long totalAmount;
	private String payMethod;
	private String status;
	private LocalDateTime paidAt;
	private String qrToken;
	private LocalDateTime checkedInAt;
	private Long checkedInBy;

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
		r.qrToken = UUID.randomUUID().toString().replace("-", "");
		return r;
	}

	// 관리자가 QR 로 체크인한다. 이미 체크인했으면 false(시각을 덮어쓰지 않는다).
	public boolean checkIn(Long adminId) {
		if (CHECKED_IN.equals(status)) {
			return false;
		}
		this.status = CHECKED_IN;
		this.checkedInAt = LocalDateTime.now();
		this.checkedInBy = adminId;
		return true;
	}

	public boolean isCheckedIn() {
		return CHECKED_IN.equals(status);
	}

	public String getPayMethodLabel() {
		return PayMethod.labelOf(payMethod);
	}

	public String getTotalLabel() {
		return Fmt.won(totalAmount);
	}

	public String getStatusLabel() {
		return switch (status) {
			case PAID -> "결제 완료";
			case CHECKED_IN -> "체크인 완료";
			default -> status;
		};
	}

	public Long getReservationId() { return reservationId; }
	public Long getMemberId() { return memberId; }
	public String getReservationNo() { return reservationNo; }
	public long getTotalAmount() { return totalAmount; }
	public String getPayMethod() { return payMethod; }
	public String getStatus() { return status; }
	public LocalDateTime getPaidAt() { return paidAt; }
	public String getQrToken() { return qrToken; }
	public LocalDateTime getCheckedInAt() { return checkedInAt; }
	public Long getCheckedInBy() { return checkedInBy; }
}
