package com.infohub.project.login;

import java.util.List;

public interface LoginService {
	public List<Object> listAll();
	public LoginDTO getUserById(int login_id);
}
