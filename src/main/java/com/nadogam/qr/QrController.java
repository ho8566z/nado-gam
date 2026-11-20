package com.nadogam.qr;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import jakarta.servlet.http.HttpServletRequest;

// QR 이미지(SVG). /qr?target=/tour/3 처럼 사이트 안 경로를 주면 사이트 주소를 붙여 QR 로 만든다.
// 사이트 주소는 nadogam.public-base-url 설정(휴대폰 시연용 와이파이 주소)이 있으면 그것을, 없으면 요청 주소를 쓴다.
@Controller
public class QrController {

	private final QrService qr;
	private final String publicBaseUrl;

	public QrController(QrService qr, @Value("${nadogam.public-base-url:}") String publicBaseUrl) {
		this.qr = qr;
		this.publicBaseUrl = publicBaseUrl == null ? "" : publicBaseUrl.trim().replaceAll("/+$", "");
	}

	public String absolute(String target, HttpServletRequest request) {
		if (target.startsWith("/")) {
			String base = publicBaseUrl.isEmpty() ? ServletUriComponentsBuilder.fromContextPath(request).build().toUriString() : publicBaseUrl;
			return base + target;
		}
		return target;
	}

	@GetMapping("/qr")
	public ResponseEntity<String> image(@RequestParam String target, HttpServletRequest request) {
		if (!QrService.isValidTarget(target)) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).contentType(MediaType.TEXT_PLAIN).body("QR 로 만들 수 없는 주소예요.");
		}
		return ResponseEntity.ok().contentType(MediaType.valueOf("image/svg+xml"))
			.cacheControl(CacheControl.noStore())
			.body(qr.svg(absolute(target, request)));
	}
}
