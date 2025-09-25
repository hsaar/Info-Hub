package com.infohub.project.mypage;

public class ScrapDTO {
    private int scrapsNo;
    private int loginNo;
    private int policyId;
    private int articleId;
    private String createdDate;

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
    public int getScrapId() { return scrapsNo; }
    public void setScrapId(int scrapId) { this.scrapsNo = scrapId; }

    public int getLoginId() { return loginNo; }
    public void setLoginId(int loginId) { this.loginNo = loginId; }

    public int getPolicyId() { return policyId; }
    public void setPolicyId(int policyId) { this.policyId = policyId; }

    public int getArticleId() { return articleId; }
    public void setArticleId(int articleId) { this.articleId = articleId; }

    public String getCreatedAt() { return createdDate; }
    public void setCreatedAt(String createdAt) { this.createdDate = createdAt; }

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
