package com.infohub.project.searchlistAll;

import java.util.List;

public interface SearchListAllService {
	int searchCount() throws Exception;
	List<SearchListAllDTO> searchlistAll() throws Exception;
	
}
