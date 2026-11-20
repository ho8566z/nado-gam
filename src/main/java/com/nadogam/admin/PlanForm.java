package com.nadogam.admin;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.validation.Valid;
import jakarta.validation.constraints.AssertTrue;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

// 특별전(이달의 기획전) 등록·수정 입력값. 정가는 선택한 항공편·등급의 실제 요금에서 서버가 가져오므로 입력받지 않는다.
public class PlanForm {

	@NotBlank(message = "기획 월을 입력해 주세요.")
	@Pattern(regexp = "^\\d{4}-(0[1-9]|1[0-2])$", message = "기획 월은 2026-11 같은 형식이에요.")
	private String planMonth;

	@NotNull(message = "여행지를 골라 주세요.")
	private Long destinationId;

	@NotBlank(message = "제목을 입력해 주세요.")
	@Size(max = 100, message = "제목은 100자 이하로 입력해 주세요.")
	private String title;

	@Size(max = 200, message = "부제는 200자 이하로 입력해 주세요.")
	private String subtitle;

	@Size(max = 20, message = "배지 문구는 20자 이하로 입력해 주세요.")
	private String badgeText;

	@Size(max = 500, message = "추천 포인트는 500자 이하로 입력해 주세요.")
	private String highlights;

	@NotNull(message = "시작 일시를 입력해 주세요.")
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
	private LocalDateTime startAt;

	@NotNull(message = "종료 일시를 입력해 주세요.")
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
	private LocalDateTime endAt;

	private boolean active = true;

	@Valid
	private List<DealForm> deals = new ArrayList<>();

	@AssertTrue(message = "종료 일시는 시작 일시보다 뒤여야 합니다.")
	public boolean isPeriodValid() {
		return startAt == null || endAt == null || endAt.isAfter(startAt);
	}

	// 특가 항공편 한 줄: 항공편·좌석 등급·특가·한정 좌석
	public static class DealForm {

		@NotNull(message = "항공편을 골라 주세요.")
		private Long flightId;

		@NotBlank(message = "좌석 등급을 골라 주세요.")
		@Pattern(regexp = "ECONOMY|PREMIUM|BUSINESS|FIRST", message = "좌석 등급을 골라 주세요.")
		private String cabin = "ECONOMY";

		@NotNull(message = "특가를 입력해 주세요.")
		private Integer salePrice;

		@NotNull(message = "한정 좌석을 입력해 주세요.")
		private Integer limitedSeats;

		public Long getFlightId() { return flightId; }
		public void setFlightId(Long flightId) { this.flightId = flightId; }
		public String getCabin() { return cabin; }
		public void setCabin(String cabin) { this.cabin = cabin; }
		public Integer getSalePrice() { return salePrice; }
		public void setSalePrice(Integer salePrice) { this.salePrice = salePrice; }
		public Integer getLimitedSeats() { return limitedSeats; }
		public void setLimitedSeats(Integer limitedSeats) { this.limitedSeats = limitedSeats; }
	}

	public String getPlanMonth() { return planMonth; }
	public void setPlanMonth(String planMonth) { this.planMonth = planMonth; }
	public Long getDestinationId() { return destinationId; }
	public void setDestinationId(Long destinationId) { this.destinationId = destinationId; }
	public String getTitle() { return title; }
	public void setTitle(String title) { this.title = title; }
	public String getSubtitle() { return subtitle; }
	public void setSubtitle(String subtitle) { this.subtitle = subtitle; }
	public String getBadgeText() { return badgeText; }
	public void setBadgeText(String badgeText) { this.badgeText = badgeText; }
	public String getHighlights() { return highlights; }
	public void setHighlights(String highlights) { this.highlights = highlights; }
	public LocalDateTime getStartAt() { return startAt; }
	public void setStartAt(LocalDateTime startAt) { this.startAt = startAt; }
	public LocalDateTime getEndAt() { return endAt; }
	public void setEndAt(LocalDateTime endAt) { this.endAt = endAt; }
	public boolean isActive() { return active; }
	public void setActive(boolean active) { this.active = active; }
	public List<DealForm> getDeals() { return deals; }
	public void setDeals(List<DealForm> deals) { this.deals = deals; }
}
