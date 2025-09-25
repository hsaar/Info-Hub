package com.infohub.project.article;

public class CommentVO {
	
	private int comment_id;
	private String created_date;
	private String last_modified;
	private String comment;
	private int hearts;
	private int login_login_id;
	private int article_article_id;
	
	CommentVO(){}

	public CommentVO(int comment_id, String created_date, String last_modified, String comment, int hearts,
			int login_login_id, int article_article_id) {
		super();
		this.comment_id = comment_id;
		this.created_date = created_date;
		this.last_modified = last_modified;
		this.comment = comment;
		this.hearts = hearts;
		this.login_login_id = login_login_id;
		this.article_article_id = article_article_id;
	}

	public int getComment_id() {
		return comment_id;
	}

	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}

	public String getCreated_date() {
		return created_date;
	}

	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}

	public String getLast_modified() {
		return last_modified;
	}

	public void setLast_modified(String last_modified) {
		this.last_modified = last_modified;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getHearts() {
		return hearts;
	}

	public void setHearts(int hearts) {
		this.hearts = hearts;
	}

	public int getLogin_login_id() {
		return login_login_id;
	}

	public void setLogin_login_id(int login_login_id) {
		this.login_login_id = login_login_id;
	}

	public int getArticle_article_id() {
		return article_article_id;
	}

	public void setArticle_article_id(int article_article_id) {
		this.article_article_id = article_article_id;
	}

	@Override
	public String toString() {
		return "Comment_articleVO [comment_id=" + comment_id + ", created_date=" + created_date + ", last_modified="
				+ last_modified + ", comment=" + comment + ", hearts=" + hearts + ", login_login_id=" + login_login_id
				+ ", article_article_id=" + article_article_id + "]";
	}
	
	
}
