package com.infohub.project.registration; 

public class RegistrationDTO {
	private int login_loginNo;
	private int registrationNo;
	private String title;
	private String content;
	private String link;
	private String startDate;
	private String endDate;
	private String trachea;
	private String call;
	private String type;
	
	
	RegistrationDTO(){}
	
	
	public String getEndDate() {
		return endDate;
	}

	
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	
	public RegistrationDTO(int login_loginNo, int registrationNo, String title, String content, String link,
			String startDate, String endDate, String trachea, String call, String type) {
		super();
		this.login_loginNo = login_loginNo;
		this.registrationNo = registrationNo;
		this.title = title;
		this.content = content;
		this.link = link;
		this.startDate = startDate;
		this.endDate = endDate;
		this.trachea = trachea;
		this.call = call;
		this.type = type;
	}

	
	public int getLogin_loginNo() {
		return login_loginNo;
	}


	public void setLogin_loginNo(int login_loginNo) {
		this.login_loginNo = login_loginNo;
	}


	public int getRegistrationNo() {
		return registrationNo;
	}


	public void setRegistrationNo(int registrationNo) {
		this.registrationNo = registrationNo;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
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


	public String getStartDate() {
		return startDate;
	}


	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}


	public String getTrachea() {
		return trachea;
	}


	public void setTrachea(String trachea) {
		this.trachea = trachea;
	}


	public String getCall() {
		return call;
	}


	public void setCall(String call) {
		this.call = call;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	@Override
	public String toString() {
		return "RegistrationDTO [login_loginNo=" + login_loginNo + ", registrationNo=" + registrationNo + ", title="
				+ title + ", content=" + content + ", link=" + link + ", startDate=" + startDate + ", endDate="
				+ endDate + ", trachea=" + trachea + ", call=" + call + ", type=" + type + "]";
	}

}
