package com.infohub.project.searchlistAll;

import java.util.List;

public interface SearchListAllService {
	public List<SearchListAllDTO> slistPage(Criteria cri) throws Exception;
	public List<SearchListAllDTO> read(int articleId) throws Exception;
	public int getTotalCount(Criteria cri)throws Exception;	
//	List<SearchListAllDTO> searchlistAll() throws Exception;
//	public List<SearchListAllDTO> listCriteria(Criteria cri) throws Exception;
//	public int listCountCriteria(Criteria cri) throws Exception;
}

