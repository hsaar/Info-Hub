package com.infohub.project.article_categories; 

public class article_categoriesDTO {
	private int categories_id;
	private String name;
	
	
	article_categoriesDTO(){}


	public article_categoriesDTO(int categories_id, String name) {
		super();
		this.categories_id = categories_id;
		this.name = name;
	}


	public int getCategories_id() {
		return categories_id;
	}


	public void setCategories_id(int categories_id) {
		this.categories_id = categories_id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	@Override
	public String toString() {
		return "article_categoriesDTO [categories_id=" + categories_id + ", name=" + name + "]";
	}	
}
