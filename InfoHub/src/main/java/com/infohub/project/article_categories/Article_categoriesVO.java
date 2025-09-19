package com.infohub.project.article_categories;

public class Article_categoriesVO {
	
	private int categories_id;
	private String name;
	
	Article_categoriesVO(){}

	public Article_categoriesVO(int categories_id, String name) {
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
		return "Article_categoriesVO [categories_id=" + categories_id + ", name=" + name + "]";
	}
	
	

}
