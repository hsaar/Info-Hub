package com.infohub.project.article_categories;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Article_categoriesDAOImpl implements Article_categoriesDAO{
	
	@Autowired
	SqlSession session;
	//private static final String nameSpace = "com.infohub.project.infoHubMapper";

	@Override
	public List<Article_categoriesVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("com.infohub.project.infoHubMapper.listAll");
	}
	
	

	

	


	
	

}
