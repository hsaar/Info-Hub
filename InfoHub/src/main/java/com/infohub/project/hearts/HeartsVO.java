package com.infohub.project.hearts;

public class HeartsVO {
	
	private String heartsNo;
	private String login_loginNo;
	private String article_articleId;
	private String createdData;
	
	HeartsVO(){}

	public HeartsVO(String heartsNo, String login_loginNo, String article_articleId, String createdData) {
		super();
		this.heartsNo = heartsNo;
		this.login_loginNo = login_loginNo;
		this.article_articleId = article_articleId;
		this.createdData = createdData;
	}

	public String getHeartsNo() {
		return heartsNo;
	}

	public void setHeartsNo(String heartsNo) {
		this.heartsNo = heartsNo;
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

	public String getCreatedData() {
		return createdData;
	}

	public void setCreatedData(String createdData) {
		this.createdData = createdData;
	}

	@Override
	public String toString() {
		return "HeartsVO [heartsNo=" + heartsNo + ", login_loginNo=" + login_loginNo + ", article_articleId="
				+ article_articleId + ", createdData=" + createdData + "]";
	}

	
}
