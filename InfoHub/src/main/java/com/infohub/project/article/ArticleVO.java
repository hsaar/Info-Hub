package com.infohub.project.article;

public class ArticleVO {
	
	private int articleId;
	private String title;
	private String content;
	private String tags;
	private String published;
	private String source;
	private int views;
	private int hearts;
	private String image;
	private int login_loginNo;
	private int articlecategories_categoriesNo;
	private String name;
	private String link;
	private String keyword;
	
	ArticleVO(){}
	
	
	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	public ArticleVO(int articleId, String title, String content, String tags, String published, String source,
			int views, int hearts, String image, int login_loginNo, int articlecategories_categoriesNo, String name,
			String link, String keyword) {
		super();
		this.articleId = articleId;
		this.title = title;
		this.content = content;
		this.tags = tags;
		this.published = published;
		this.source = source;
		this.views = views;
		this.hearts = hearts;
		this.image = image;
		this.login_loginNo = login_loginNo;
		this.articlecategories_categoriesNo = articlecategories_categoriesNo;
		this.name = name;
		this.link = link;
		this.keyword = keyword;
	}



	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public ArticleVO(int articleId, String title, String content, String tags, String published, String source,
			int views, int hearts, String image, int login_loginNo, int articlecategories_categoriesNo, String name,
			String link) {
		super();
		this.articleId = articleId;
		this.title = title;
		this.content = content;
		this.tags = tags;
		this.published = published;
		this.source = source;
		this.views = views;
		this.hearts = hearts;
		this.image = image;
		this.login_loginNo = login_loginNo;
		this.articlecategories_categoriesNo = articlecategories_categoriesNo;
		this.name = name;
		this.link = link;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public ArticleVO(int articleId, String title, String content, String tags, String published, String source,
			int views, int hearts, String image, int login_loginNo, int articlecategories_categoriesNo, String name) {
		super();
		this.articleId = articleId;
		this.title = title;
		this.content = content;
		this.tags = tags;
		this.published = published;
		this.source = source;
		this.views = views;
		this.hearts = hearts;
		this.image = image;
		this.login_loginNo = login_loginNo;
		this.articlecategories_categoriesNo = articlecategories_categoriesNo;
		this.name = name;
	}

	public ArticleVO(int articleId, String title, String content, String tags, String published, String source,
			int views, int hearts, String image, int login_loginNo, int articlecategories_categoriesNo) {
		super();
		this.articleId = articleId;
		this.title = title;
		this.content = content;
		this.tags = tags;
		this.published = published;
		this.source = source;
		this.views = views;
		this.hearts = hearts;
		this.image = image;
		this.login_loginNo = login_loginNo;
		this.articlecategories_categoriesNo = articlecategories_categoriesNo;
	}

	public int getArticleId() {
		return articleId;
	}

	public void setArticleId(int articleId) {
		this.articleId = articleId;
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

	public int getLogin_loginNo() {
		return login_loginNo;
	}

	public void setLogin_loginNo(int login_loginNo) {
		this.login_loginNo = login_loginNo;
	}

	public int getArticlecategories_categoriesNo() {
		return articlecategories_categoriesNo;
	}

	public void setArticlecategories_categoriesNo(int articlecategories_categoriesNo) {
		this.articlecategories_categoriesNo = articlecategories_categoriesNo;
	}


	@Override
	public String toString() {
		return "ArticleVO [articleId=" + articleId + ", title=" + title + ", content=" + content + ", tags=" + tags
				+ ", published=" + published + ", source=" + source + ", views=" + views + ", hearts=" + hearts
				+ ", image=" + image + ", login_loginNo=" + login_loginNo + ", articlecategories_categoriesNo="
				+ articlecategories_categoriesNo + ", name=" + name + ", link=" + link + ", keyword=" + keyword + "]";
	}

	

}
