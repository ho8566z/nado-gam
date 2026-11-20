package com.nadogam.admin;

import jakarta.validation.constraints.AssertTrue;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

// 호텔 등록·수정 입력값. 해외는 여행지, 국내는 도시 중 하나에 속한다.
public class HotelForm {

	@Pattern(regexp = "OVERSEAS|DOMESTIC", message = "구분을 골라 주세요.")
	private String scope = "OVERSEAS";
	private Long destinationId;
	private Long cityId;

	@NotBlank(message = "호텔 이름을 입력해 주세요.")
	@Size(max = 80, message = "이름은 80자 이하로 입력해 주세요.")
	private String name;

	@NotNull(message = "성급을 입력해 주세요.")
	@Min(value = 1, message = "성급은 1~5 사이예요.")
	@Max(value = 5, message = "성급은 1~5 사이예요.")
	private Integer grade = 4;

	@NotBlank(message = "위치를 입력해 주세요.")
	@Size(max = 50, message = "위치는 50자 이하로 입력해 주세요.")
	private String area;

	@NotBlank(message = "소개를 입력해 주세요.")
	@Size(max = 200, message = "소개는 200자 이하로 입력해 주세요.")
	private String summary;

	@NotBlank(message = "편의시설을 입력해 주세요.")
	@Size(max = 200, message = "편의시설은 200자 이하로 입력해 주세요.")
	private String amenities;

	@NotNull(message = "1박 가격을 입력해 주세요.")
	@Min(value = 10000, message = "1박 가격은 10,000원 이상이에요.")
	@Max(value = 5000000, message = "1박 가격은 5,000,000원 이하예요.")
	private Integer pricePerNight;

	private Integer sortOrder = 0;

	@AssertTrue(message = "여행지(해외) 또는 도시(국내)를 골라 주세요.")
	public boolean isPlaceChosen() {
		return "DOMESTIC".equals(scope) ? cityId != null : destinationId != null;
	}

	public String getScope() { return scope; }
	public void setScope(String scope) { this.scope = scope; }
	public Long getDestinationId() { return destinationId; }
	public void setDestinationId(Long destinationId) { this.destinationId = destinationId; }
	public Long getCityId() { return cityId; }
	public void setCityId(Long cityId) { this.cityId = cityId; }
	public String getName() { return name; }
	public void setName(String name) { this.name = name; }
	public Integer getGrade() { return grade; }
	public void setGrade(Integer grade) { this.grade = grade; }
	public String getArea() { return area; }
	public void setArea(String area) { this.area = area; }
	public String getSummary() { return summary; }
	public void setSummary(String summary) { this.summary = summary; }
	public String getAmenities() { return amenities; }
	public void setAmenities(String amenities) { this.amenities = amenities; }
	public Integer getPricePerNight() { return pricePerNight; }
	public void setPricePerNight(Integer pricePerNight) { this.pricePerNight = pricePerNight; }
	public Integer getSortOrder() { return sortOrder; }
	public void setSortOrder(Integer sortOrder) { this.sortOrder = sortOrder; }
}
