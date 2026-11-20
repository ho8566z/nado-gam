package com.nadogam.admin;

import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.validation.Valid;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

// 항공편 등록·수정 입력값. 도착 시각과 경유 구간 시간은 서버가 계산하므로 입력받지 않는다.
public class FlightForm {

	public static final List<String> CABINS = List.of("ECONOMY", "PREMIUM", "BUSINESS", "FIRST");

	@NotBlank(message = "편명을 입력해 주세요.")
	@Pattern(regexp = "^[A-Z0-9]{2}[0-9]{1,4}$", message = "편명은 항공사 코드 2자 + 숫자(예: MG901) 형식이에요.")
	private String flightNo;

	@NotBlank(message = "항공사를 골라 주세요.")
	private String airlineCode;

	@NotNull(message = "여행지를 골라 주세요.")
	private Long destinationId;

	@NotBlank(message = "출발 공항을 골라 주세요.")
	private String originAirport = "ICN";

	@NotBlank(message = "도착 공항을 골라 주세요.")
	private String arrivalAirport;

	@Pattern(regexp = "DIRECT|CONNECTING", message = "직항 또는 경유를 골라 주세요.")
	private String flightType = "DIRECT";

	private String viaAirport;

	@NotNull(message = "출발 시각을 입력해 주세요.")
	@DateTimeFormat(pattern = "HH:mm")
	private LocalTime departureTime;

	@NotNull(message = "총 소요 시간을 입력해 주세요.")
	@Min(value = 30, message = "소요 시간은 30분 이상이에요.")
	@Max(value = 2400, message = "소요 시간은 2,400분(40시간) 이하예요.")
	private Integer durationMinutes;

	@Size(max = 30, message = "기종은 30자 이하로 입력해 주세요.")
	private String aircraft;

	@Min(value = 0, message = "수하물은 0kg 이상이에요.")
	@Max(value = 100, message = "수하물은 100kg 이하예요.")
	private Integer baggageKg = 23;

	private boolean mealIncluded = true;

	// 운항 요일: 1(월)~7(일) 중 운항하는 요일
	private List<String> days = new ArrayList<>(List.of("1", "2", "3", "4", "5", "6", "7"));

	@Valid
	private List<FareForm> fares = defaultFares();

	private static List<FareForm> defaultFares() {
		List<FareForm> list = new ArrayList<>();
		for (String cabin : CABINS) {
			list.add(new FareForm(cabin));
		}
		return list;
	}

	// 요일 체크를 '1111111' 형태 문자열로 바꾼다.
	public String operatingDays() {
		StringBuilder sb = new StringBuilder();
		for (int d = 1; d <= 7; d++) {
			sb.append(days != null && days.contains(String.valueOf(d)) ? '1' : '0');
		}
		return sb.toString();
	}

	public void setOperatingDays(String bits) {
		days = new ArrayList<>();
		for (int i = 0; i < 7 && bits != null && i < bits.length(); i++) {
			if (bits.charAt(i) == '1') {
				days.add(String.valueOf(i + 1));
			}
		}
	}

	// 좌석 등급 한 줄: 체크한 등급만 저장한다. 표시 가격 = 운임 + 세금·유류할증료.
	public static class FareForm {

		private String cabin;
		private boolean enabled;
		private Integer price;
		private Integer taxFuel = 0;
		private Integer seatsTotal;
		private Integer seatsLeft;
		private boolean refundable;
		private Integer changeFee = 0;
		private String mileageRate = "0";

		public FareForm() {
		}

		public FareForm(String cabin) {
			this.cabin = cabin;
		}

		public String getCabin() { return cabin; }
		public void setCabin(String cabin) { this.cabin = cabin; }
		public boolean isEnabled() { return enabled; }
		public void setEnabled(boolean enabled) { this.enabled = enabled; }
		public Integer getPrice() { return price; }
		public void setPrice(Integer price) { this.price = price; }
		public Integer getTaxFuel() { return taxFuel; }
		public void setTaxFuel(Integer taxFuel) { this.taxFuel = taxFuel; }
		public Integer getSeatsTotal() { return seatsTotal; }
		public void setSeatsTotal(Integer seatsTotal) { this.seatsTotal = seatsTotal; }
		public Integer getSeatsLeft() { return seatsLeft; }
		public void setSeatsLeft(Integer seatsLeft) { this.seatsLeft = seatsLeft; }
		public boolean isRefundable() { return refundable; }
		public void setRefundable(boolean refundable) { this.refundable = refundable; }
		public Integer getChangeFee() { return changeFee; }
		public void setChangeFee(Integer changeFee) { this.changeFee = changeFee; }
		public String getMileageRate() { return mileageRate; }
		public void setMileageRate(String mileageRate) { this.mileageRate = mileageRate; }
	}

	public String getFlightNo() { return flightNo; }
	public void setFlightNo(String flightNo) { this.flightNo = flightNo == null ? null : flightNo.trim().toUpperCase(); }
	public String getAirlineCode() { return airlineCode; }
	public void setAirlineCode(String airlineCode) { this.airlineCode = airlineCode; }
	public Long getDestinationId() { return destinationId; }
	public void setDestinationId(Long destinationId) { this.destinationId = destinationId; }
	public String getOriginAirport() { return originAirport; }
	public void setOriginAirport(String originAirport) { this.originAirport = originAirport; }
	public String getArrivalAirport() { return arrivalAirport; }
	public void setArrivalAirport(String arrivalAirport) { this.arrivalAirport = arrivalAirport; }
	public String getFlightType() { return flightType; }
	public void setFlightType(String flightType) { this.flightType = flightType; }
	public String getViaAirport() { return viaAirport; }
	public void setViaAirport(String viaAirport) { this.viaAirport = viaAirport; }
	public LocalTime getDepartureTime() { return departureTime; }
	public void setDepartureTime(LocalTime departureTime) { this.departureTime = departureTime; }
	public Integer getDurationMinutes() { return durationMinutes; }
	public void setDurationMinutes(Integer durationMinutes) { this.durationMinutes = durationMinutes; }
	public String getAircraft() { return aircraft; }
	public void setAircraft(String aircraft) { this.aircraft = aircraft; }
	public Integer getBaggageKg() { return baggageKg; }
	public void setBaggageKg(Integer baggageKg) { this.baggageKg = baggageKg; }
	public boolean isMealIncluded() { return mealIncluded; }
	public void setMealIncluded(boolean mealIncluded) { this.mealIncluded = mealIncluded; }
	public List<String> getDays() { return days; }
	public void setDays(List<String> days) { this.days = days; }
	public List<FareForm> getFares() { return fares; }
	public void setFares(List<FareForm> fares) { this.fares = fares; }
}
