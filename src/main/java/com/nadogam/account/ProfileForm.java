package com.nadogam.account;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

// 내 정보 수정 입력값(이름·전화·이메일). 아이디와 비밀번호는 여기서 바꾸지 않는다.
public class ProfileForm {

	@NotBlank(message = "이름을 입력해 주세요.")
	@Size(max = 50, message = "이름은 50자 이하로 입력해 주세요.")
	private String name;

	@NotBlank(message = "전화번호를 입력해 주세요.")
	@Pattern(regexp = "^010-\\d{4}-\\d{4}$", message = "전화번호는 010-0000-0000 형식으로 입력해 주세요.")
	private String phone;

	@NotBlank(message = "이메일을 입력해 주세요.")
	@Email(message = "이메일 형식이 올바르지 않습니다.")
	@Size(max = 100, message = "이메일은 100자 이하로 입력해 주세요.")
	private String email;

	public String getName() { return name; }
	public void setName(String name) { this.name = name; }
	public String getPhone() { return phone; }
	public void setPhone(String phone) { this.phone = phone; }
	public String getEmail() { return email; }
	public void setEmail(String email) { this.email = email; }
}
