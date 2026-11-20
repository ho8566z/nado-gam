package com.nadogam.admin;

import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.stereotype.Component;

// 관리자가 바꾼 내용을 admin_audit_log 에 남긴다.
@Component
public class AdminAudit {

	private final JdbcClient jdbc;

	public AdminAudit(JdbcClient jdbc) {
		this.jdbc = jdbc;
	}

	public void record(Long adminId, String action, String table, Object targetId, String detail) {
		jdbc.sql("""
			INSERT INTO admin_audit_log (admin_id, action, target_table, target_id, detail)
			VALUES (:admin, :action, :table, :target, :detail)
			""")
			.param("admin", adminId).param("action", action).param("table", table)
			.param("target", String.valueOf(targetId)).param("detail", detail)
			.update();
	}
}
