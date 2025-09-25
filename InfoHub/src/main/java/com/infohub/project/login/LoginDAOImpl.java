package com.infohub.project.login;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAOImpl implements LoginDAO{
	
	@Autowired
	private SqlSession sqlsession;

	private static final String namespace = "com.infohub.project.loginMapper";
	
	@Override
	public List<Object> listAll() {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace+".listAll");
	}

	@Override
	public LoginDTO getUserById(int login_id) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".getUserById",login_id);
	}

	@Override
	public LoginDTO getUserByUsername(String username) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".getUserByUsername", username);
	}

	@Override
	public int checkUsernameDuplicate(String username) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".checkUsernameDuplicate", username);
	}

	@Override
	public int checkNameDuplicate(String name) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".checkNameDuplicate", name);
	}

	@Override
	public int insertUser(LoginDTO dto) {
		// TODO Auto-generated method stub
		return sqlsession.insert(namespace+".insertUser", dto);
	}

	@Override
	public int updateUser(LoginDTO dto) {
		// TODO Auto-generated method stub
		return sqlsession.update(namespace+".updateUser", dto);
	}

	@Override
	public int deleteUser(String username) {
		// TODO Auto-generated method stub
		return sqlsession.update(namespace+".deleteUser", username);
	}

	@Override
	public LoginDTO login(LoginRequest req) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".login",req);
	}

}
