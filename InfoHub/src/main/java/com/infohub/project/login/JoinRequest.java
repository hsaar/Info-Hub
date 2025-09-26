package com.infohub.project.login;

public class JoinRequest {
	
	private String userId;
	private String password;
	private String passwordCheck;
	private String name;
	
	public JoinRequest() {}
	
	public JoinRequest(String userId, String password, String passwordCheck, String name) {
		super();
		this.userId = userId;
		this.password = password;
		this.passwordCheck = passwordCheck;
		this.name = name;
	}

	public String getUsername() {
		return userId;
	}

	public void setUsername(String username) {
		this.userId = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordCheck() {
		return passwordCheck;
	}

	public void setPasswordCheck(String passwordCheck) {
		this.passwordCheck = passwordCheck;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "JoinDTO [username=" + userId + ", password=" + password + ", passwordCheck=" + passwordCheck
				+ ", name=" + name + "]";
	}
	
	
}
