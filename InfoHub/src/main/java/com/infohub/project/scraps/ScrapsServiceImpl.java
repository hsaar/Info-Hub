package com.infohub.project.scraps;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ScrapsServiceImpl implements ScrapsService {
	
	@Autowired
	ScrapsDAO dao;
	

	@Override
	public int scrapsCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.scrapsCount();
	}

	@Override
	public int scrapsCheck(int article_article_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.scrapsCheck(article_article_id);
	}

	@Override
	public int scrapsInsert(int article_article_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.scrapsInsert(article_article_id);
	}

	@Override
	public int scrapsDelete(int article_article_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.scrapsDelete(article_article_id);
	}
	
	

}
