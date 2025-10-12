package com.infohub.project.article;

import java.util.List;

public interface KeywordService {

	int countKeyword(int searchId) throws Exception;
	public int insertKeyword(KeywordDTO KeywordDTO) throws Exception;
	public void logAndCountKeyword(String skeyword) throws Exception;
	public List<KeywordDTO> findTop7() throws Exception;
}
