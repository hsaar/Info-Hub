package com.infohub.project.board_category;

public class SubCategoryVO {
	private int id;        // PK
    private String name;   // 소주제 이름
    private int ageCategoryId; // FK (상위 연령대 카테고리)
    
    SubCategoryVO(){}
    
    public SubCategoryVO(int id, String name, int ageCategoryId) {
    	super();
    	this.id = id;
    	this.name = name;
    	this.ageCategoryId = ageCategoryId;
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAgeCategoryId() {
		return ageCategoryId;
	}

	public void setAgeCategoryId(int ageCategoryId) {
		this.ageCategoryId = ageCategoryId;
	}

	
    
    
}
