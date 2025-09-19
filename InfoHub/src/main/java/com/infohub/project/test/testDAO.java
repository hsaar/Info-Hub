package com.infohub.project.test;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class testDAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	private static final String namespace = "com.infohub.project.testMapper";
	
	public int test() {
		return sqlsession.selectOne(namespace+".test");
	}
}
