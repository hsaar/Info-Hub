package com.infohub.project.login;

import java.util.List;

public interface LoginDAO {
	public List<Object> listAll();
	public LoginDTO getUserById(int login_id);
	public LoginDTO getUserByUsername(String username);
	public int checkUsernameDuplicate(String username);
	public int checkNameDuplicate(String name);
	public int insertUser(LoginDTO dto);
	public int updateUser(LoginDTO dto);
	public int deleteUser(String username);
	public LoginDTO login(LoginRequest req);
	
}
