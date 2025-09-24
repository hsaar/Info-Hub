package com.infohub.project.article;

import java.util.List;

public interface ArticleDAO {
	
	List<ArticleVO> articlListAll() throws Exception;
	List<ArticleVO> articlListAll1() throws Exception;
	List<ArticleVO> articlListAll2() throws Exception;
	List<ArticleVO> articlListAll3() throws Exception;
	List<ArticleVO> articlListAll4() throws Exception;
	List<ArticleVO> articlListAll5() throws Exception;
	
	List<ArticleVO> articleContent(int article_id) throws Exception;
	
	public void updateViews(int article_id) throws Exception;
	
	public void updateHearts(int article_id) throws Exception;
	public void cancleHearts(int article_id) throws Exception;
	int countHearts(int article_id) throws Exception;
	
	

	
}
