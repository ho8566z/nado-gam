package com.nadogam.support;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

// 고객문의(support_inquiry). 질문과 관리자 답변을 한 행에 둔다. 상태: RECEIVED(접수) / ANSWERED(답변 완료)
@Entity
@Table(name = "support_inquiry")
public class SupportInquiry {

	public static final String RECEIVED = "RECEIVED";
	public static final String ANSWERED = "ANSWERED";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long inquiryId;
	private Long memberId;
	private String category;
	private String title;
	@Column(columnDefinition = "TEXT")
	private String content;
	private String status;
	@Column(columnDefinition = "TEXT")
	private String answerContent;
	private Long answeredBy;
	private LocalDateTime createdAt;
	private LocalDateTime answeredAt;

	protected SupportInquiry() {
	}

	public static SupportInquiry create(Long memberId, InquiryForm form) {
		SupportInquiry q = new SupportInquiry();
		q.memberId = memberId;
		q.category = form.getCategory();
		q.title = form.getTitle().trim();
		q.content = form.getContent().trim();
		q.status = RECEIVED;
		q.createdAt = LocalDateTime.now();
		return q;
	}

	// 관리자가 답변을 등록한다. 이미 답변한 문의를 다시 저장하면 답변이 수정된다.
	public void answer(String answerContent, Long adminId) {
		this.answerContent = answerContent.trim();
		this.answeredBy = adminId;
		this.answeredAt = LocalDateTime.now();
		this.status = ANSWERED;
	}

	public boolean isAnswered() {
		return ANSWERED.equals(status);
	}

	public String getCategoryLabel() {
		return InquiryCategory.labelOf(category);
	}

	public String getStatusLabel() {
		return isAnswered() ? "답변 완료" : "접수";
	}

	public Long getInquiryId() { return inquiryId; }
	public Long getMemberId() { return memberId; }
	public String getCategory() { return category; }
	public String getTitle() { return title; }
	public String getContent() { return content; }
	public String getStatus() { return status; }
	public String getAnswerContent() { return answerContent; }
	public Long getAnsweredBy() { return answeredBy; }
	public LocalDateTime getCreatedAt() { return createdAt; }
	public LocalDateTime getAnsweredAt() { return answeredAt; }
}
