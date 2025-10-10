package com.infohub.project.registration;

public class RegKeywordDTO {
	
	private int regsearchId;
	private String regkeyword;
	private int regcount;	
	
	RegKeywordDTO(){}

	public RegKeywordDTO(int regsearchId, String regkeyword, int regcount) {
		super();
		this.regsearchId = regsearchId;
		this.regkeyword = regkeyword;
		this.regcount = regcount;
	}

	public int getRegsearchId() {
		return regsearchId;
	}

	public void setRegsearchId(int regsearchId) {
		this.regsearchId = regsearchId;
	}

	public String getRegkeyword() {
		return regkeyword;
	}

	public void setRegkeyword(String regkeyword) {
		this.regkeyword = regkeyword;
	}

	public int getRegcount() {
		return regcount;
	}

	public void setRegcount(int regcount) {
		this.regcount = regcount;
	}

	@Override
	public String toString() {
		return "RegKeywordDTO [regsearchId=" + regsearchId + ", regkeyword=" + regkeyword + ", regcount=" + regcount
				+ "]";
	}
	
}
