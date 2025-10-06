package com.infohub.project.comment.article;

public class ArticleCommentDTO {

    private int commentId;
    private int loginNo;
    private String content;
    private String createdAt;
    private String updatedAt;
    private int articleId;

    // Getter / Setter
    public int getCommentId() {
        return commentId;
    }
    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public int getLoginNo() {
        return loginNo;
    }
    public void setLoginNo(int loginNo) {
        this.loginNo = loginNo;
    }

    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }

    public String getCreatedAt() {
        return createdAt;
    }
    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }
    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }
    
    public int getArticleId() {
    	return articleId;
    }
    public void setArticleId(int articleId) {
    	this.articleId = articleId;
    }

}
