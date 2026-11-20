package com.nadogam.account;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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

	@GetMapping("/account/password")
	public String passwordForm(Model model) {
		model.addAttribute("passwordForm", new PasswordForm());
		model.addAttribute("active", "account");
		return "account/password";
	}

	@PostMapping("/account/password")
	public String changePassword(@AuthenticationPrincipal AppUser user,
		@Validated @ModelAttribute("passwordForm") PasswordForm form, BindingResult errors, Model model) {
		model.addAttribute("active", "account");
		if (form.getNewPassword() != null && !form.getNewPassword().equals(form.getNewPasswordConfirm())) {
			errors.rejectValue("newPasswordConfirm", "mismatch", "새 비밀번호가 일치하지 않습니다.");
		}
		if (!errors.hasErrors() && !service.changePassword(user.getId(), form.getCurrentPassword(), form.getNewPassword())) {
			errors.rejectValue("currentPassword", "wrong", "현재 비밀번호가 올바르지 않습니다.");
		}
		return errors.hasErrors() ? "account/password" : "redirect:/account?passwordChanged";
	}

	@GetMapping("/account/withdraw")
	public String withdrawForm(Model model) {
		model.addAttribute("withdrawForm", new WithdrawForm());
		model.addAttribute("active", "account");
		return "account/withdraw";
	}

	@PostMapping("/account/withdraw")
	public String withdraw(@AuthenticationPrincipal AppUser user,
		@Validated @ModelAttribute("withdrawForm") WithdrawForm form, BindingResult errors, Model model,
		HttpServletRequest request, HttpServletResponse response) {
		model.addAttribute("active", "account");
		if (!errors.hasErrors() && !service.withdraw(user.getId(), form.getPassword())) {
			errors.rejectValue("password", "wrong", "비밀번호가 올바르지 않습니다.");
		}
		if (errors.hasErrors()) {
			return "account/withdraw";
		}
		// 탈퇴가 끝나면 로그인 상태도 함께 끊는다.
		new SecurityContextLogoutHandler().logout(request, response, SecurityContextHolder.getContext().getAuthentication());
		return "redirect:/?withdrawn";
	}
}
