package com.nadogam.popup;

import java.time.LocalDateTime;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface PopupEventRepository extends JpaRepository<PopupEvent, Long> {

	// 메인에 띄울 팝업: 노출 여부가 켜져 있고 기간 안에 있는 것 중 가장 최근에 시작한 1개
	Optional<PopupEvent> findFirstByActiveTrueAndStartAtLessThanEqualAndEndAtGreaterThanEqualOrderByStartAtDesc(
		LocalDateTime start, LocalDateTime end);

	default Optional<PopupEvent> findShowing(LocalDateTime now) {
		return findFirstByActiveTrueAndStartAtLessThanEqualAndEndAtGreaterThanEqualOrderByStartAtDesc(now, now);
	}
}
