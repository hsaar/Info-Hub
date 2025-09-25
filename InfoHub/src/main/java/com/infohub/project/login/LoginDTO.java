package com.infohub.project.login;

public class LoginDTO {
	private String username;
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
	
	public LoginDTO(String username, String password, String name, String email, String phone, int age) {
		super();
		this.username = username;
		this.password = password;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.age = age;
	}

	public LoginDTO(String username, String password, String name, String email, String phone, String created_date,
			String last_login, int status, int role, int age) {
		super();
		this.username = username;
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
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
		return "LoginDTO [username=" + username + ", password=" + password + ", name=" + name + ", email=" + email
				+ ", phone=" + phone + ", created_date=" + created_date + ", last_login=" + last_login + ", status="
				+ status + ", role=" + role + ", age=" + age + "]";
	}
}
