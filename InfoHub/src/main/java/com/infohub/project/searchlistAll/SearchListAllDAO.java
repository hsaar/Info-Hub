package com.infohub.project.searchlistAll;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface SearchListAllDAO {
	public List<SearchListAllDTO> slistPage(Criteria cri) throws Exception;
	public List<SearchListAllDTO> read(int articleId) throws Exception;
	public int getTotalCount(Criteria cri)throws Exception;
//	List<SearchListAllDTO> searchlistAll() throws Exception;
//	public List<SearchListAllDTO> listCriteria(Criteria cri) throws Exception;
//	public int countPaging(Criteria cri)throws Exception;
}

