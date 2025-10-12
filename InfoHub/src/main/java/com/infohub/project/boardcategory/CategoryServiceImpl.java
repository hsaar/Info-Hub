package com.infohub.project.boardcategory;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infohub.project.boardcategory.CategoryVO;

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
	
	@Override
	public CategoryVO getMainCategoryById(int categoryId) {
        System.out.println("[Service] MainCategoryById = " + categoryId);
        return dao.selectMainCategoryById(categoryId);
	}



}



