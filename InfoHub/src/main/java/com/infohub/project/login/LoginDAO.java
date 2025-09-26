package com.infohub.project.login;

import java.util.List;

public interface LoginDAO {
	public List<Object> listAll();
	public LoginDTO getUserById(int userId);
	public LoginDTO getUserByname(String name);
	public int checkuserIdDuplicate(String userId);
	public int checkNameDuplicate(String name);
	public int insertUser(LoginDTO dto);
	public int updateUser(LoginDTO dto);
	public int deleteUser(String userId);
	public LoginDTO login(LoginRequest req);
	
}
