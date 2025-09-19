package com.infohub.project.registration; 

public class RegistrationDTO {
	private int login_id;
	private int registration_id;
	private String title;
	private String content;
	private String link;
	private String period;
	private String trachea;
	private String call;
	private String type;
	
	RegistrationDTO(){}

	public RegistrationDTO(int login_id, int registration_id, String title, String content, String link, String period,
			String trachea, String call, String type) {
		super();
		this.login_id = login_id;
		this.registration_id = registration_id;
		this.title = title;
		this.content = content;
		this.link = link;
		this.period = period;
		this.trachea = trachea;
		this.call = call;
		this.type = type;
	}

	public int getLogin_id() {
		return login_id;
	}

	public void setLogin_id(int login_id) {
		this.login_id = login_id;
	}

	public int getRegistration_id() {
		return registration_id;
	}

	public void setRegistration_id(int registration_id) {
		this.registration_id = registration_id;
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
		return "registrationDTO [login_id=" + login_id + ", registration_id=" + registration_id + ", title=" + title
				+ ", content=" + content + ", link=" + link + ", period=" + period + ", trachea=" + trachea + ", call="
				+ call + ", type=" + type + "]";
	}
}
