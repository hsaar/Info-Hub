package com.infohub.project.article_search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infohub.project.article_search.article_searchDTO;

@Service
public class article_searchServiceImpl implements article_searchService {

	@Autowired
	article_searchDAO dao;

	
	@Override
	public List<article_searchDTO> slistPage(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.slistPage(cri);
	}
	
	@Override
	public List<article_searchDTO> read(String title) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(title);
	}
	
	@Override
	public int getTotalCount(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.getTotalCount(cri);
	}

}
