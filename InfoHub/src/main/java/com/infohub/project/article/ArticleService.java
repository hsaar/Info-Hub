package com.infohub.project.article;

import java.util.List;

import com.infohub.project.article.Criteria;

public interface ArticleService {
	
	List<ArticleVO> articlListAll(Criteria cri) throws Exception;
	List<ArticleVO> articlListAll1() throws Exception;
	List<ArticleVO> articlListAll2() throws Exception;
	List<ArticleVO> articlListAll3() throws Exception;
	List<ArticleVO> articlListAll4() throws Exception;
	List<ArticleVO> articlListAll5() throws Exception;

	List<ArticleVO> articleContent(int articleId) throws Exception;
	
	int countHearts(int articleId) throws Exception;
	
	public List<ArticleVO> result(int articleId) throws Exception;
	public int getTotalCount(Criteria cri)throws Exception;	
	
}
