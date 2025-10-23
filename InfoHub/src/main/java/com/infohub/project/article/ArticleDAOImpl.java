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

	private final static String nameSpace = "com.infohub.project.articleMapper";
	
	
	@Override
	public List<ArticleVO> articlListAll(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(nameSpace + ".articleListAll", cri);
	}
	
	@Override
	public List<ArticleVO> articlListAll1(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(nameSpace + ".articleListAll1", cri);
	}

	@Override
	public List<ArticleVO> articlListAll2(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(nameSpace + ".articleListAll2", cri);
	}

	@Override
	public List<ArticleVO> articlListAll3(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(nameSpace + ".articleListAll3", cri);
	}

	@Override
	public List<ArticleVO> articlListAll4(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(nameSpace + ".articleListAll4", cri);
	}

	@Override
	public List<ArticleVO> articlListAll5(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(nameSpace + ".articleListAll5", cri);
	}
	
	@Override
	public List<ArticleVO> articlListAll6(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(nameSpace + ".articleListAll6", cri);
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

	@Override
	public List<ArticleVO> noArticleContent(int articleId) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(nameSpace + ".articleContent", articleId);
	}

	@Override
	public List<ArticleVO> viewsArticle() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(nameSpace + ".viewsArticle");
	}

	@Override
	public List<ArticleVO> findAllArticles() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(nameSpace + ".findAllArticles");
	}

	@Override
	public int getTotalCountByCategory(int articlecategories_categoriesNo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(nameSpace + ".getTotalCountByCategory", articlecategories_categoriesNo);
	}

	@Override
	public List<ArticleVO> elasticArticles() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(nameSpace + ".elasticArticles");
	}

	

}
