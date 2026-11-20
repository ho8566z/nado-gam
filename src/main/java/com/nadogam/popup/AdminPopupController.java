package com.nadogam.popup;

import java.time.LocalDateTime;

import org.springframework.data.domain.Sort;
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

// 관리자 팝업 관리: 목록, 등록, 수정, 노출 켜기/끄기, 삭제. 접근 제한은 SecurityConfig 의 /admin/** 규칙이 맡는다.
@Controller
public class AdminPopupController {

	private final PopupEventRepository popups;

	public AdminPopupController(PopupEventRepository popups) {
		this.popups = popups;
	}

	private PopupEvent find(Long id) {
		return popups.findById(id).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
	}

	private String form(Model model, String action) {
		model.addAttribute("formAction", action);
		model.addAttribute("menu", "popups");
		return "admin/popup-form";
	}

	@GetMapping("/admin/popups")
	public String list(Model model) {
		model.addAttribute("popups", popups.findAll(Sort.by(Sort.Direction.DESC, "startAt")));
		model.addAttribute("now", LocalDateTime.now());
		model.addAttribute("menu", "popups");
		return "admin/popups";
	}

	@GetMapping("/admin/popups/new")
	public String newForm(Model model) {
		PopupForm form = new PopupForm();
		form.setStartAt(LocalDateTime.now().withSecond(0).withNano(0));
		form.setEndAt(form.getStartAt().plusDays(30));
		model.addAttribute("popupForm", form);
		return form(model, "/admin/popups");
	}

	@PostMapping("/admin/popups")
	public String create(@AuthenticationPrincipal AppUser admin,
		@Validated @ModelAttribute("popupForm") PopupForm form, BindingResult errors, Model model) {
		if (errors.hasErrors()) {
			return form(model, "/admin/popups");
		}
		popups.save(PopupEvent.create(form, admin.getId()));
		return "redirect:/admin/popups?saved";
	}

	@GetMapping("/admin/popups/{id}/edit")
	public String editForm(@PathVariable Long id, Model model) {
		model.addAttribute("popupForm", PopupForm.of(find(id)));
		return form(model, "/admin/popups/" + id);
	}

	@PostMapping("/admin/popups/{id}")
	public String update(@PathVariable Long id,
		@Validated @ModelAttribute("popupForm") PopupForm form, BindingResult errors, Model model) {
		PopupEvent p = find(id);
		if (errors.hasErrors()) {
			return form(model, "/admin/popups/" + id);
		}
		p.apply(form);
		popups.save(p);
		return "redirect:/admin/popups?saved";
	}

	@PostMapping("/admin/popups/{id}/toggle")
	public String toggle(@PathVariable Long id) {
		PopupEvent p = find(id);
		p.toggleActive();
		popups.save(p);
		return "redirect:/admin/popups";
	}

	@PostMapping("/admin/popups/{id}/delete")
	public String delete(@PathVariable Long id) {
		popups.delete(find(id));
		return "redirect:/admin/popups?deleted";
	}
}
