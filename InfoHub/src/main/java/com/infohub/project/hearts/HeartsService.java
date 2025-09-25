package com.infohub.project.hearts;

public interface HeartsService {
	
	int articleHearts(int article_articleId) throws Exception;
	int heartsCount(int article_articleId) throws Exception;
	int heartsCheck(int article_articleId) throws Exception;
	int heartsInsert(int article_articleId) throws Exception;
	int heartsDelete(int article_articleId) throws Exception;

}
