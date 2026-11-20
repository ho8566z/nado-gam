package com.nadogam.account;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;

// 비밀번호 변경 입력값. 새 비밀번호 규칙은 회원가입과 같다(영문·숫자 포함 8~20자).
public class PasswordForm {

	@NotBlank(message = "현재 비밀번호를 입력해 주세요.")
	private String currentPassword;

	@NotBlank(message = "새 비밀번호를 입력해 주세요.")
	@Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)\\S{8,20}$", message = "비밀번호는 영문과 숫자를 포함해 8~20자로 입력해 주세요.")
	private String newPassword;

	@NotBlank(message = "새 비밀번호를 한 번 더 입력해 주세요.")
	private String newPasswordConfirm;

	public String getCurrentPassword() { return currentPassword; }
	public void setCurrentPassword(String currentPassword) { this.currentPassword = currentPassword; }
	public String getNewPassword() { return newPassword; }
	public void setNewPassword(String newPassword) { this.newPassword = newPassword; }
	public String getNewPasswordConfirm() { return newPasswordConfirm; }
	public void setNewPasswordConfirm(String newPasswordConfirm) { this.newPasswordConfirm = newPasswordConfirm; }
}
