package com.nadogam.travel;

import java.util.List;

public record PlanDetail(PlanCard plan, List<PlanFlight> flights) {
}
