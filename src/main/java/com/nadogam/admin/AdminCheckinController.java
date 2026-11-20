package com.nadogam.admin;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nadogam.auth.AppUser;
import com.nadogam.auth.MemberRepository;
import com.nadogam.cart.Reservation;
import com.nadogam.cart.ReservationItemRepository;
import com.nadogam.cart.ReservationRepository;

// 관리자 체크인: 예약 QR 을 스캔한 주소(…/r/토큰)나 토큰, 예약 번호를 입력하면 예약을 찾아 체크인 처리한다.
@Controller
public class AdminCheckinController {

	private final ReservationRepository reservations;
	private final ReservationItemRepository items;
	private final MemberRepository members;

	public AdminCheckinController(ReservationRepository reservations, ReservationItemRepository items, MemberRepository members) {
		this.reservations = reservations;
		this.items = items;
		this.members = members;
	}

	// 입력에서 토큰만 뽑는다. QR 주소(http://…/r/abc?x=1)를 그대로 붙여 넣어도 된다.
	public static String extractCode(String input) {
		if (input == null) {
			return "";
		}
		String code = input.trim();
		int slash = code.lastIndexOf("/r/");
		if (slash >= 0) {
			code = code.substring(slash + 3);
		}
		int cut = code.indexOf('?');
		if (cut >= 0) {
			code = code.substring(0, cut);
		}
		int hash = code.indexOf('#');
		if (hash >= 0) {
			code = code.substring(0, hash);
		}
		return code.trim();
	}

	private void fill(Model model, Reservation r) {
		model.addAttribute("reservation", r);
		model.addAttribute("items", items.findByReservationIdOrderByReservationItemId(r.getReservationId()));
		model.addAttribute("memberLoginId", members.findById(r.getMemberId()).map(m -> m.getLoginId()).orElse("-"));
	}

	@GetMapping("/admin/checkin")
	public String form(@RequestParam(required = false) String code, Model model) {
		model.addAttribute("menu", "checkin");
		if (code != null && !code.isBlank()) {
			String extracted = extractCode(code);
			model.addAttribute("code", code.trim());
			reservations.findByQrToken(extracted)
				.or(() -> reservations.findByReservationNo(extracted.toUpperCase()))
				.ifPresentOrElse(r -> fill(model, r), () -> model.addAttribute("notFound", true));
		}
		return "admin/checkin";
	}

	@PostMapping("/admin/checkin/{id}")
	@Transactional
	public String checkIn(@AuthenticationPrincipal AppUser admin, @PathVariable Long id) {
		Reservation r = reservations.findById(id).orElse(null);
		if (r == null) {
			return "redirect:/admin/checkin";
		}
		boolean done = r.checkIn(admin.getId());
		reservations.save(r);
		return "redirect:/admin/checkin?code=" + r.getReservationNo() + (done ? "&done" : "&already");
	}
}
