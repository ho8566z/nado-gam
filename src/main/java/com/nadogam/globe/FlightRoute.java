package com.nadogam.globe;

import java.util.List;

import com.nadogam.globe.GlobeRoute.GlobePoint;

// 해외 여행 화면의 지구본에 그릴 항공편 한 편의 경로. 직항은 점 2개, 경유는 점 3개이다.
public record FlightRoute(long flightId, String flightType, List<GlobePoint> points) {
}
