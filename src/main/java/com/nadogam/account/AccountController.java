package com.nadogam.account;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.nadogam.auth.AppUser;
import com.nadogam.auth.Member;
import com.nadogam.auth.MemberRepository;
import com.nadogam.auth.MemberService;

// 계정 메뉴: 내 정보 조회·수정. 로그인한 사용자(ROLE_USER)만 들어온다(SecurityConfig).
@Controller
public class AccountController {

	private final MemberRepository members;
	private final MemberService service;

	public AccountController(MemberRepository members, MemberService service) {
		this.members = members;
		this.service = service;
	}

	@GetMapping("/account")
	public String view(@AuthenticationPrincipal AppUser user, Model model) {
		model.addAttribute("member", members.findById(user.getId()).orElseThrow());
		model.addAttribute("active", "account");
		return "account/view";
	}

	@GetMapping("/account/edit")
	public String editForm(@AuthenticationPrincipal AppUser user, Model model) {
		Member m = members.findById(user.getId()).orElseThrow();
		ProfileForm form = new ProfileForm();
		form.setName(m.getName());
		form.setPhone(m.getPhone());
		form.setEmail(m.getEmail());
		model.addAttribute("profileForm", form);
		model.addAttribute("active", "account");
		return "account/edit";
	}

	@PostMapping("/account/edit")
	public String edit(@AuthenticationPrincipal AppUser user,
		@Validated @ModelAttribute("profileForm") ProfileForm form, BindingResult errors, Model model) {
		model.addAttribute("active", "account");
		if (!errors.hasErrors()) {
			try {
				service.updateProfile(user.getId(), form.getName(), form.getPhone(), form.getEmail());
				return "redirect:/account?updated";
			} catch (MemberService.DuplicateException e) {
				errors.rejectValue(e.getField(), "duplicate", e.getMessage());
			}
		}
		return "account/edit";
	}
}
