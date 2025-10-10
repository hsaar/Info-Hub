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
	public List<RegistrationDTO> registrationlistAll(RegCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".registrationlistAll", cri);
	}

	@Override
	public List<RegistrationDTO> timelineListAll() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".timelineListAll");
	}

	@Override
	public List<RegistrationDTO> registrationContent(int registrationNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".registrationContent", registrationNo);
	}

	@Override
	public List<RegistrationDTO> noRegistrationContent(int registrationNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".registrationContent", registrationNo);
	}

	@Override
	public List<RegistrationDTO> myBenifit() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".myBenifit");
	}
	
	@Override
	public int getTotalCount(RegCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".gettotalcount", cri);
	}


}
