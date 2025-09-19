package com.infohub.project.article_search;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class article_searchDAOImpl implements article_searchDAO{

	@Autowired
	SqlSession sqlSession;
	
	private static final String nameSpace="com.infohub.project.articleMapper";
	
	@Override
	public List<article_searchDTO> articlelistAll() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".articlel_search");
		
		
	}

}
