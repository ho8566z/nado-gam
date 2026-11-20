package com.nadogam.cart;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ReservationItemRepository extends JpaRepository<ReservationItem, Long> {

	List<ReservationItem> findByReservationIdOrderByReservationItemId(Long reservationId);
}
