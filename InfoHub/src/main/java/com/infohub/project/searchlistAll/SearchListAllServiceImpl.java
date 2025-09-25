package com.infohub.project.searchlistAll;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SearchListAllServiceImpl implements SearchListAllService {

	@Autowired
	SearchListAllDAO dao;

	
	@Override
	public List<SearchListAllDTO> slistPage(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.slistPage(cri);
	}
	
	@Override
	public List<SearchListAllDTO> read(int articleId) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(articleId);
	}
	
	@Override
	public int getTotalCount(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.getTotalCount(cri);
	}
	
	
//	@Override
//	public List<SearchListAllDTO> searchlistAll() throws Exception{ 
//		return dao.searchlistAll();
//	}
//	@Override
//	public List<SearchListAllDTO> listCriteria(Criteria cri) throws Exception {
//		// TODO Auto-generated method stub
//		return dao.listCriteria(cri);
//	}
//	
//	
//	@Override
//	public int listCountCriteria(Criteria cri) throws Exception {
//		// TODO Auto-generated method stub
//		return dao.countPaging(cri);
//	}
}



