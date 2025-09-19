package com.infohub.project.article_categories;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Article_categoriesServiceImpl implements Article_categoriesService{
	
	@Autowired
	Article_categoriesDAO dao;

	@Override
	public List<Article_categoriesVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.listAll();
	}
	
	

}
