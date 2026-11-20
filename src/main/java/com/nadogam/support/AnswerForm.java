package com.nadogam.support;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

// 관리자 답변 입력값
public class AnswerForm {

	@NotBlank(message = "답변 내용을 입력해 주세요.")
	@Size(max = 2000, message = "답변은 2000자 이하로 입력해 주세요.")
	private String answer;

	public String getAnswer() { return answer; }
	public void setAnswer(String answer) { this.answer = answer; }
}
