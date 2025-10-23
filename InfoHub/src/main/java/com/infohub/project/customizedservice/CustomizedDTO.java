package com.infohub.project.customizedservice; 

public class CustomizedDTO {
    private int registrationNo;
    private String title;
    private String content;
    private String link;
    private String trachea;
    private String regCall;
    private String regType;
    private String regDate;
    private String startDate;
    private String endDate;
    private int regionId;
    private int categoryId;
    private int minAge;
    private int maxAge;
    private int likes;
    private String createdAt;


    CustomizedDTO(){}


	public CustomizedDTO(int registrationNo, String title, String content, String link, String trachea, String regCall,
			String regType, String regDate, String startDate, String endDate, int regionId, int categoryId, int minAge,
			int maxAge, int likes, String createdAt) {
		super();
		this.registrationNo = registrationNo;
		this.title = title;
		this.content = content;
		this.link = link;
		this.trachea = trachea;
		this.regCall = regCall;
		this.regType = regType;
		this.regDate = regDate;
		this.startDate = startDate;
		this.endDate = endDate;
		this.regionId = regionId;
		this.categoryId = categoryId;
		this.minAge = minAge;
		this.maxAge = maxAge;
		this.likes = likes;
		this.createdAt = createdAt;
	}


	public int getRegistrationNo() {
		return registrationNo;
	}


	public void setRegistrationNo(int registrationNo) {
		this.registrationNo = registrationNo;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getLink() {
		return link;
	}


	public void setLink(String link) {
		this.link = link;
	}


	public String getTrachea() {
		return trachea;
	}


	public void setTrachea(String trachea) {
		this.trachea = trachea;
	}


	public String getRegCall() {
		return regCall;
	}


	public void setRegCall(String regCall) {
		this.regCall = regCall;
	}


	public String getRegType() {
		return regType;
	}


	public void setRegType(String regType) {
		this.regType = regType;
	}


	public String getRegDate() {
		return regDate;
	}


	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}


	public String getStartDate() {
		return startDate;
	}


	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}


	public String getEndDate() {
		return endDate;
	}


	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}


	public int getRegionId() {
		return regionId;
	}


	public void setRegionId(int regionId) {
		this.regionId = regionId;
	}


	public int getCategoryId() {
		return categoryId;
	}


	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}


	public int getMinAge() {
		return minAge;
	}


	public void setMinAge(int minAge) {
		this.minAge = minAge;
	}


	public int getMaxAge() {
		return maxAge;
	}


	public void setMaxAge(int maxAge) {
		this.maxAge = maxAge;
	}


	public int getLikes() {
		return likes;
	}


	public void setLikes(int likes) {
		this.likes = likes;
	}


	public String getCreatedAt() {
		return createdAt;
	}


	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}


	@Override
	public String toString() {
		return "CustomizedDTO [registrationNo=" + registrationNo + ", title=" + title + ", content=" + content
				+ ", link=" + link + ", trachea=" + trachea + ", regCall=" + regCall + ", regType=" + regType
				+ ", regDate=" + regDate + ", startDate=" + startDate + ", endDate=" + endDate + ", regionId="
				+ regionId + ", categoryId=" + categoryId + ", minAge=" + minAge + ", maxAge=" + maxAge + ", likes="
				+ likes + ", createdAt=" + createdAt + "]";
	}
    
    


}
