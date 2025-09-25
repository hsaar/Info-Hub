package com.infohub.project.article;

import java.util.List;

public interface ArticleDAO {
	
	List<ArticleVO> articlListAll(Criteria cri) throws Exception;
	List<ArticleVO> articlListAll1() throws Exception;
	List<ArticleVO> articlListAll2() throws Exception;
	List<ArticleVO> articlListAll3() throws Exception;
	List<ArticleVO> articlListAll4() throws Exception;
	List<ArticleVO> articlListAll5() throws Exception;
	
	List<ArticleVO> articleContent(int articleId) throws Exception;
	
	public void updateViews(int articleId) throws Exception;
	
	public void updateHearts(int articleId) throws Exception;
	public void cancleHearts(int articleId) throws Exception;
	int countHearts(int articleId) throws Exception;
	
	public int getTotal();
	
}
