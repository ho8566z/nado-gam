package com.nadogam.support;

import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.server.ResponseStatusException;

import com.nadogam.auth.AppUser;

// 사용자 고객문의: 내 문의 목록, 문의 등록, 내 문의 상세(답변 확인). 로그인한 사용자(ROLE_USER)만 들어온다(SecurityConfig).
@Controller
public class SupportController {

	private final SupportInquiryRepository inquiries;

	public SupportController(SupportInquiryRepository inquiries) {
		this.inquiries = inquiries;
	}

	@GetMapping("/support")
	public String list(@AuthenticationPrincipal AppUser user, Model model) {
		model.addAttribute("inquiries", inquiries.findByMemberIdOrderByCreatedAtDesc(user.getId()));
		model.addAttribute("active", "support");
		return "support/list";
	}

	@GetMapping("/support/new")
	public String newForm(Model model) {
		model.addAttribute("inquiryForm", new InquiryForm());
		model.addAttribute("categories", InquiryCategory.values());
		model.addAttribute("active", "support");
		return "support/new";
	}

	@PostMapping("/support")
	public String create(@AuthenticationPrincipal AppUser user,
		@Validated @ModelAttribute("inquiryForm") InquiryForm form, BindingResult errors, Model model) {
		if (errors.hasErrors()) {
			model.addAttribute("categories", InquiryCategory.values());
			model.addAttribute("active", "support");
			return "support/new";
		}
		SupportInquiry saved = inquiries.save(SupportInquiry.create(user.getId(), form));
		return "redirect:/support/" + saved.getInquiryId() + "?created";
	}

	@GetMapping("/support/{id}")
	public String detail(@AuthenticationPrincipal AppUser user, @PathVariable Long id, Model model) {
		SupportInquiry q = inquiries.findByInquiryIdAndMemberId(id, user.getId())
			.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
		model.addAttribute("inquiry", q);
		model.addAttribute("active", "support");
		return "support/detail";
	}
}
