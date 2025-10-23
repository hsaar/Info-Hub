package com.infohub.project.login;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public String findid(String name, String email, String phone) {
		// TODO Auto-generated method stub
		Map<String , String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("email", email);
		map.put("phone", phone);
		return sqlsession.selectOne(namespace+".findid",map);
	}

	@Override
	public int findpassword(String userId, String email, String phone) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("email", email);
		map.put("phone", phone);
		return sqlsession.selectOne(namespace+".findpassword", map);
	}

	@Override
	public int updatepassword(String password, String userId) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("password", password);
		map.put("userId", userId);
		return sqlsession.update(namespace+".updatepassword", map);
	}

	@Override
	public String checkPasswordById(String userId) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".checkPasswordById", userId);
	}

	@Override
	public int updateKeywords(String userId, String keywords) {
		// TODO Auto-generated method stub
		Map<String , String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("keywords", keywords);
		Integer count = sqlsession.selectOne(namespace+".updateKeywords", map);
		int total = (count != null) ? count : 0;
		return total;
	}

	@Override
	public LoginDTO findByKakaoId(Long kakaoId) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace + ".findByKakaoId", kakaoId);
	}

	@Override
	public void insert(LoginDTO dto) {
		// TODO Auto-generated method stub
		sqlsession.insert(namespace + ".insert", dto);
	}

}
