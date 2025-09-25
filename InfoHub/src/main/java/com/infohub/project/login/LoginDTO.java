package com.infohub.project.login;

public class LoginDTO {
	private String userId;
	private String password;
	private String name;
	private String email;
	private String phone;
	private String created_date;
	private String last_login;
	private int status; // 0 - 탈퇴 / 1 - 가입
	private int role; // 0 - 게스트 / 1 - 회원 / 2 - 관리자
	private int age;
	
	public LoginDTO() {}
	
	public LoginDTO(String userId, String password, String name, String email, String phone, int age) {
		super();
		this.userId = userId;
		this.password = password;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.age = age;
	}

	public LoginDTO(String userId, String password, String name, String email, String phone, String created_date,
			String last_login, int status, int role, int age) {
		super();
		this.userId = userId;
		this.password = password;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.created_date = created_date;
		this.last_login = last_login;
		this.status = status;
		this.role = role;
		this.age = age;
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

	public String getCreated_date() {
		return created_date;
	}

	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}

	public String getLast_login() {
		return last_login;
	}

	public void setLast_login(String last_login) {
		this.last_login = last_login;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	@Override
	public String toString() {
		return "LoginDTO [username=" + userId + ", password=" + password + ", name=" + name + ", email=" + email
				+ ", phone=" + phone + ", created_date=" + created_date + ", last_login=" + last_login + ", status="
				+ status + ", role=" + role + ", age=" + age + "]";
	}
}
