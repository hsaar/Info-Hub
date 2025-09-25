package com.infohub.project.scraps;

public interface ScrapsService {
	
	int scrapsCount() throws Exception;
	int scrapsCheck(int article_articleId) throws Exception;
	int scrapsInsert(int article_articleId) throws Exception;
	int scrapsDelete(int article_articleId) throws Exception;

}
