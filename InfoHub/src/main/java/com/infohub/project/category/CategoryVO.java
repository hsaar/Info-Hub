package com.infohub.project.category;

public class AgeCategoryVO {
	private int id; // PK
	private String name; // 카테고리 이름 (예: "10대", "20대")
	
	AgeCategoryVO(){}
	
	public AgeCategoryVO(int id, String name) {
		super();
		this.id = id;
		this.name = name;
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

	
	
	
	
}
