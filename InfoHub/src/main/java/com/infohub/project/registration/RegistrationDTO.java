package com.infohub.project.registration; 

public class RegistrationDTO {
	private int loginNo;
	private int registrationNo;
	private String title;
	private String content;
	private String link;
	private String startDate;
	private String endDate;
	private String trachea;
	private String regCall;
	private String regType;
	
	
	RegistrationDTO(){}
	
	
	public String getEndDate() {
		return endDate;
	}

	
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	
	

	
	public RegistrationDTO(int loginNo, int registrationNo, String title, String content, String link, String startDate,
			String endDate, String trachea, String regCall, String regType) {
		super();
		this.loginNo = loginNo;
		this.registrationNo = registrationNo;
		this.title = title;
		this.content = content;
		this.link = link;
		this.startDate = startDate;
		this.endDate = endDate;
		this.trachea = trachea;
		this.regCall = regCall;
		this.regType = regType;
	}


	public int getLoginNo() {
		return loginNo;
	}


	public void setLoginNo(int loginNo) {
		this.loginNo = loginNo;
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


	public String getRegCall() {
		return regCall;
	}


	public void setRegCall(String regCall) {
		this.regCall = regCall;
	}


	public String getRegType() {
		return regType;
	}


	public void setRegType(String regType) {
		this.regType = regType;
	}


	@Override
	public String toString() {
		return "RegistrationDTO [loginNo=" + loginNo + ", registrationNo=" + registrationNo + ", title=" + title
				+ ", content=" + content + ", link=" + link + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", trachea=" + trachea + ", regCall=" + regCall + ", regType=" + regType + "]";
	}


}
