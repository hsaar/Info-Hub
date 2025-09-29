package com.infohub.project.commentarticle;

public class CommentarticleVO {
	
	private String commentId;
	private String createdDate;
	private String lastModified;
	private String comment;
	private String login_loginNo;
	private String article_articleId;
	private String userId;
	
	CommentarticleVO(){}
	
	

	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public CommentarticleVO(String commentId, String createdDate, String lastModified, String comment,
			String login_loginNo, String article_articleId, String userId) {
		super();
		this.commentId = commentId;
		this.createdDate = createdDate;
		this.lastModified = lastModified;
		this.comment = comment;
		this.login_loginNo = login_loginNo;
		this.article_articleId = article_articleId;
		this.userId = userId;
	}



	public CommentarticleVO(String commentId, String createdDate, String lastModified, String comment,
			String login_loginNo, String article_articleId) {
		super();
		this.commentId = commentId;
		this.createdDate = createdDate;
		this.lastModified = lastModified;
		this.comment = comment;
		this.login_loginNo = login_loginNo;
		this.article_articleId = article_articleId;
	}

	public String getCommentId() {
		return commentId;
	}

	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getLastModified() {
		return lastModified;
	}

	public void setLastModified(String lastModified) {
		this.lastModified = lastModified;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getLogin_loginNo() {
		return login_loginNo;
	}

	public void setLogin_loginNo(String login_loginNo) {
		this.login_loginNo = login_loginNo;
	}

	public String getArticle_articleId() {
		return article_articleId;
	}

	public void setArticle_articleId(String article_articleId) {
		this.article_articleId = article_articleId;
	}



	@Override
	public String toString() {
		return "CommentarticleVO [commentId=" + commentId + ", createdDate=" + createdDate + ", lastModified="
				+ lastModified + ", comment=" + comment + ", login_loginNo=" + login_loginNo + ", article_articleId="
				+ article_articleId + ", userId=" + userId + "]";
	}

	

	
}
