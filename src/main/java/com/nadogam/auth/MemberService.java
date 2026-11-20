package com.nadogam.auth;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberService {

	// 중복 검사 실패. 컨트롤러가 어느 입력칸에 메시지를 붙일지 정하는 데 field 를 쓴다.
	public static class DuplicateException extends RuntimeException {
		private final String field;

		public DuplicateException(String field, String message) {
			super(message);
			this.field = field;
		}

		public String getField() { return field; }
	}

	private final MemberRepository members;
	private final PasswordEncoder encoder;

	public MemberService(MemberRepository members, PasswordEncoder encoder) {
		this.members = members;
		this.encoder = encoder;
	}

	@Transactional
	public Member signup(SignupForm form) {
		if (members.existsByLoginId(form.getLoginId())) {
			throw new DuplicateException("loginId", "이미 사용 중인 아이디입니다.");
		}
		if (members.existsByEmail(form.getEmail())) {
			throw new DuplicateException("email", "이미 가입된 이메일입니다.");
		}
		return members.save(Member.register(form.getLoginId(), encoder.encode(form.getPassword()),
			form.getName().trim(), form.getPhone(), form.getEmail().trim()));
	}

	@Transactional
	public void updateProfile(Long memberId, String name, String phone, String email) {
		if (members.existsByEmailAndMemberIdNot(email, memberId)) {
			throw new DuplicateException("email", "이미 가입된 이메일입니다.");
		}
		members.findById(memberId).orElseThrow().updateProfile(name.trim(), phone, email.trim());
	}
}
