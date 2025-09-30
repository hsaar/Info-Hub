package com.infohub.project.hearts;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HeartsServiceImpl implements HeartsService {
	
	@Autowired
	HeartsDAO dao;
	

	@Override
	public int heartsCount(int article_articleId) throws Exception {
		// TODO Auto-generated method stub
		return dao.heartsCount(article_articleId);
	}

	@Override
	public int heartsCheck(HeartsVO heartsVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.heartsCheck(heartsVO);
	}

	@Override
	public int heartsInsert(HeartsVO heartsVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.heartsInsert(heartsVO);
	}

	@Override
	public int heartsDelete(HeartsVO heartsVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.heartsDelete(heartsVO);
	}

	@Override
	public int articleHearts(int article_articleId) throws Exception {
		// TODO Auto-generated method stub
		return dao.articleHearts(article_articleId);
	}
	
	

}
