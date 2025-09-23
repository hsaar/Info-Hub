package com.infohub.project.category;

import java.util.List;

public interface CategoryService {
    List<CategoryVO> getMainCategories();
    List<CategoryVO> getSubCategories(int parentId);

}
