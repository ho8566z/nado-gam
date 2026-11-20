package com.nadogam.auth;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

// 로그인한 사람 정보. 사용자·관리자 모두 이 클래스로 담고, 구분은 role 로 한다.
public class AppUser implements UserDetails {

	private final Long id;
	private final String loginId;
	private final String passwordHash;
	private final String name;
	private final String role;
	private final boolean active;

	public AppUser(Long id, String loginId, String passwordHash, String name, String role, boolean active) {
		this.id = id;
		this.loginId = loginId;
		this.passwordHash = passwordHash;
		this.name = name;
		this.role = role;
		this.active = active;
	}

	public Long getId() { return id; }
	public String getName() { return name; }
	public boolean isAdmin() { return "ROLE_ADMIN".equals(role); }

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return List.of(new SimpleGrantedAuthority(role));
	}

	@Override
	public String getPassword() { return passwordHash; }

	@Override
	public String getUsername() { return loginId; }

	// ACTIVE 가 아닌(정지·탈퇴) 계정은 로그인할 수 없다.
	@Override
	public boolean isEnabled() { return active; }
}
