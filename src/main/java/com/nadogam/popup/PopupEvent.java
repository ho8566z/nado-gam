package com.nadogam.popup;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

// 이벤트 팝업(popup_event). 관리자가 등록하고 노출 기간·노출 여부를 정한다.
@Entity
@Table(name = "popup_event")
public class PopupEvent {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long popupId;
	private String title;
	private String body;
	private String qrTargetUrl;
	private LocalDateTime startAt;
	private LocalDateTime endAt;
	@Column(name = "is_active")
	private boolean active;
	private Long createdBy;
	private LocalDateTime createdAt;

	protected PopupEvent() {
	}

	public static PopupEvent create(PopupForm form, Long adminId) {
		PopupEvent p = new PopupEvent();
		p.apply(form);
		p.createdBy = adminId;
		p.createdAt = LocalDateTime.now();
		return p;
	}

	public void apply(PopupForm form) {
		this.title = form.getTitle().trim();
		this.body = form.getBody().trim();
		this.qrTargetUrl = form.getQrTargetUrl() == null || form.getQrTargetUrl().isBlank() ? null : form.getQrTargetUrl().trim();
		this.startAt = form.getStartAt();
		this.endAt = form.getEndAt();
		this.active = form.isActive();
	}

	public void toggleActive() {
		this.active = !this.active;
	}

	// 관리자 목록에 보여 줄 상태: 노출 중 / 예정 / 종료 / 숨김
	public String statusLabel(LocalDateTime now) {
		if (!active) {
			return "숨김";
		}
		if (now.isBefore(startAt)) {
			return "예정";
		}
		return now.isAfter(endAt) ? "종료" : "노출 중";
	}

	public Long getPopupId() { return popupId; }
	public String getTitle() { return title; }
	public String getBody() { return body; }
	public String getQrTargetUrl() { return qrTargetUrl; }
	public LocalDateTime getStartAt() { return startAt; }
	public LocalDateTime getEndAt() { return endAt; }
	public boolean isActive() { return active; }
	public Long getCreatedBy() { return createdBy; }
	public LocalDateTime getCreatedAt() { return createdAt; }
}
