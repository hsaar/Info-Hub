package com.infohub.project.login;

import java.util.List;

public interface LoginService {
	public List<Object> listAll();
	public LoginDTO getUserById(String userId);
	public LoginDTO getUserByname(String name);
	public boolean checkuserIdDuplicate(String userId);
	public boolean checkNameDuplicate(String name);
	public int insertUser(LoginDTO dto);
	public int updateUser(LoginDTO dto);
	public int deleteUser(String userId);
	public LoginDTO login(LoginRequest req);
	public String findid(String name, String email, String phone);
	public int findpassword(String userId, String email, String phone);
	public int updatepassword(String password, String userId);
	public String checkPasswordById(String userId);
	public int updateKeywords(String userId,String keywords);
	
	void saveIfNotExist(LoginDTO kakaoUser);
	LoginDTO findByKakaoId(Long kakaoId);
}
