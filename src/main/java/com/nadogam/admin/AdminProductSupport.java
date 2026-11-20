package com.nadogam.admin;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.server.ResponseStatusException;

// 관리자 상품 관리(특별전·투어·호텔·항공편) 화면이 함께 쓰는 도우미: 목록 모델 채우기, 휴지통 탭 처리.
@Component
public class AdminProductSupport {

	public static final String ACTIVE = "active";
	public static final String TRASH = "trash";

	public static boolean isTrash(String tab) {
		return TRASH.equals(tab);
	}

	// 목록 화면 공통 모델. base 는 "/admin/hotels" 같은 목록 주소이다.
	public void fillList(Model model, String menu, String title, String base, String tab, String q,
		List<String> headers, List<ProductRow> rows, int activeCount, int trashCount, String createLabel) {
		model.addAttribute("menu", menu);
		model.addAttribute("title", title);
		model.addAttribute("base", base);
		model.addAttribute("tab", isTrash(tab) ? TRASH : ACTIVE);
		model.addAttribute("q", q);
		model.addAttribute("headers", headers);
		model.addAttribute("rows", rows);
		model.addAttribute("activeCount", activeCount);
		model.addAttribute("trashCount", trashCount);
		model.addAttribute("createLabel", createLabel);
	}

	public static ResponseStatusException notFound() {
		return new ResponseStatusException(HttpStatus.NOT_FOUND, "없는 항목입니다.");
	}

	public static String won(long v) {
		return String.format("%,d원", v);
	}
}
