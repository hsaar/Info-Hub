package com.infohub.project.articlecategories;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface articlecategoriesDAO {
	List<ArticlecategoriesVO> articlecategorieslistAll() throws Exception;
}
