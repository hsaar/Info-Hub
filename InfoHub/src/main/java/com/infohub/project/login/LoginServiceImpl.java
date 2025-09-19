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

}
