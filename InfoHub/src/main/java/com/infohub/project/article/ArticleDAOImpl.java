package com.infohub.project.article;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infohub.project.article.Criteria;

@Repository
public class ArticleDAOImpl implements ArticleDAO{
	
	@Autowired
	SqlSession session;
	//private static final String nameSpace = "com.infohub.project.infoHubMapper";

	private final static String nameSpace = "com.infohub.project.articleMapper";
	
	
	@Override
	public List<ArticleVO> articlListAll(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(nameSpace + ".articleListAll", cri);
	}
	
	@Override
	public List<ArticleVO> articlListAll1() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(nameSpace + ".articleListAll1");
	}

	@Override
	public List<ArticleVO> articlListAll2() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(nameSpace + ".articleListAll2");
	}

	@Override
	public List<ArticleVO> articlListAll3() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(nameSpace + ".articleListAll3");
	}

	@Override
	public List<ArticleVO> articlListAll4() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(nameSpace + ".articleListAll4");
	}

	@Override
	public List<ArticleVO> articlListAll5() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(nameSpace + ".articleListAll5");
	}

	@Override
	public List<ArticleVO> articleContent(int articleId) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(nameSpace + ".articleContent", articleId);
	
	}

	@Override
	public void updateViews(int articleId) throws Exception{
		// TODO Auto-generated method stub
		session.update(nameSpace +".updateViews",articleId);
	}

	@Override
	public void updateHearts(int articleId) throws Exception {
		// TODO Auto-generated method stub
		session.update(nameSpace + ".updateHearts",articleId);
	}

	@Override
	public void cancleHearts(int articleId) throws Exception {
		// TODO Auto-generated method stub
		session.update(nameSpace + ".cancleHearts",articleId);
	}

	@Override
	public int countHearts(int articleId) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(nameSpace + ".countHearts",articleId);
	}


	@Override
	public List<ArticleVO> result(int articleId) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(nameSpace + ".read", articleId);
	}

	@Override
	public int getTotalCount(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(nameSpace + ".gettotalcount", cri);
	}

}
