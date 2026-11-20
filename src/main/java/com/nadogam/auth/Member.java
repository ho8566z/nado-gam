package com.nadogam.auth;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

// 사용자 계정(member 테이블). 탈퇴는 행을 지우지 않고 status 를 WITHDRAWN 으로 바꾼다.
@Entity
@Table(name = "member")
public class Member {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long memberId;
	private String loginId;
	private String passwordHash;
	private String name;
	private String phone;
	private String email;
	private String role;
	private String status;
	private LocalDateTime createdAt;
	private LocalDateTime updatedAt;
	private LocalDateTime withdrawnAt;

	protected Member() {
	}

	public static Member register(String loginId, String passwordHash, String name, String phone, String email) {
		Member m = new Member();
		m.loginId = loginId;
		m.passwordHash = passwordHash;
		m.name = name;
		m.phone = phone;
		m.email = email;
		m.role = "ROLE_USER";
		m.status = "ACTIVE";
		m.createdAt = LocalDateTime.now();
		m.updatedAt = m.createdAt;
		return m;
	}

	public void changePassword(String newPasswordHash) {
		this.passwordHash = newPasswordHash;
		this.updatedAt = LocalDateTime.now();
	}

	// 탈퇴는 행을 지우지 않고 상태만 바꾼다(소프트 삭제). WITHDRAWN 계정은 로그인할 수 없다.
	public void withdraw() {
		this.status = "WITHDRAWN";
		this.withdrawnAt = LocalDateTime.now();
		this.updatedAt = this.withdrawnAt;
	}

	public void updateProfile(String name, String phone, String email) {
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.updatedAt = LocalDateTime.now();
	}

	public Long getMemberId() { return memberId; }
	public String getLoginId() { return loginId; }
	public String getPasswordHash() { return passwordHash; }
	public String getName() { return name; }
	public String getPhone() { return phone; }
	public String getEmail() { return email; }
	public String getRole() { return role; }
	public String getStatus() { return status; }
	public LocalDateTime getCreatedAt() { return createdAt; }
	public LocalDateTime getUpdatedAt() { return updatedAt; }
	public LocalDateTime getWithdrawnAt() { return withdrawnAt; }
}
