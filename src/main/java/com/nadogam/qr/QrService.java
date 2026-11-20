package com.nadogam.qr;

import java.util.Map;
import java.util.regex.Pattern;

import org.springframework.stereotype.Service;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

// QR 코드를 SVG 문자열로 만든다. 이미지는 저장하지 않고 요청할 때마다 만든다.
@Service
public class QrService {

	public static final int MAX_LENGTH = 300;
	// 사이트 안 경로(/…, //로 시작하지 않음) 또는 http(s) 주소만 QR 로 만든다(javascript: 같은 주소 차단).
	private static final Pattern TARGET = Pattern.compile("^/(?!/)[^\\s]*$|^https?://[^\\s]+$");

	public static boolean isValidTarget(String target) {
		return target != null && target.length() <= MAX_LENGTH && TARGET.matcher(target).matches();
	}

	public String svg(String text) {
		BitMatrix matrix;
		try {
			matrix = new QRCodeWriter().encode(text, BarcodeFormat.QR_CODE, 0, 0,
				Map.of(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.M, EncodeHintType.MARGIN, 2,
					EncodeHintType.CHARACTER_SET, "UTF-8"));
		} catch (WriterException e) {
			throw new IllegalArgumentException("QR 코드를 만들 수 없는 내용이에요.", e);
		}
		int w = matrix.getWidth();
		int h = matrix.getHeight();
		StringBuilder path = new StringBuilder();
		for (int y = 0; y < h; y++) {
			for (int x = 0; x < w; x++) {
				if (matrix.get(x, y)) {
					path.append('M').append(x).append(',').append(y).append("h1v1h-1z");
				}
			}
		}
		return "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 " + w + " " + h + "\" shape-rendering=\"crispEdges\">"
			+ "<rect width=\"100%\" height=\"100%\" fill=\"#fff\"/><path fill=\"#000\" d=\"" + path + "\"/></svg>";
	}
}
