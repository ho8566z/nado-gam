package com.nadogam.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.nadogam.auth.AccountUserDetailsServices;

// 필터 체인 2개: /admin/** 는 관리자 로그인(/admin/login), 나머지는 사용자 로그인(/login).
// 두 로그인은 서로 다른 테이블(admin_account, member)을 조회한다.
@Configuration
public class SecurityConfig {

	@Bean
	PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	@Order(1)
	SecurityFilterChain adminChain(HttpSecurity http, AccountUserDetailsServices services, PasswordEncoder encoder)
		throws Exception {
		http
			.securityMatcher("/admin/**")
			.authenticationProvider(provider(services.forAdmins(), encoder))
			.authorizeHttpRequests(auth -> auth
				.requestMatchers("/admin/login").permitAll()
				.anyRequest().hasRole("ADMIN"))
			.formLogin(form -> form
				.loginPage("/admin/login")
				.loginProcessingUrl("/admin/login")
				.defaultSuccessUrl("/admin", true)
				.failureUrl("/admin/login?error"))
			.logout(logout -> logout
				.logoutUrl("/admin/logout")
				.logoutSuccessUrl("/admin/login?logout"));
		return http.build();
	}

	@Bean
	@Order(2)
	SecurityFilterChain userChain(HttpSecurity http, AccountUserDetailsServices services, PasswordEncoder encoder)
		throws Exception {
		http
			.authenticationProvider(provider(services.forMembers(), encoder))
			.authorizeHttpRequests(auth -> auth
				.requestMatchers("/account", "/account/**").hasRole("USER")
				.anyRequest().permitAll())
			.formLogin(form -> form
				.loginPage("/login")
				.loginProcessingUrl("/login")
				.defaultSuccessUrl("/", false)
				.failureUrl("/login?error"))
			.logout(logout -> logout
				.logoutUrl("/logout")
				.logoutSuccessUrl("/?logout"))
			.headers(headers -> headers.frameOptions(frame -> frame.sameOrigin()))
			.csrf(csrf -> csrf.ignoringRequestMatchers("/h2-console/**"));
		return http.build();
	}

	private DaoAuthenticationProvider provider(UserDetailsService service, PasswordEncoder encoder) {
		DaoAuthenticationProvider provider = new DaoAuthenticationProvider(service);
		provider.setPasswordEncoder(encoder);
		return provider;
	}
}
