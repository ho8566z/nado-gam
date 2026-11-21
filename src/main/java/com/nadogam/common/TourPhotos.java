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

// 투어 카드 오른쪽 절반의 테마 사진(음식과 주류·스포츠 경기장·예술과 휴식 명소). 파일(static/img/tour)만 읽으므로 DB·쿼리는 건드리지 않는다.
// credits.json(fetch_tour_photos.py 가 실제로 받은 사진의 이름·출처)에 있는 투어만 사진이 있고, 없으면 style() 이 빈 문자열이라 카드는 예전 모양 그대로다.
// 템플릿에서는 @tourPhotos 로 부른다.
@Component("tourPhotos")
public class TourPhotos {

	public record Credit(long tourId, String label, String subject, String author, String license, String source) {
	}

	private final Map<Long, Map<String, String>> credits = new HashMap<>();

	@SuppressWarnings("unchecked")
	public TourPhotos() {
		ClassPathResource resource = new ClassPathResource("static/img/tour/credits.json");
		if (!resource.exists()) {
			return;
		}
		try {
			String json = new String(resource.getInputStream().readAllBytes(), StandardCharsets.UTF_8);
			for (Map.Entry<String, Object> e : JsonParserFactory.getJsonParser().parseMap(json).entrySet()) {
				Map<String, String> row = new HashMap<>();
				((Map<String, Object>) e.getValue()).forEach((k, v) -> row.put(k, String.valueOf(v)));
				credits.put(Long.parseLong(e.getKey().substring("tour-".length())), row);
			}
		} catch (IOException e) {
			throw new IllegalStateException("static/img/tour/credits.json 을 읽지 못했습니다.", e);
		}
	}

	public boolean has(long tourId) {
		return credits.containsKey(tourId);
	}

	// 카드 style 속성에 이어 붙이는 값. 사진이 없으면 빈 문자열.
	public String style(long tourId) {
		return has(tourId) ? ";--theme-photo:url(/img/tour/tour-" + tourId + ".jpg)" : "";
	}

	// 사진에 붙이는 한글 이름(예: 카르보나라, 캄프 누). 없으면 빈 문자열.
	public String label(long tourId) {
		Map<String, String> c = credits.get(tourId);
		return c == null ? "" : c.getOrDefault("label", "");
	}

	public List<Credit> credits() {
		List<Credit> list = new ArrayList<>();
		credits.keySet().stream().sorted().forEach(id -> {
			Map<String, String> c = credits.get(id);
			list.add(new Credit(id, c.getOrDefault("label", ""), c.getOrDefault("subject", ""), c.getOrDefault("author", ""),
					c.getOrDefault("license", ""), c.getOrDefault("source", "")));
		});
		return list;
	}

	public int count() {
		return credits.size();
	}
}
