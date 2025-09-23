package com.infohub.project.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryServiceImpl implements CategoryService{
	@Autowired
	private CategoryDAO dao;

	    @Override
	    public List<CategoryVO> getMainCategories() {
	        return dao.selectMainCategories();
	    }

	    @Override
	    public List<CategoryVO> getSubCategories(int parentId) {
	        return dao.selectSubCategories(parentId);
	    }
	}



