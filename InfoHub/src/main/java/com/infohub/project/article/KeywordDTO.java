package com.infohub.project.article;

public class KeywordDTO {
	
	private int searchId;
	private String skeyword;
	private int count;	
	
	KeywordDTO(){}

	public KeywordDTO(int searchId, String skeyword, int count) {
		super();
		this.searchId = searchId;
		this.skeyword = skeyword;
		this.count = count;
	}

	public int getSearchId() {
		return searchId;
	}

	public void setSearchId(int searchId) {
		this.searchId = searchId;
	}

	public String getSkeyword() {
		return skeyword;
	}

	public void setSkeyword(String skeyword) {
		this.skeyword = skeyword;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "KeywordDTO [searchId=" + searchId + ", skeyword=" + skeyword + ", count=" + count + "]";
	}
	
}
