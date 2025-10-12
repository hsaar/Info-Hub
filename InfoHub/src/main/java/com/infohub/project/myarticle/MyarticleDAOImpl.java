package com.infohub.project.myarticle;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyarticleDAOImpl implements MyarticleDAO{

	@Autowired
	private SqlSession sqlsession;

	private static final String namespace = "com.infohub.project.myarticleMapper";
	
	@Override
	public List<MyarticleDTO> listAll(String keyword) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace+".mylistAll",keyword);
	}

	@Override
	public int count(String keyword) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".mycount",keyword);
	}

}
