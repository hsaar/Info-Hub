package com.infohub.project.article_categories;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface article_categoriesDAO {
	List<article_categoriesDTO> article_categorieslistAll() throws Exception;
}
