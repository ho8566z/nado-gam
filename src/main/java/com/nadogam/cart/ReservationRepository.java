package com.nadogam.cart;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ReservationRepository extends JpaRepository<Reservation, Long> {

	List<Reservation> findByMemberIdOrderByPaidAtDesc(Long memberId);

	// 남의 예약은 조회되지 않게 주인까지 함께 조건으로 건다.
	Optional<Reservation> findByReservationIdAndMemberId(Long reservationId, Long memberId);

	// QR 에 담긴 토큰(또는 예약 번호)으로 찾는다. 스캔 화면과 관리자 체크인에서 쓴다.
	Optional<Reservation> findByQrToken(String qrToken);

	Optional<Reservation> findByReservationNo(String reservationNo);
}
