package com.infohub.project.article_categories;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class article_categoriesDAOImpl implements article_categoriesDAO{

	@Autowired
	SqlSession sqlSession;
	
	private static final String nameSpace="com.infohub.project.article_categoriesMapper";
	
	@Override
	public List<article_categoriesDTO> article_categorieslistAll() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".article_categorieslistAll");
		
		
	}

}
