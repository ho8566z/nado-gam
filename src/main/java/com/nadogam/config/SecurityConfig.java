package com.nadogam.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

	@Bean
	PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	// 골격 단계: 로그인 기능(사용자/관리자 분리)이 붙기 전까지 /admin/** 만 막고 나머지는 열어 둔다.
	@Bean
	SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http
			.authorizeHttpRequests(auth -> auth
				.requestMatchers("/admin/**").hasRole("ADMIN")
				.anyRequest().permitAll())
			.headers(headers -> headers.frameOptions(frame -> frame.sameOrigin()))
			.csrf(csrf -> csrf.ignoringRequestMatchers("/h2-console/**"));
		return http.build();
	}
}
