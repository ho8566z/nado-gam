package com.nadogam.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

// 푸터에서 연결하는 안내 화면(서비스 소개·이용약관·개인정보처리방침). 로그인 없이 볼 수 있다.
@Controller
public class InfoController {

	@GetMapping("/about")
	public String about() {
		return "info/about";
	}

	@GetMapping("/terms")
	public String terms() {
		return "info/terms";
	}

	@GetMapping("/privacy")
	public String privacy() {
		return "info/privacy";
	}
}
