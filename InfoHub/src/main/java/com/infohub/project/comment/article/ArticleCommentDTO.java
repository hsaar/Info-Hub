package com.infohub.project.comment.article;

import java.time.LocalDateTime;

public class ArticleCommentDTO {
    private int commentId;
    private String comment;
    private LocalDateTime createdDate;
    private LocalDateTime lastModified;
    private int loginNo;
    private int articleId;

    public ArticleCommentDTO() {}

    public ArticleCommentDTO(int commentId, String comment, LocalDateTime createdDate,
                             LocalDateTime lastModified, int loginNo, int articleId) {
        this.commentId = commentId;
        this.comment = comment;
        this.createdDate = createdDate;
        this.lastModified = lastModified;
        this.loginNo = loginNo;
        this.articleId = articleId;
    }

    // getter / setter
    public int getCommentId() { return commentId; }
    public void setCommentId(int commentId) { this.commentId = commentId; }

    public String getComment() { return comment; }
    public void setComment(String comment) { this.comment = comment; }

    public LocalDateTime getCreatedDate() { return createdDate; }
    public void setCreatedDate(LocalDateTime createdDate) { this.createdDate = createdDate; }

    public LocalDateTime getLastModified() { return lastModified; }
    public void setLastModified(LocalDateTime lastModified) { this.lastModified = lastModified; }

    public int getLoginNo() { return loginNo; }
    public void setLoginNo(int loginNo) { this.loginNo = loginNo; }

    public int getArticleId() { return articleId; }
    public void setArticleId(int articleId) { this.articleId = articleId; }

    @Override
    public String toString() {
        return "ArticleCommentDTO{" +
                "commentId=" + commentId +
                ", comment='" + comment + '\'' +
                ", createdDate=" + createdDate +
                ", lastModified=" + lastModified +
                ", loginNo=" + loginNo +
                ", articleId=" + articleId +
                '}';
    }
}
