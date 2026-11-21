package com.nadogam.common;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.boot.json.JsonParserFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Component;

// 여행지 카드의 대표 관광지 사진·문구. 파일(static/img/dest)만 읽으므로 DB·쿼리는 건드리지 않는다.
// info.json(관광지·특산물, gen_dest_info.py)과 credits.json(실제로 받은 사진과 출처, fetch_dest_photos.py)을 읽고,
// 사진이 없는 도시는 style() 이 빈 문자열을 돌려줘 기존 그라데이션 카드가 그대로 보인다. 템플릿에서는 @destPhotos 로 부른다.
@Component("destPhotos")
public class DestPhotos {

	public record Credit(String key, String place, String subject, String author, String license, String source) {
	}

	private static final String BASE = "static/img/dest/";

	private final Map<String, Map<String, Map<String, String>>> info = new HashMap<>();   // kind -> id -> {name, landmark, specialty}
	private final Map<String, String> idByName = new HashMap<>();                         // kind + ":" + name -> id
	private final Map<String, Map<String, String>> credits = new HashMap<>();            // "overseas-1" -> {subject, author, license, source}

	public DestPhotos() {
		loadInfo();
		loadCredits();
	}

	@SuppressWarnings("unchecked")
	private void loadInfo() {
		Map<String, Object> root = read("info.json");
		for (Map.Entry<String, Object> kind : root.entrySet()) {
			Map<String, Map<String, String>> byId = new HashMap<>();
			for (Map.Entry<String, Object> e : ((Map<String, Object>) kind.getValue()).entrySet()) {
				Map<String, String> row = new HashMap<>();
				((Map<String, Object>) e.getValue()).forEach((k, v) -> row.put(k, String.valueOf(v)));
				byId.put(e.getKey(), row);
				idByName.put(kind.getKey() + ":" + row.get("name"), e.getKey());
			}
			info.put(kind.getKey(), byId);
		}
	}

	@SuppressWarnings("unchecked")
	private void loadCredits() {
		for (Map.Entry<String, Object> e : read("credits.json").entrySet()) {
			Map<String, String> row = new HashMap<>();
			((Map<String, Object>) e.getValue()).forEach((k, v) -> row.put(k, String.valueOf(v)));
			credits.put(e.getKey(), row);
		}
	}

	private Map<String, Object> read(String file) {
		ClassPathResource resource = new ClassPathResource(BASE + file);
		if (!resource.exists()) {
			return Map.of();
		}
		try {
			String json = new String(resource.getInputStream().readAllBytes(), StandardCharsets.UTF_8);
			return JsonParserFactory.getJsonParser().parseMap(json);
		} catch (IOException e) {
			throw new IllegalStateException(file + " 을 읽지 못했습니다.", e);
		}
	}

	private static String kindOf(String scope) {
		return "DOMESTIC".equalsIgnoreCase(scope) ? "domestic" : "overseas";
	}

	private static String key(String kind, long id) {
		return kind + "-" + id;
	}

	// 카드·머리글의 style 속성에 이어 붙이는 값. 사진이 없으면 빈 문자열.
	public String style(String kind, long id) {
		return credits.containsKey(key(kind, id)) ? ";--photo:url(/img/dest/" + key(kind, id) + ".jpg)" : "";
	}

	// 투어 카드처럼 번호 없이 이름과 범위(OVERSEAS/DOMESTIC)만 아는 곳
	public String styleByName(String scope, String name) {
		String kind = kindOf(scope);
		String id = idByName.get(kind + ":" + name);
		return id == null ? "" : style(kind, Long.parseLong(id));
	}

	public String landmark(String kind, long id) {
		return field(kind, String.valueOf(id), "landmark");
	}

	public String specialty(String kind, long id) {
		return field(kind, String.valueOf(id), "specialty");
	}

	public String landmarkByName(String scope, String name) {
		return fieldByName(scope, name, "landmark");
	}

	public String specialtyByName(String scope, String name) {
		return fieldByName(scope, name, "specialty");
	}

	private String fieldByName(String scope, String name, String field) {
		String kind = kindOf(scope);
		String id = idByName.get(kind + ":" + name);
		return id == null ? "" : field(kind, id, field);
	}

	private String field(String kind, String id, String field) {
		Map<String, String> row = info.getOrDefault(kind, Map.of()).get(id);
		return row == null ? "" : row.getOrDefault(field, "");
	}

	// 사진 한 장의 출처(없으면 null). 여행지 상세에서 저작자·라이선스를 보여 준다.
	public Credit credit(String kind, long id) {
		Map<String, String> c = credits.get(key(kind, id));
		return c == null ? null : toCredit(kind + "-" + id, c);
	}

	// 사진 출처 화면용 전체 목록(해외 → 국내, 번호순)
	public List<Credit> credits() {
		List<Credit> list = new ArrayList<>();
		for (String kind : List.of("overseas", "domestic")) {
			info.getOrDefault(kind, Map.of()).keySet().stream().map(Integer::parseInt).sorted().forEach(n -> {
				Map<String, String> c = credits.get(key(kind, n));
				if (c != null) {
					list.add(toCredit(key(kind, n), c));
				}
			});
		}
		return list;
	}

	private Credit toCredit(String key, Map<String, String> c) {
		String[] parts = key.split("-");
		String place = info.getOrDefault(parts[0], Map.of()).getOrDefault(parts[1], Map.of()).getOrDefault("name", key);
		return new Credit(key, place, c.getOrDefault("subject", ""), c.getOrDefault("author", ""), c.getOrDefault("license", ""), c.getOrDefault("source", ""));
	}

	public int photoCount() {
		return credits.size();
	}
}
