package com.infohub.project.category;

import java.util.List;

public interface CategoryDAO {
	
    List<CategoryVO> selectMainCategories();
    List<CategoryVO> selectSubCategories(int parentId);
}
