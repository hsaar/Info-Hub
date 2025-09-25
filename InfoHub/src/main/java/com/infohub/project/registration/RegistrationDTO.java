package com.infohub.project.registration; 

public class RegistrationDTO {
	private int login_loginNo;
	private int registrationNo;
	private String title;
	private String content;
	private String link;
	private String period;
	private String trachea;
	private String call;
	private String type;
	
	
	RegistrationDTO(){}


	public RegistrationDTO(int login_loginNo, int registrationNo, String title, String content, String link,
			String period, String trachea, String call, String type) {
		super();
		this.login_loginNo = login_loginNo;
		this.registrationNo = registrationNo;
		this.title = title;
		this.content = content;
		this.link = link;
		this.period = period;
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


	public String getPeriod() {
		return period;
	}


	public void setPeriod(String period) {
		this.period = period;
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
				+ title + ", content=" + content + ", link=" + link + ", period=" + period + ", trachea=" + trachea
				+ ", call=" + call + ", type=" + type + "]";
	}

	
}
