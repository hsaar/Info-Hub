package com.infohub.project.hearts;

public interface HeartsService {
	
	int articleHearts(int article_article_id) throws Exception;
	int heartsCount(int article_article_id) throws Exception;
	int heartsCheck(int article_article_id) throws Exception;
	int heartsInsert(int article_article_id) throws Exception;
	int heartsDelete(int article_article_id) throws Exception;

}
