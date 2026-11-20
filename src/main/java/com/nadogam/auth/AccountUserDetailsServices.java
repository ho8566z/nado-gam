package com.nadogam.auth;

import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

// 사용자용·관리자용 UserDetailsService. 서로 다른 테이블을 조회하므로 필터 체인마다 따로 쓴다.
@Component
public class AccountUserDetailsServices {

	private final MemberRepository members;
	private final AdminAccountRepository admins;

	public AccountUserDetailsServices(MemberRepository members, AdminAccountRepository admins) {
		this.members = members;
		this.admins = admins;
	}

	public UserDetailsService forMembers() {
		return loginId -> members.findByLoginId(loginId)
			.map(m -> new AppUser(m.getMemberId(), m.getLoginId(), m.getPasswordHash(), m.getName(),
				m.getRole(), "ACTIVE".equals(m.getStatus())))
			.orElseThrow(() -> new UsernameNotFoundException(loginId));
	}

	public UserDetailsService forAdmins() {
		return loginId -> admins.findByLoginId(loginId)
			.map(a -> new AppUser(a.getAdminId(), a.getLoginId(), a.getPasswordHash(), a.getName(),
				a.getRole(), "ACTIVE".equals(a.getStatus())))
			.orElseThrow(() -> new UsernameNotFoundException(loginId));
	}
}
