package com.nadogam.admin;

import java.util.List;

// 관리자 상품 목록 한 줄: 번호, 표에 보여 줄 칸들, 상태 표시.
public record ProductRow(long id, List<String> cells, String stateLabel, boolean on) {
}
