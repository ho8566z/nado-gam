package com.nadogam.travel;

import java.util.List;

public record PlanFlight(FlightInfo flight, List<CabinPrice> cabins) {
}
