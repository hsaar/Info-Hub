package com.infohub.project.article_search;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface article_searchDAO {
	List<article_searchDTO> articlelistAll() throws Exception;
}
