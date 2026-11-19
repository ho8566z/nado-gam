package com.nadogam.globe;

import java.util.List;

// 메인 지구본에 그릴 인천 출발 경로 한 개. 경유편은 points 가 3개 이상이다.
public record GlobeRoute(long destinationId, String name, boolean featured, List<GlobePoint> points) {

	public record GlobePoint(String code, String city, double lat, double lng) {
	}
}
