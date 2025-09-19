package com.infohub.project.searchlistAll;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SearchListAllServiceImpl implements SearchListAllService {

	@Autowired
	SearchListAllDAO dao;
	

	@Override
	public int searchCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.searchCount();
	}
	
	
	@Override
	public List<SearchListAllDTO> searchlistAll() throws Exception{ 
	    return dao.searchlistAll();
	}



}


