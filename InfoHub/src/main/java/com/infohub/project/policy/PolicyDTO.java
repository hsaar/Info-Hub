package com.infohub.project.policy;

public class PolicyDTO {
    // 목록
    private String title;
    private String content;

    // 상세
    private String link;
    private String startDate;
    private String endDate;
    private int likes;
    private int minAge;
    private int maxAge;

    // 필터링
    private int registrationNo;
    private int regionId;
    private int categoryId;
    
    // 정렬
    private String createdAt;

    public PolicyDTO() {}

    // getter & setter
    public int getRegistrationNo() { return registrationNo; }
    public void setRegistrationNo(int registrationNo) { this.registrationNo = registrationNo; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public String getLink() { return link; }
    public void setLink(String link) { this.link = link; }

    public String getStartDate() { return startDate; }
    public void setStartDate(String startDate) { this.startDate = startDate; }
    
    public String getEndDate() { return endDate; }
    public void setEndDate(String endDate) { this.endDate = endDate; }

    public int getLikes() { return likes; }
    public void setLikes(int likes) { this.likes = likes; }
    
    public int getRegionId() { return regionId; }
    public void setRegionId(int regionId) { this.regionId = regionId; }

    public int getCategoryId() { return categoryId; }
    public void setCategoryId(int categoryId) { this.categoryId = categoryId; }
    
    public String getCreatedAt() { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }

    public int getMinAge() { return minAge; }
    public void setMinAge(int minAge) { this.minAge = minAge; }

    public int getMaxAge() { return maxAge; }
    public void setMaxAge(int maxAge) { this.maxAge = maxAge; }

    @Override
    public String toString() {
        return "PolicyDTO{" +
                "No=" + registrationNo +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", regionId=" + regionId +
                ", categoryId=" + categoryId +
                ", minAge=" + minAge +
                ", maxAge=" + maxAge +
                '}';
    }
}
