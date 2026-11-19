package com.nadogam.travel;

import java.util.List;

import com.nadogam.common.Fmt;

public record BestFlight(FlightInfo flight, List<FarePrice> fares) {

	public String salesLabel() {
		return flight.salesCount() == null ? "-" : Fmt.count(flight.salesCount());
	}
}
