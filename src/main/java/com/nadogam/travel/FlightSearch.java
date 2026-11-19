package com.nadogam.travel;

import java.util.List;

// 한 여행지·출발지의 항공편 검색 결과와 필터별 개수
public record FlightSearch(List<FlightOption> flights, int allCount, int directCount, int connectingCount) {
}
