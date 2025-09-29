package com.infohub.project.registration;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RegistrationDAOImpl implements RegistrationDAO{

	@Autowired
	SqlSession sqlSession;
	
	private static final String nameSpace="com.infohub.project.registrationMapper";
	
	@Override
	public List<RegistrationDTO> registrationlistAll() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".registrationlistAll");
	}

	@Override
	public List<RegistrationDTO> timelineListAll() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".timelineListAll");
	}

}
