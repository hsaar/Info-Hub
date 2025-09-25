package com.infohub.project.login;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	private LoginDAOImpl dao;
	
	@Override
	public List<Object> listAll() {
		// TODO Auto-generated method stub
		return dao.listAll();
	}

	@Override
	public LoginDTO getUserById(int login_id) {
		// TODO Auto-generated method stub
		return dao.getUserById(login_id);
	}

	@Override
	public LoginDTO getUserByUsername(String username) {
		// TODO Auto-generated method stub
		return dao.getUserByUsername(username);
	}

	@Override
	public int checkUsernameDuplicate(String username) {
		// TODO Auto-generated method stub
		return dao.checkUsernameDuplicate(username);
	}

	@Override
	public int checkNameDuplicate(String name) {
		// TODO Auto-generated method stub
		return dao.checkNameDuplicate(name);
	}

	@Override
	public int insertUser(LoginDTO dto) {
		// TODO Auto-generated method stub
		return dao.insertUser(dto);
	}

	@Override
	public int updateUser(LoginDTO dto) {
		// TODO Auto-generated method stub
		return dao.updateUser(dto);
	}

	@Override
	public int deleteUser(String username) {
		// TODO Auto-generated method stub
		return dao.deleteUser(username);
	}

	@Override
	public LoginDTO login(LoginRequest req) {
		// TODO Auto-generated method stub
		return dao.login(req);
	}

}
