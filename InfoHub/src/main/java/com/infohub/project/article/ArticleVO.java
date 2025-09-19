package com.infohub.project.article;

public class ArticleVO {
	
	private int article_id;
	private String title;
	private String content;
	private String tags;
	private String published;
	private String source;
	private int views;
	private int hearts;
	private String image;
	private int login_login_id;
	private int article_categories_categories_id;
	private String name;
	
	ArticleVO(){}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public ArticleVO(int article_id, String title, String content, String tags, String published, String source,
			int views, int hearts, String image, int login_login_id, int article_categories_categories_id,
			String name) {
		super();
		this.article_id = article_id;
		this.title = title;
		this.content = content;
		this.tags = tags;
		this.published = published;
		this.source = source;
		this.views = views;
		this.hearts = hearts;
		this.image = image;
		this.login_login_id = login_login_id;
		this.article_categories_categories_id = article_categories_categories_id;
		this.name = name;
	}


	public ArticleVO(int article_id, String title, String content, String tags, String published, String source,
			int views, int hearts, String image, int login_login_id, int article_categories_categories_id) {
		super();
		this.article_id = article_id;
		this.title = title;
		this.content = content;
		this.tags = tags;
		this.published = published;
		this.source = source;
		this.views = views;
		this.hearts = hearts;
		this.image = image;
		this.login_login_id = login_login_id;
		this.article_categories_categories_id = article_categories_categories_id;
	}

	public int getArticle_id() {
		return article_id;
	}

	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public String getPublished() {
		return published;
	}

	public void setPublished(String published) {
		this.published = published;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getHearts() {
		return hearts;
	}

	public void setHearts(int hearts) {
		this.hearts = hearts;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getLogin_login_id() {
		return login_login_id;
	}

	public void setLogin_login_id(int login_login_id) {
		this.login_login_id = login_login_id;
	}

	public int getArticle_categories_categories_id() {
		return article_categories_categories_id;
	}

	public void setArticle_categories_categories_id(int article_categories_categories_id) {
		this.article_categories_categories_id = article_categories_categories_id;
	}

	@Override
	public String toString() {
		return "Comment_articleVO [article_id=" + article_id + ", title=" + title + ", content=" + content + ", tags=" + tags
				+ ", published=" + published + ", source=" + source + ", views=" + views + ", hearts=" + hearts
				+ ", image=" + image + ", login_login_id=" + login_login_id + ", article_categories_categories_id="
				+ article_categories_categories_id + ", name=" + name + "]";
	}

	
	
	

	
	
	

}
