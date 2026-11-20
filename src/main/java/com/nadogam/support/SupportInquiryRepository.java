package com.nadogam.support;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface SupportInquiryRepository extends JpaRepository<SupportInquiry, Long> {

	List<SupportInquiry> findByMemberIdOrderByCreatedAtDesc(Long memberId);

	// 남의 문의는 조회되지 않게 작성자까지 함께 조건으로 건다.
	Optional<SupportInquiry> findByInquiryIdAndMemberId(Long inquiryId, Long memberId);

	List<SupportInquiry> findAllByOrderByCreatedAtDesc();

	List<SupportInquiry> findByStatusOrderByCreatedAtDesc(String status);

	long countByStatus(String status);
}
