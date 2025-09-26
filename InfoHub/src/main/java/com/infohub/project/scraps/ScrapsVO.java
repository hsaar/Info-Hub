package com.infohub.project.scraps;

public class ScrapsVO {
	
	private String scapsNo;
	private String createdDate;
	private String login_loginNo;
	private String article_articleId;
	
	ScrapsVO(){}

	public ScrapsVO(String scapsNo, String createdDate, String login_loginNo, String article_articleId) {
		super();
		this.scapsNo = scapsNo;
		this.createdDate = createdDate;
		this.login_loginNo = login_loginNo;
		this.article_articleId = article_articleId;
	}

	public String getScapsNo() {
		return scapsNo;
	}

	public void setScapsNo(String scapsNo) {
		this.scapsNo = scapsNo;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
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
		return "ScrapsVO [scapsNo=" + scapsNo + ", createdDate=" + createdDate + ", login_loginNo=" + login_loginNo
				+ ", article_articleId=" + article_articleId + "]";
	}

	
}
