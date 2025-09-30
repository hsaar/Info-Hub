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
	public LoginDTO getUserById(String userId) {
		// TODO Auto-generated method stub
		return dao.getUserById(userId);
	}

	@Override
	public LoginDTO getUserByname(String name) {
		// TODO Auto-generated method stub
		return dao.getUserByname(name);
	}

	@Override
	public boolean checkuserIdDuplicate(String userId) {
		// TODO Auto-generated method stub
		return dao.checkuserIdDuplicate(userId) > 0;
	}

	@Override
	public boolean checkNameDuplicate(String name) {
		// TODO Auto-generated method stub
		return dao.checkNameDuplicate(name) > 0;
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
	public int deleteUser(String userId) {
		// TODO Auto-generated method stub
		return dao.deleteUser(userId);
	}

	@Override
	public LoginDTO login(LoginRequest req) {
		// TODO Auto-generated method stub
		return dao.login(req);
	}

	@Override
	public String findid(String name, String email, String phone) {
		// TODO Auto-generated method stub
		return dao.findid(name, email, phone);
	}

	@Override
	public int findpassword(String userId, String email, String phone) {
		// TODO Auto-generated method stub
		return dao.findpassword(userId, email, phone);
	}

	@Override
	public int updatepassword(String password, int loginNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
