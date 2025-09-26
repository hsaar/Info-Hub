package com.infohub.project.login;

public class LoginRequest {
	private String userId;
	private String password;
	
	public LoginRequest() {}
	
	public LoginRequest(String userId, String password) {
		super();
		this.userId = userId;
		this.password = password;
	}

	public String getuserId() {
		return userId;
	}

	public void setuserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "LoginRequest [username=" + userId + ", password=" + password + "]";
	}
	
	
}
