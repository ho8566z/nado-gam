package com.nadogam.auth;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

// 모든 화면의 상단 메뉴가 로그인 상태를 보여 줄 수 있게 로그인한 사람을 모델에 넣는다.
@ControllerAdvice
public class LoginUserAdvice {

	@ModelAttribute("loginUser")
	public AppUser loginUser() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		return auth != null && auth.getPrincipal() instanceof AppUser user ? user : null;
	}
}
