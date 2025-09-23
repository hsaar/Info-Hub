package com.infohub.project.searchlistAll;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface SearchListAllDAO {
	int searchCount() throws Exception;
	List<SearchListAllDTO> searchlistAll() throws Exception;
	public List<SearchListAllDTO> listPage(Criteria cri) throws Exception;
	public int getTotalCount(Criteria cri)throws Exception;
	public SearchListAllDTO read(int article_id) throws Exception;
//	public List<SearchListAllDTO> listCriteria(Criteria cri) throws Exception;
//	public int countPaging(Criteria cri)throws Exception;
}

