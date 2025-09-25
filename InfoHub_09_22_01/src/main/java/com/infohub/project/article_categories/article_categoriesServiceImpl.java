package com.infohub.project.article_categories;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class article_categoriesServiceImpl implements article_categoriesService {

	@Autowired
	article_categoriesDAO dao;
	
	
	@Override
	public List<article_categoriesDTO> article_categorieslistAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.article_categorieslistAll();
	}

}
