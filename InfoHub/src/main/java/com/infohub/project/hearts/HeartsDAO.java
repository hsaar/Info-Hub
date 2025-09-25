package com.infohub.project.hearts;

public interface HeartsDAO {
	
	int heartsCount(int article_articleId) throws Exception;
	int articleHearts(int article_articleId) throws Exception;
	int heartsCheck(int article_articleId) throws Exception;
	int heartsInsert(int article_articleId) throws Exception;
	int heartsDelete(int article_articleId) throws Exception;

}
