package com.infohub.project.login;

public class ProfileUpdateRequest {
	private String name;
	private String email;
	private String phone;
	private String password;
	private String keywords;
	
	public ProfileUpdateRequest() {}

	public ProfileUpdateRequest(String name, String email, String phone, String password, String keywords) {
		super();
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.password = password;
		this.keywords = keywords;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	@Override
	public String toString() {
		return "ProfileUpdateRequest [name=" + name + ", email=" + email + ", phone=" + phone + ", password=" + password
				+ ", keywords=" + keywords + "]";
	}
	
	
	
	
}
