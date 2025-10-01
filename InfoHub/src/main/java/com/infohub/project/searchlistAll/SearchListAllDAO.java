package com.infohub.project.searchlistAll;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface SearchListAllDAO {
	int searchCount() throws Exception;
	List<SearchListAllDTO> searchlistAll() throws Exception;
}

