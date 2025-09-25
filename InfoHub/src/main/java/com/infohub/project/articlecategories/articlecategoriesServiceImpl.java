package com.infohub.project.articlecategories;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class articlecategoriesServiceImpl implements articlecategoriesService {

	@Autowired
	articlecategoriesDAO dao;
	
	
	@Override
	public List<ArticlecategoriesVO> articlecategorieslistAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.articlecategorieslistAll();
	}

}
