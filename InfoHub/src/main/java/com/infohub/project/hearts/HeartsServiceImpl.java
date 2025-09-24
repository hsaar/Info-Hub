package com.infohub.project.hearts;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HeartsServiceImpl implements HeartsService {
	
	@Autowired
	HeartsDAO dao;
	

	@Override
	public int heartsCount(int article_article_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.heartsCount(article_article_id);
	}

	@Override
	public int heartsCheck(int article_article_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.heartsCheck(article_article_id);
	}

	@Override
	public int heartsInsert(int article_article_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.heartsInsert(article_article_id);
	}

	@Override
	public int heartsDelete(int article_article_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.heartsDelete(article_article_id);
	}

	@Override
	public int articleHearts(int article_article_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.articleHearts(article_article_id);
	}
	
	

}
