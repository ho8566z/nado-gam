package com.nadogam.popup;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.validation.constraints.AssertTrue;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

// 팝업 등록·수정 입력값. QR 주소는 사이트 안 경로(/…) 또는 http(s) 주소만 받는다(javascript: 같은 주소 차단).
public class PopupForm {

	@NotBlank(message = "제목을 입력해 주세요.")
	@Size(max = 100, message = "제목은 100자 이하로 입력해 주세요.")
	private String title;

	@NotBlank(message = "내용을 입력해 주세요.")
	@Size(max = 500, message = "내용은 500자 이하로 입력해 주세요.")
	private String body;

	@Size(max = 300, message = "주소는 300자 이하로 입력해 주세요.")
	@Pattern(regexp = "^$|^/[^\\s]*$|^https?://[^\\s]+$", message = "주소는 /로 시작하는 사이트 경로나 http(s):// 주소로 입력해 주세요.")
	private String qrTargetUrl;

	@NotNull(message = "시작 일시를 입력해 주세요.")
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
	private LocalDateTime startAt;

	@NotNull(message = "종료 일시를 입력해 주세요.")
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
	private LocalDateTime endAt;

	private boolean active = true;

	@AssertTrue(message = "종료 일시는 시작 일시보다 뒤여야 합니다.")
	public boolean isPeriodValid() {
		return startAt == null || endAt == null || endAt.isAfter(startAt);
	}

	public static PopupForm of(PopupEvent p) {
		PopupForm f = new PopupForm();
		f.title = p.getTitle();
		f.body = p.getBody();
		f.qrTargetUrl = p.getQrTargetUrl();
		f.startAt = p.getStartAt();
		f.endAt = p.getEndAt();
		f.active = p.isActive();
		return f;
	}

	public String getTitle() { return title; }
	public void setTitle(String title) { this.title = title; }
	public String getBody() { return body; }
	public void setBody(String body) { this.body = body; }
	public String getQrTargetUrl() { return qrTargetUrl; }
	public void setQrTargetUrl(String qrTargetUrl) { this.qrTargetUrl = qrTargetUrl; }
	public LocalDateTime getStartAt() { return startAt; }
	public void setStartAt(LocalDateTime startAt) { this.startAt = startAt; }
	public LocalDateTime getEndAt() { return endAt; }
	public void setEndAt(LocalDateTime endAt) { this.endAt = endAt; }
	public boolean isActive() { return active; }
	public void setActive(boolean active) { this.active = active; }
}
