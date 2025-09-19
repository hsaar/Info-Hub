package com.infohub.project.article_search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class article_searchServiceImpl implements article_searchService {

	@Autowired
	article_searchDAO dao;
	
	
	@Override
	public List<article_searchDTO> articlelistAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.articlelistAll();
	}

}
