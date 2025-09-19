package com.infohub.project;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.infohub.project.test.testDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class MapperTest {
	@Autowired
	private SqlSession sqlsession;
	
	private static final String namespace = "com.infohub.project.testMapper";
	
	@Autowired
	testDAO dao = new testDAO();
	
	@Test
	public void test() {
		int str = sqlsession.selectOne(namespace+".test");
		System.out.println(dao.test());
	}
}
