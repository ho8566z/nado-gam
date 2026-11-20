package com.nadogam.support;

import jakarta.validation.constraints.AssertTrue;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

// 고객문의 등록 입력값
public class InquiryForm {

	@NotBlank(message = "분류를 선택해 주세요.")
	private String category = InquiryCategory.FLIGHT.name();

	@NotBlank(message = "제목을 입력해 주세요.")
	@Size(max = 100, message = "제목은 100자 이하로 입력해 주세요.")
	private String title;

	@NotBlank(message = "내용을 입력해 주세요.")
	@Size(max = 2000, message = "내용은 2000자 이하로 입력해 주세요.")
	private String content;

	@AssertTrue(message = "올바른 분류를 선택해 주세요.")
	public boolean isCategoryValid() {
		return category == null || category.isBlank() || InquiryCategory.of(category).isPresent();
	}

	public String getCategory() { return category; }
	public void setCategory(String category) { this.category = category; }
	public String getTitle() { return title; }
	public void setTitle(String title) { this.title = title; }
	public String getContent() { return content; }
	public void setContent(String content) { this.content = content; }
}
