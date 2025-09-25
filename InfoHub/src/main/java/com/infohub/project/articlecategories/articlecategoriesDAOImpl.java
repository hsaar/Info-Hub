package com.infohub.project.articlecategories;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class articlecategoriesDAOImpl implements articlecategoriesDAO{

	@Autowired
	SqlSession sqlSession;
	
	private static final String nameSpace="com.infohub.project.infoHubMapper";
	

	@Override
	public List<ArticlecategoriesVO> articlecategorieslistAll() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".listAll");
	}

}
