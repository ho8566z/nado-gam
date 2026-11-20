package com.nadogam.cart;

import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nadogam.auth.AppUser;
import com.nadogam.common.Fmt;

// 장바구니(담기·삭제)와 모의 결제. 로그인한 사용자(ROLE_USER)만 들어온다(SecurityConfig).
@Controller
public class CartController {

	private final CartService service;
	private final CartItemRepository carts;

	public CartController(CartService service, CartItemRepository carts) {
		this.service = service;
		this.carts = carts;
	}

	@GetMapping("/cart")
	public String cart(@AuthenticationPrincipal AppUser user, Model model) {
		List<CartItem> items = carts.findByMemberIdOrderByCreatedAtDesc(user.getId());
		model.addAttribute("items", items);
		model.addAttribute("total", Fmt.won(items.stream().mapToLong(CartItem::getLineAmount).sum()));
		model.addAttribute("methods", PayMethod.values());
		model.addAttribute("active", "cart");
		return "cart/list";
	}

	// 가격은 받지 않는다. 상품 번호와 선택값만 받아 서버가 DB 에서 다시 계산한다.
	@PostMapping("/cart/add")
	public String add(@AuthenticationPrincipal AppUser user, @RequestParam String type, @RequestParam(required = false) Long refId,
		@RequestParam(required = false) Long optionId, @RequestParam(required = false) String cabin,
		@RequestParam(required = false) Integer nights, @RequestParam(required = false) Integer quantity,
		@RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate date,
		RedirectAttributes redirect) {
		try {
			LocalDate travelDate = CartService.checkDate(date, LocalDate.now());
			CartLine line = service.price(type, refId, optionId, cabin, nights, quantity);
			service.add(user.getId(), line, travelDate);
			return "redirect:/cart?added";
		} catch (IllegalArgumentException e) {
			redirect.addFlashAttribute("error", e.getMessage());
			return "redirect:/cart";
		}
	}

	@PostMapping("/cart/{id}/delete")
	public String delete(@AuthenticationPrincipal AppUser user, @PathVariable Long id) {
		carts.deleteByCartItemIdAndMemberId(id, user.getId());
		return "redirect:/cart?removed";
	}

	@PostMapping("/checkout")
	public String checkout(@AuthenticationPrincipal AppUser user, @RequestParam(required = false) String method,
		RedirectAttributes redirect) {
		try {
			Reservation r = service.checkout(user.getId(), method);
			return "redirect:/reservations/" + r.getReservationId() + "?paid";
		} catch (IllegalArgumentException e) {
			redirect.addFlashAttribute("error", e.getMessage());
			return "redirect:/cart";
		}
	}
}
