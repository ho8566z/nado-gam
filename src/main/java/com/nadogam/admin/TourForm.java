package com.nadogam.admin;

import java.util.ArrayList;
import java.util.List;

import jakarta.validation.Valid;
import jakarta.validation.constraints.AssertTrue;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

// 투어 등록·수정 입력값: 기본 정보 + 기간 옵션(박수·가격·인원) + 옵션마다 일차별 일정.
public class TourForm {

	@Pattern(regexp = "OVERSEAS|DOMESTIC", message = "구분을 골라 주세요.")
	private String scope = "OVERSEAS";
	private Long destinationId;
	private Long cityId;

	@Pattern(regexp = "FOOD_DRINK|SPORTS_ACTIVITY|ART_REST", message = "테마를 골라 주세요.")
	private String theme = "FOOD_DRINK";

	@NotBlank(message = "투어 이름을 입력해 주세요.")
	@Size(max = 100, message = "이름은 100자 이하로 입력해 주세요.")
	private String title;

	@NotBlank(message = "부제를 입력해 주세요.")
	@Size(max = 200, message = "부제는 200자 이하로 입력해 주세요.")
	private String subtitle;

	@Size(max = 50, message = "콜라보 브랜드는 50자 이하로 입력해 주세요.")
	private String collabBrand;

	@NotBlank(message = "추천 포인트를 입력해 주세요.")
	@Size(max = 500, message = "추천 포인트는 500자 이하로 입력해 주세요.")
	private String highlights;

	@NotBlank(message = "포함 사항을 입력해 주세요.")
	@Size(max = 500, message = "포함 사항은 500자 이하로 입력해 주세요.")
	private String includes;

	@NotBlank(message = "불포함 사항을 입력해 주세요.")
	@Size(max = 500, message = "불포함 사항은 500자 이하로 입력해 주세요.")
	private String excludes;

	@Size(max = 200, message = "출처 메모는 200자 이하로 입력해 주세요.")
	private String sourceNote;

	private Integer sortOrder = 0;

	@Valid
	private List<OptionForm> options = new ArrayList<>();

	@AssertTrue(message = "여행지(해외) 또는 도시(국내)를 골라 주세요.")
	public boolean isPlaceChosen() {
		return "DOMESTIC".equals(scope) ? cityId != null : destinationId != null;
	}

	// 기간 옵션 한 줄: 박수·1인 가격·인원 범위, 일정은 박수 + 1일치
	public static class OptionForm {

		@NotNull(message = "박수를 입력해 주세요.")
		private Integer nights;

		@NotNull(message = "1인 가격을 입력해 주세요.")
		private Integer price;

		@NotNull(message = "최소 인원을 입력해 주세요.")
		private Integer minPeople = 2;

		@NotNull(message = "최대 인원을 입력해 주세요.")
		private Integer maxPeople = 20;

		@Valid
		private List<DayForm> days = new ArrayList<>();

		public Integer getNights() { return nights; }
		public void setNights(Integer nights) { this.nights = nights; }
		public Integer getPrice() { return price; }
		public void setPrice(Integer price) { this.price = price; }
		public Integer getMinPeople() { return minPeople; }
		public void setMinPeople(Integer minPeople) { this.minPeople = minPeople; }
		public Integer getMaxPeople() { return maxPeople; }
		public void setMaxPeople(Integer maxPeople) { this.maxPeople = maxPeople; }
		public List<DayForm> getDays() { return days; }
		public void setDays(List<DayForm> days) { this.days = days; }
	}

	public static class DayForm {

		@NotBlank(message = "일정 제목을 입력해 주세요.")
		@Size(max = 100, message = "일정 제목은 100자 이하로 입력해 주세요.")
		private String title;

		@NotBlank(message = "일정 설명을 입력해 주세요.")
		@Size(max = 500, message = "일정 설명은 500자 이하로 입력해 주세요.")
		private String description;

		public String getTitle() { return title; }
		public void setTitle(String title) { this.title = title; }
		public String getDescription() { return description; }
		public void setDescription(String description) { this.description = description; }
	}

	public String getScope() { return scope; }
	public void setScope(String scope) { this.scope = scope; }
	public Long getDestinationId() { return destinationId; }
	public void setDestinationId(Long destinationId) { this.destinationId = destinationId; }
	public Long getCityId() { return cityId; }
	public void setCityId(Long cityId) { this.cityId = cityId; }
	public String getTheme() { return theme; }
	public void setTheme(String theme) { this.theme = theme; }
	public String getTitle() { return title; }
	public void setTitle(String title) { this.title = title; }
	public String getSubtitle() { return subtitle; }
	public void setSubtitle(String subtitle) { this.subtitle = subtitle; }
	public String getCollabBrand() { return collabBrand; }
	public void setCollabBrand(String collabBrand) { this.collabBrand = collabBrand; }
	public String getHighlights() { return highlights; }
	public void setHighlights(String highlights) { this.highlights = highlights; }
	public String getIncludes() { return includes; }
	public void setIncludes(String includes) { this.includes = includes; }
	public String getExcludes() { return excludes; }
	public void setExcludes(String excludes) { this.excludes = excludes; }
	public String getSourceNote() { return sourceNote; }
	public void setSourceNote(String sourceNote) { this.sourceNote = sourceNote; }
	public Integer getSortOrder() { return sortOrder; }
	public void setSortOrder(Integer sortOrder) { this.sortOrder = sortOrder; }
	public List<OptionForm> getOptions() { return options; }
	public void setOptions(List<OptionForm> options) { this.options = options; }
}
