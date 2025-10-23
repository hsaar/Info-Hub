package com.infohub.project.login;

public class LoginDTO {
	private int loginNo;
	private String userId;
	private String password;
	private String name;
	private String email;
	private String phone;
	private String createdDate;
	private String lastLogin;
	private int status; // 0 - 탈퇴 / 1 - 가입
	private int role; // 0 - 게스트 / 1 - 회원 / 2 - 관리자
	private int age;
	private String gender;
	private String keywords;
	
	 // 🔹 카카오 로그인 필드 추가
    private Long kakaoId;  // 카카오 고유 ID
    private String kakaoEmail; // 카카오 이메일 (필요시)
	
	public LoginDTO() {}
	
	
	
	public LoginDTO(int loginNo, String userId, String password, String name, String email, String phone,
			String createdDate, String lastLogin, int status, int role, int age, String gender, String keywords) {
		super();
		this.loginNo = loginNo;
		this.userId = userId;
		this.password = password;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.createdDate = createdDate;
		this.lastLogin = lastLogin;
		this.status = status;
		this.role = role;
		this.age = age;
		this.gender = gender;
		this.keywords = keywords;
	}

	public LoginDTO(int loginNo, String userId, String password, String name, String email, String phone,
			String createdDate, String lastLogin, int status, int role, int age, String gender, String keywords, Long kakaoId, String kakaoEmail) {
		super();
		this.loginNo = loginNo;
		this.userId = userId;
		this.password = password;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.createdDate = createdDate;
		this.lastLogin = lastLogin;
		this.status = status;
		this.role = role;
		this.age = age;
		this.gender = gender;
		this.keywords = keywords;
		this.kakaoId = kakaoId;
        this.kakaoEmail = kakaoEmail;
	}

	public int getLoginNo() {
		return loginNo;
	}

	public void setLoginNo(int loginNo) {
		this.loginNo = loginNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
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

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(String lastLogin) {
		this.lastLogin = lastLogin;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public Long getKakaoId() { return kakaoId; }
    public void setKakaoId(Long kakaoId) { this.kakaoId = kakaoId; }
    public String getKakaoEmail() { return kakaoEmail; }
    public void setKakaoEmail(String kakaoEmail) { this.kakaoEmail = kakaoEmail; }

    @Override
    public String toString() {
        return "LoginDTO [loginNo=" + loginNo + ", userId=" + userId + ", password=" + password + ", name=" + name
                + ", email=" + email + ", phone=" + phone + ", createdDate=" + createdDate + ", lastLogin=" + lastLogin
                + ", status=" + status + ", role=" + role + ", age=" + age + ", gender=" + gender + ", keywords="
                + keywords + ", kakaoId=" + kakaoId + ", kakaoEmail=" + kakaoEmail + "]";
    }
    
}
