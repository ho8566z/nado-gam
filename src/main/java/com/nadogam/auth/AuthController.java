package com.nadogam.auth;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AuthController {

	private final MemberService service;

	public AuthController(MemberService service) {
		this.service = service;
	}

	@GetMapping("/login")
	public String login(Model model) {
		model.addAttribute("active", "account");
		return "auth/login";
	}

	@GetMapping("/signup")
	public String signupForm(Model model) {
		model.addAttribute("signupForm", new SignupForm());
		model.addAttribute("active", "account");
		return "auth/signup";
	}

	@PostMapping("/signup")
	public String signup(@Validated @ModelAttribute("signupForm") SignupForm form, BindingResult errors, Model model) {
		model.addAttribute("active", "account");
		if (form.getPassword() != null && !form.getPassword().equals(form.getPasswordConfirm())) {
			errors.rejectValue("passwordConfirm", "mismatch", "비밀번호가 일치하지 않습니다.");
		}
		if (!errors.hasErrors()) {
			try {
				service.signup(form);
				return "redirect:/login?joined";
			} catch (MemberService.DuplicateException e) {
				errors.rejectValue(e.getField(), "duplicate", e.getMessage());
			}
		}
		return "auth/signup";
	}
}
