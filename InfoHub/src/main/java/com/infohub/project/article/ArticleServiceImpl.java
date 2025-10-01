package com.infohub.project.article;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ArticleServiceImpl implements ArticleService{
	
	@Autowired
	ArticleDAO dao;

	@Override
	public List<ArticleVO> articlListAll(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.articlListAll(cri);
	}
	
	@Override
	public List<ArticleVO> articlListAll1() throws Exception {
		// TODO Auto-generated method stub
		return dao.articlListAll1();
	}

	@Override
	public List<ArticleVO> articlListAll2() throws Exception {
		// TODO Auto-generated method stub
		return dao.articlListAll2();
	}

	@Override
	public List<ArticleVO> articlListAll3() throws Exception {
		// TODO Auto-generated method stub
		return dao.articlListAll3();
	}

	@Override
	public List<ArticleVO> articlListAll4() throws Exception {
		// TODO Auto-generated method stub
		return dao.articlListAll4();
	}

	@Override
	public List<ArticleVO> articlListAll5() throws Exception {
		// TODO Auto-generated method stub
		return dao.articlListAll5();
	}

	@Override
	public List<ArticleVO> articleContent(int articleId) throws Exception {
		// TODO Auto-generated method stub
		dao.updateViews(articleId);
		return dao.articleContent(articleId);
	}

	@Override
	public int countHearts(int articleId) throws Exception {
		// TODO Auto-generated method stub
		return dao.countHearts(articleId);
	}

	@Override
	public List<ArticleVO> result(int articleId) throws Exception {
		// TODO Auto-generated method stub
		return dao.result(articleId);
	}

	@Override
	public int getTotalCount(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.getTotalCount(cri);
	}


}
