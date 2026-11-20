package com.nadogam.cart;

import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.server.ResponseStatusException;

import com.nadogam.auth.AppUser;

// 내 예약: 목록과 상세(남의 예약은 404). 로그인한 사용자(ROLE_USER)만 들어온다(SecurityConfig).
@Controller
public class ReservationController {

	private final ReservationRepository reservations;
	private final ReservationItemRepository items;

	public ReservationController(ReservationRepository reservations, ReservationItemRepository items) {
		this.reservations = reservations;
		this.items = items;
	}

	// QR 을 스캔하면 열리는 예약 확인 화면. 로그인 없이 열리므로 이름·연락처 같은 개인정보는 보여 주지 않는다.
	// 토큰은 추측할 수 없는 임의 값이다.
	@GetMapping("/r/{token}")
	public String ticket(@PathVariable String token, Model model) {
		Reservation r = reservations.findByQrToken(token).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
		model.addAttribute("reservation", r);
		model.addAttribute("items", items.findByReservationIdOrderByReservationItemId(r.getReservationId()));
		model.addAttribute("active", "reservations");
		return "cart/ticket";
	}

	@GetMapping("/reservations")
	public String list(@AuthenticationPrincipal AppUser user, Model model) {
		model.addAttribute("reservations", reservations.findByMemberIdOrderByPaidAtDesc(user.getId()));
		model.addAttribute("active", "reservations");
		return "cart/reservations";
	}

	@GetMapping("/reservations/{id}")
	public String detail(@AuthenticationPrincipal AppUser user, @PathVariable Long id, Model model) {
		Reservation r = reservations.findByReservationIdAndMemberId(id, user.getId())
			.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
		model.addAttribute("reservation", r);
		model.addAttribute("items", items.findByReservationIdOrderByReservationItemId(id));
		model.addAttribute("active", "reservations");
		return "cart/reservation";
	}
}
