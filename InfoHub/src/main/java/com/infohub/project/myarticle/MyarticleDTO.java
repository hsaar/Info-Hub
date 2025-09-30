package com.infohub.project.myarticle;

public class MyarticleDTO {
	private String categorie;
	private String tags;
	private String image;
	private String title;
	private String link;
	private String source;
	private String name;
	
	public MyarticleDTO() {}
	
	public MyarticleDTO(String categorie, String tags, String image, String title, String link, String source, String name) {
		super();
		this.categorie = categorie;
		this.tags = tags;
		this.image = image;
		this.title = title;
		this.link = link;
		this.source = source;
		this.name = name;
	}

	public String getCategorie() {
		return categorie;
	}

	public void setCategorie(String categorie) {
		this.categorie = categorie;
	}

	public String gettags() {
		return tags;
	}

	public void settags(String tags) {
		this.tags = tags;
	}

	public String getimage() {
		return image;
	}

	public void setimage(String image) {
		this.image = image;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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
		return "MyarticleDTO [categorie=" + categorie + ", tags=" + tags + ", image=" + image + ", title=" + title
				+ ", link=" + link + ", source=" + source + ", name=" + name + "]";
	}
	
}
