package com.infohub.project.hearts;

public class HeartDTO {
    private int heartNo;
    private int loginNo;
    private int articleId; 
    private String createdDate;

    // 기사 정보 (join 결과용 필드)
    private String articleTitle;
    private String articleContent;
    private String articleImage;

    public HeartDTO() {}

    // getter & setter
    public int getHeartNo() {
        return heartNo;
    }
    public void setHeartNo(int heartNo) {
        this.heartNo = heartNo;
    }

    public int getLoginNo() {
        return loginNo;
    }
    public void setLoginNo(int loginNo) {
        this.loginNo = loginNo;
    }

    public int getArticleId() {
        return articleId;
    }
    public void setArticleId(int articleId) {
        this.articleId = articleId;
    }

    public String getCreatedDate() {
        return createdDate;
    }
    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getArticleTitle() {
        return articleTitle;
    }
    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle;
    }

    public String getArticleContent() {
        return articleContent;
    }
    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent;
    }

    public String getArticleImage() {
        return articleImage;
    }
    public void setArticleImage(String articleImage) {
        this.articleImage = articleImage;
    }
}
