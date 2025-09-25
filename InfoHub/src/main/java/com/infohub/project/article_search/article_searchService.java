package com.infohub.project.article_search;

import java.util.List;

import com.infohub.project.article_search.article_searchDTO;

public interface article_searchService {
	public List<article_searchDTO> slistPage(Criteria cri) throws Exception;
	public List<article_searchDTO> read(String title) throws Exception;
	public int getTotalCount(Criteria cri)throws Exception;	
}
