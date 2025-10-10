package com.infohub.project.boardcategory;

public class CategoryVO {
	 private int categoryId;   // PK
	    private Integer parentId; // NULL이면 대분류, 값이 있으면 소분류
	    private String name;      // 카테고리 이름
	
	
	CategoryVO(){}

	
	
	public CategoryVO(int categoryId, Integer parentId, String name) {
		super();
		this.categoryId = categoryId;
		this.parentId = parentId;
		this.name = name;
	}

	public int getCategoryId() {
		return categoryId;
	}


	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}


	public int getParentId() {
		return parentId;
	}


	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}
	
	
}
