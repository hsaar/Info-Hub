package com.infohub.project.mypage;

public class ScrapDTO {
    private int scrapId;
    private int loginId;
    private int policyId;
    private int articleId;
    private String createdAt;

    // 정책 정보 임시 필드(title, content)
    private String policyTitle;
    private String policyContent;

    // 기사 정보 임시 필드(title, content, image)
    private String articleTitle;
    private String articleContent;
    private String articleImage;
    
    // 스크랩 종류 구분
    private String type;   

    public ScrapDTO() {}

    // getter & setter
    public int getScrapId() { return scrapId; }
    public void setScrapId(int scrapId) { this.scrapId = scrapId; }

    public int getLoginId() { return loginId; }
    public void setLoginId(int loginId) { this.loginId = loginId; }

    public int getPolicyId() { return policyId; }
    public void setPolicyId(int policyId) { this.policyId = policyId; }

    public int getArticleId() { return articleId; }
    public void setArticleId(int articleId) { this.articleId = articleId; }

    public String getCreatedAt() { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }

    public String getPolicyTitle() { return policyTitle; }
    public void setPolicyTitle(String policyTitle) { this.policyTitle = policyTitle; }

    public String getPolicyContent() { return policyContent; }
    public void setPolicyContent(String policyContent) { this.policyContent = policyContent; }

    public String getArticleTitle() { return articleTitle; }
    public void setArticleTitle(String articleTitle) { this.articleTitle = articleTitle; }

    public String getArticleContent() { return articleContent; }
    public void setArticleContent(String articleContent) { this.articleContent = articleContent; }

    public String getArticleImage() { return articleImage; }
    public void setArticleImage(String articleImage) { this.articleImage = articleImage; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
}
