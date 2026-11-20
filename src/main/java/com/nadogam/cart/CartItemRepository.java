package com.nadogam.cart;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CartItemRepository extends JpaRepository<CartItem, Long> {

	List<CartItem> findByMemberIdOrderByCreatedAtDesc(Long memberId);

	long countByMemberId(Long memberId);

	// 남의 장바구니 줄은 지워지지 않게 주인까지 함께 조건으로 건다.
	long deleteByCartItemIdAndMemberId(Long cartItemId, Long memberId);

	long deleteByMemberId(Long memberId);
}
