package com.infohub.project.searchlistAll; 

public class SearchListAllDTO {
	private int articleId; 
	private String title;
	private String content;
	private String tags;
	private String published;
	private String source;
	private int views;
	private int hearts;
	private String image;
	private int loginLoginId;
	private int articleCategoriesCategoriesId;
	private String name;
	
	SearchListAllDTO(){}

	public SearchListAllDTO(int articleId, String title, String content, String tags, String published, String source,
			int views, int hearts, String image, int loginLoginId, int articleCategoriesCategoriesId, String name) {
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
		this.loginLoginId = loginLoginId; 
		this.articleCategoriesCategoriesId = articleCategoriesCategoriesId;
		this.name = name;
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

	public int getLoginLoginId() {
		return loginLoginId;
	}

	public void setLoginLoginId(int loginLoginId) {
		this.loginLoginId = loginLoginId;
	}

	public int getArticleCategoriesCategoriesId() {
		return articleCategoriesCategoriesId;
	}

	public void setArticleCategoriesCategoriesId(int articleCategoriesCategoriesId) {
		this.articleCategoriesCategoriesId = articleCategoriesCategoriesId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "SearchListAllDTO [articleId=" + articleId + ", title=" + title + ", content=" + content + ", tags="
				+ tags + ", published=" + published + ", source=" + source + ", views=" + views + ", hearts=" + hearts
				+ ", image=" + image + ", loginLoginId=" + loginLoginId + ", articleCategoriesCategoriesId="
				+ articleCategoriesCategoriesId + ", name=" + name + "]";
	}

}	