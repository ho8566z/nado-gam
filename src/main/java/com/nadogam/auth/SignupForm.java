package com.nadogam.auth;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

// 회원가입 입력값. 규칙은 명세서 초안(아이디 4~20자, 비밀번호 8~20자 영문·숫자 포함, 전화 010-0000-0000).
public class SignupForm {

	@NotBlank(message = "아이디를 입력해 주세요.")
	@Pattern(regexp = "^[A-Za-z0-9]{4,20}$", message = "아이디는 영문·숫자 4~20자로 입력해 주세요.")
	private String loginId;

	@NotBlank(message = "비밀번호를 입력해 주세요.")
	@Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)\\S{8,20}$", message = "비밀번호는 영문과 숫자를 포함해 8~20자로 입력해 주세요.")
	private String password;

	@NotBlank(message = "비밀번호를 한 번 더 입력해 주세요.")
	private String passwordConfirm;

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

	public String getLoginId() { return loginId; }
	public void setLoginId(String loginId) { this.loginId = loginId; }
	public String getPassword() { return password; }
	public void setPassword(String password) { this.password = password; }
	public String getPasswordConfirm() { return passwordConfirm; }
	public void setPasswordConfirm(String passwordConfirm) { this.passwordConfirm = passwordConfirm; }
	public String getName() { return name; }
	public void setName(String name) { this.name = name; }
	public String getPhone() { return phone; }
	public void setPhone(String phone) { this.phone = phone; }
	public String getEmail() { return email; }
	public void setEmail(String email) { this.email = email; }
}
