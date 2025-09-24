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
        List<CategoryVO> list = dao.selectMainCategories();
        System.out.println("[Service] MainCategories = " + list);
        return list;
    }

    @Override
    public List<CategoryVO> getSubCategories(int parentId) {
        List<CategoryVO> list = dao.selectSubCategories(parentId);
        System.out.println("[Service] parentId = " + parentId);
        return list;
    }
	}



