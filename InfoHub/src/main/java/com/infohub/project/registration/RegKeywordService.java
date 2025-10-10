package com.infohub.project.registration;

import java.util.List;

public interface RegKeywordService {

	int countKeyword(int regsearchId) throws Exception;
	public int insertKeyword(RegKeywordDTO regKeywordDTO) throws Exception;
	public void logAndCountKeyword(String regkeyword) throws Exception;
	public List<RegKeywordDTO> findTop7() throws Exception;
}
