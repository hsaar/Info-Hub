package com.infohub.project.login;

import java.util.List;

public interface LoginDAO {
	public List<Object> listAll();
	public LoginDTO getUserById(String userId);
	public LoginDTO getUserByname(String name);
	public int checkuserIdDuplicate(String userId);
	public int checkNameDuplicate(String name);
	public int insertUser(LoginDTO dto);
	public int updateUser(LoginDTO dto);
	public int deleteUser(String userId);
	public LoginDTO login(LoginRequest req);
	public String findid(String name, String email, String phone);
	public int findpassword(String userId, String email, String phone);
	public int updatepassword(String password, String userId);
	public String checkPasswordById(String userId);
	public int updateKeywords(String userId,String keywords);

	// 카카오 ID로 유저 조회
	LoginDTO findByKakaoId(Long kakaoId);

    // 신규 유저 저장
    void insert(LoginDTO dto);
}
