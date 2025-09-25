package com.infohub.project.articlecategories;

public class ArticlecategoriesVO {
	
	private int categoriesNo;
	private String name;
	
	ArticlecategoriesVO(){}

	public ArticlecategoriesVO(int categoriesNo, String name) {
		super();
		this.categoriesNo = categoriesNo;
		this.name = name;
	}

	public int getCategoriesNo() {
		return categoriesNo;
	}

	public void setCategoriesNo(int categoriesNo) {
		this.categoriesNo = categoriesNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "ArticlecategoriesVO [categoriesNo=" + categoriesNo + ", name=" + name + "]";
	}

	
}
