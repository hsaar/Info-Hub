package com.infohub.project.scraps;

public class ScrapsVO {
	
	private String scaps_id;
	private String created_date;
	private String login_login_id;
	private String article_article_id;
	
	ScrapsVO(){}

	public ScrapsVO(String scaps_id, String created_date, String login_login_id, String article_article_id,
			String article_categories_categories_id) {
		super();
		this.scaps_id = scaps_id;
		this.created_date = created_date;
		this.login_login_id = login_login_id;
		this.article_article_id = article_article_id;
	}

	public String getScaps_id() {
		return scaps_id;
	}

	public void setScaps_id(String scaps_id) {
		this.scaps_id = scaps_id;
	}

	public String getCreated_date() {
		return created_date;
	}

	public void setCreated_date(String created_date) {
		this.created_date = created_date;
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

	@Override
	public String toString() {
		return "ScrapsVO [scaps_id=" + scaps_id + ", created_date=" + created_date + ", login_login_id="
				+ login_login_id + ", article_article_id=" + article_article_id + "]";
	}

	
	
}
