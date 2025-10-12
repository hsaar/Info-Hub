package com.infohub.project.boardcategory;

import java.util.List;

import com.infohub.project.boardcategory.CategoryVO;

public interface CategoryDAO {
	
	
    List<CategoryVO> selectMainCategories();
    List<CategoryVO> selectSubCategories(int parentId);
    CategoryVO selectMainCategoryById(int categoryId);
}
