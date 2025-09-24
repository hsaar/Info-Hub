package com.infohub.project.hearts;

public class HeartsVO {
	
	private String hearts_id;
	private String login_login_id;
	private String article_article_id;
	private String created_data;
	
	HeartsVO(){}

	public HeartsVO(String hearts_id, String login_login_id, String article_article_id, String created_data) {
		super();
		this.hearts_id = hearts_id;
		this.login_login_id = login_login_id;
		this.article_article_id = article_article_id;
		this.created_data = created_data;
	}

	public String getHearts_id() {
		return hearts_id;
	}

	public void setHearts_id(String hearts_id) {
		this.hearts_id = hearts_id;
	}

	public String getLogin_login_id() {
		return login_login_id;
	}

	public void setLogin_login_id(String login_login_id) {
		this.login_login_id = login_login_id;
	}

	public String getArticle_article_id() {
		return article_article_id;
	}

	public void setArticle_article_id(String article_article_id) {
		this.article_article_id = article_article_id;
	}

	public String getCreated_data() {
		return created_data;
	}

	public void setCreated_data(String created_data) {
		this.created_data = created_data;
	}

	@Override
	public String toString() {
		return "HeartsVO [hearts_id=" + hearts_id + ", login_login_id=" + login_login_id + ", article_article_id="
				+ article_article_id + ", created_data=" + created_data + "]";
	}

	
}
