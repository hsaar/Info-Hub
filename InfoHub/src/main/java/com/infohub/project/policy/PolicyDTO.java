package com.infohub.project.policy;

public class PolicyDTO {
    // 목록
    private String title;
    private String content;

    // 상세
    private String applicationLink;
    private String applicationStart;
    private String applicationEnd;
    private int likes;
    private int minAge;
    private int maxAge;

    // 필터링
    private int policyId;
    private int regionId;
    private int categoryId;
    
    // 분류
    private String keyword;
    
    // 정렬
    private String createdAt;

    public PolicyDTO() {}

    // Getter & Setter
    public int getPolicyId() { return policyId; }
    public void setPolicyId(int policyId) { this.policyId = policyId; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public String getApplicationLink() { return applicationLink; }
    public void setApplicationLink(String applicationLink) { this.applicationLink = applicationLink; }

    public String getApplicationStart() { return applicationStart; }
    public void setApplicationStart(String applicationStart) { this.applicationStart = applicationStart; }
    
    public String getApplicationEnd() { return applicationEnd; }
    public void setApplicationEnd(String applicationEnd) { this.applicationEnd = applicationEnd; }

    public int getLikes() { return likes; }
    public void setLikes(int likes) { this.likes = likes; }
    
    public int getRegionId() { return regionId; }
    public void setRegionId(int regionId) { this.regionId = regionId; }

    public int getCategoryId() { return categoryId; }
    public void setCategoryId(int categoryId) { this.categoryId = categoryId; }
    
    public String getKeyword() { return keyword; }
    public void setKeyword(String keyword) { this.keyword = keyword; }
    
    public String getCreatedAt() { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }

    public int getMinAge() { return minAge; }
    public void setMinAge(int minAge) { this.minAge = minAge; }

    public int getMaxAge() { return maxAge; }
    public void setMaxAge(int maxAge) { this.maxAge = maxAge; }

    @Override
    public String toString() {
        return "PolicyDTO{" +
                "id=" + policyId +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", regionId=" + regionId +
                ", categoryId=" + categoryId +
                ", minAge=" + minAge +
                ", maxAge=" + maxAge +
                '}';
    }
}
