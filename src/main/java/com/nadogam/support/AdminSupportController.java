package com.nadogam.support;

import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;

import com.nadogam.auth.AppUser;
import com.nadogam.auth.Member;
import com.nadogam.auth.MemberRepository;

// 관리자 고객문의 관리: 문의 목록(상태 필터)과 답변 등록·수정. 접근 제한은 SecurityConfig 의 /admin/** 규칙이 맡는다.
@Controller
public class AdminSupportController {

	private final SupportInquiryRepository inquiries;
	private final MemberRepository members;

	public AdminSupportController(SupportInquiryRepository inquiries, MemberRepository members) {
		this.inquiries = inquiries;
		this.members = members;
	}

	private SupportInquiry find(Long id) {
		return inquiries.findById(id).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
	}

	private String loginIdOf(Long memberId) {
		return members.findById(memberId).map(Member::getLoginId).orElse("(알 수 없음)");
	}

	@GetMapping("/admin/inquiries")
	public String list(@RequestParam(required = false) String status, Model model) {
		String filter = SupportInquiry.RECEIVED.equals(status) || SupportInquiry.ANSWERED.equals(status) ? status : null;
		List<SupportInquiry> rows = filter == null
			? inquiries.findAllByOrderByCreatedAtDesc() : inquiries.findByStatusOrderByCreatedAtDesc(filter);
		Map<Long, String> names = members.findAllById(rows.stream().map(SupportInquiry::getMemberId).distinct().toList())
			.stream().collect(Collectors.toMap(Member::getMemberId, Member::getLoginId, (a, b) -> a));
		model.addAttribute("inquiries", rows);
		model.addAttribute("names", names);
		model.addAttribute("filter", filter);
		model.addAttribute("receivedCount", inquiries.countByStatus(SupportInquiry.RECEIVED));
		model.addAttribute("answeredCount", inquiries.countByStatus(SupportInquiry.ANSWERED));
		model.addAttribute("menu", "inquiries");
		return "admin/inquiries";
	}

	@GetMapping("/admin/inquiries/{id}")
	public String detail(@PathVariable Long id, Model model) {
		SupportInquiry q = find(id);
		AnswerForm form = new AnswerForm();
		form.setAnswer(q.getAnswerContent());
		model.addAttribute("answerForm", form);
		return detailView(model, q);
	}

	@PostMapping("/admin/inquiries/{id}/answer")
	public String answer(@AuthenticationPrincipal AppUser admin, @PathVariable Long id,
		@Validated @ModelAttribute("answerForm") AnswerForm form, BindingResult errors, Model model) {
		SupportInquiry q = find(id);
		if (errors.hasErrors()) {
			return detailView(model, q);
		}
		q.answer(form.getAnswer(), admin.getId());
		inquiries.save(q);
		return "redirect:/admin/inquiries/" + id + "?answered";
	}

	private String detailView(Model model, SupportInquiry q) {
		model.addAttribute("inquiry", q);
		model.addAttribute("writer", loginIdOf(q.getMemberId()));
		model.addAttribute("menu", "inquiries");
		return "admin/inquiry-detail";
	}
}
