package com.infohub.project.boardcategory;

import java.util.List;

import com.infohub.project.boardcategory.CategoryVO;

public interface CategoryService {
    List<CategoryVO> getMainCategories();
    List<CategoryVO> getSubCategories(int parentId);
    CategoryVO getMainCategoryById(int categoryId);

}
