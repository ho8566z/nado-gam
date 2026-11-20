package com.nadogam.admin;

import org.springframework.data.domain.Sort;
import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;

import com.nadogam.auth.AppUser;
import com.nadogam.auth.Member;
import com.nadogam.auth.MemberRepository;

// 관리자 웹: 대시보드와 회원 목록. 접근 제한은 SecurityConfig 의 /admin/** 규칙이 맡는다.
@Controller
public class AdminController {

	private final MemberRepository members;
	private final JdbcClient jdbc;
	private final AdminAudit audit;

	public AdminController(MemberRepository members, JdbcClient jdbc, AdminAudit audit) {
		this.members = members;
		this.jdbc = jdbc;
		this.audit = audit;
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
		model.addAttribute("unansweredCount",
			jdbc.sql("SELECT COUNT(*) FROM support_inquiry WHERE status = 'RECEIVED'").query(Long.class).single());
		model.addAttribute("menu", "dashboard");
		return "admin/dashboard";
	}

	@GetMapping("/admin/members")
	public String memberList(Model model) {
		model.addAttribute("members", members.findAll(Sort.by(Sort.Direction.DESC, "memberId")));
		model.addAttribute("menu", "members");
		return "admin/members";
	}

	// 회원 이용 정지/복구. 탈퇴 회원은 바꿀 수 없다.
	@PostMapping("/admin/members/{id}/status")
	public String changeStatus(@AuthenticationPrincipal AppUser admin, @PathVariable Long id, @RequestParam String action) {
		Member m = members.findById(id).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
		if (m.getStatus().equals("WITHDRAWN") || !(action.equals("suspend") || action.equals("restore"))) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST);
		}
		if (action.equals("suspend")) {
			m.suspend();
		} else {
			m.restore();
		}
		members.save(m);
		audit.record(admin.getId(), action.toUpperCase(), "member", id, m.getLoginId() + " 회원 " + (action.equals("suspend") ? "정지" : "복구"));
		return "redirect:/admin/members?saved";
	}

	// 테이블 이름은 위 호출처의 고정 문자열만 들어온다(사용자 입력 아님).
	private long count(String table) {
		return jdbc.sql("SELECT COUNT(*) FROM " + table).query(Long.class).single();
	}
}
