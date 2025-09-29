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
	public LoginDTO getUserById(String userId) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".getUserById",userId);
	}

	@Override
	public LoginDTO getUserByname(String name) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".getUserByname", name);
	}

	@Override
	public int checkuserIdDuplicate(String userId) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".checkuserIdDuplicate", userId);
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
	public int deleteUser(String userId) {
		// TODO Auto-generated method stub
		return sqlsession.update(namespace+".deleteUser", userId);
	}

	@Override
	public LoginDTO login(LoginRequest req) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".login",req);
	}

}
