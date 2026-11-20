package com.nadogam.admin;

import org.springframework.data.domain.Sort;
import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.nadogam.auth.MemberRepository;

// 관리자 웹: 대시보드와 회원 목록. 접근 제한은 SecurityConfig 의 /admin/** 규칙이 맡는다.
@Controller
public class AdminController {

	private final MemberRepository members;
	private final JdbcClient jdbc;

	public AdminController(MemberRepository members, JdbcClient jdbc) {
		this.members = members;
		this.jdbc = jdbc;
	}

	@GetMapping("/admin/login")
	public String login() {
		return "admin/login";
	}

	@GetMapping({ "/admin", "/admin/" })
	public String dashboard(Model model) {
		model.addAttribute("memberCount", count("member"));
		model.addAttribute("activeMemberCount",
			jdbc.sql("SELECT COUNT(*) FROM member WHERE status = 'ACTIVE'").query(Long.class).single());
		model.addAttribute("destinationCount", count("destination"));
		model.addAttribute("flightCount", count("flight"));
		model.addAttribute("menu", "dashboard");
		return "admin/dashboard";
	}

	@GetMapping("/admin/members")
	public String memberList(Model model) {
		model.addAttribute("members", members.findAll(Sort.by(Sort.Direction.DESC, "memberId")));
		model.addAttribute("menu", "members");
		return "admin/members";
	}

	// 테이블 이름은 위 호출처의 고정 문자열만 들어온다(사용자 입력 아님).
	private long count(String table) {
		return jdbc.sql("SELECT COUNT(*) FROM " + table).query(Long.class).single();
	}
}
