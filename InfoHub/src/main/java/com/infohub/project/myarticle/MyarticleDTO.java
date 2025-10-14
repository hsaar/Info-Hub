package com.infohub.project.myarticle;

public class MyarticleDTO {
	private String title;
	private String keyword;
	private String tags;
	private String image;
	private String content;
	private String link;
	private String source;
	private String name;
	
	public MyarticleDTO() {}

	public MyarticleDTO(String title, String keyword, String tags, String image, String content, String link,
			String source, String name) {
		super();
		this.title = title;
		this.keyword = keyword;
		this.tags = tags;
		this.image = image;
		this.content = content;
		this.link = link;
		this.source = source;
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "MyarticleDTO [title=" + title + ", keyword=" + keyword + ", tags=" + tags + ", image=" + image
				+ ", content=" + content + ", link=" + link + ", source=" + source + ", name=" + name + "]";
	}
	
}
