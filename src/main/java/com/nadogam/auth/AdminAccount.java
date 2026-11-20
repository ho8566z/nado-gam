package com.nadogam.auth;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

// 관리자 계정(admin_account 테이블). 사용자 계정과 테이블·로그인 화면을 분리한다.
@Entity
@Table(name = "admin_account")
public class AdminAccount {

	@Id
	private Long adminId;
	private String loginId;
	private String passwordHash;
	private String name;
	private String phone;
	private String email;
	private String role;
	private String status;
	private LocalDateTime lastLoginAt;
	private LocalDateTime createdAt;

	protected AdminAccount() {
	}

	public Long getAdminId() { return adminId; }
	public String getLoginId() { return loginId; }
	public String getPasswordHash() { return passwordHash; }
	public String getName() { return name; }
	public String getPhone() { return phone; }
	public String getEmail() { return email; }
	public String getRole() { return role; }
	public String getStatus() { return status; }
	public LocalDateTime getLastLoginAt() { return lastLoginAt; }
	public LocalDateTime getCreatedAt() { return createdAt; }
}
