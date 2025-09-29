package com.infohub.project.hearts;

public interface HeartsDAO {
	
	int heartsCount(int article_articleId) throws Exception;
	int articleHearts(int article_articleId) throws Exception;
	int heartsCheck(HeartsVO heartsVO) throws Exception;
	int heartsInsert(HeartsVO heartsVO) throws Exception;
	int heartsDelete(HeartsVO heartsVO) throws Exception;

}
