package com.nadogam.account;

import jakarta.validation.constraints.AssertTrue;
import jakarta.validation.constraints.NotBlank;

// 회원 탈퇴 확인 입력값: 비밀번호와 "탈퇴에 동의합니다" 체크(확인 단계).
public class WithdrawForm {

	@NotBlank(message = "비밀번호를 입력해 주세요.")
	private String password;

	@AssertTrue(message = "탈퇴 안내를 확인하고 동의해 주세요.")
	private boolean agree;

	public String getPassword() { return password; }
	public void setPassword(String password) { this.password = password; }
	public boolean isAgree() { return agree; }
	public void setAgree(boolean agree) { this.agree = agree; }
}
