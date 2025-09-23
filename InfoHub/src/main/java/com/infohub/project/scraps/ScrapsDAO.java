package com.infohub.project.scraps;

public interface ScrapsDAO {
	
	int scrapsCount() throws Exception;
	int scrapsCheck(int article_article_id) throws Exception;
	int scrapsInsert(int article_article_id) throws Exception;
	int scrapsDelete(int article_article_id) throws Exception;

}
