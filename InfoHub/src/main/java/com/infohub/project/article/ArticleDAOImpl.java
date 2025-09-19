package com.infohub.project.article;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ArticleDAOImpl implements ArticleDAO{
	
	@Autowired
	SqlSession session;
	//private static final String nameSpace = "com.infohub.project.infoHubMapper";

	@Override
	public List<ArticleVO> articlListAll() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("com.infohub.project.articleMapper.articleListAll");
	}
	
	@Override
	public List<ArticleVO> articlListAll1() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("com.infohub.project.articleMapper.articleListAll1");
	}

	@Override
	public List<ArticleVO> articlListAll2() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("com.infohub.project.articleMapper.articleListAll2");
	}

	@Override
	public List<ArticleVO> articlListAll3() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("com.infohub.project.articleMapper.articleListAll3");
	}

	@Override
	public List<ArticleVO> articlListAll4() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("com.infohub.project.articleMapper.articleListAll4");
	}

	@Override
	public List<ArticleVO> articlListAll5() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("com.infohub.project.articleMapper.articleListAll5");
	}

	@Override
	public List<ArticleVO> articleContent(String title) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("com.infohub.project.articleMapper.articleContent", title);
	
	}

	@Override
	public void updateViews(String title) throws Exception{
		// TODO Auto-generated method stub
		session.update("com.infohub.project.articleMapper.updateViews", title);
	}



}
