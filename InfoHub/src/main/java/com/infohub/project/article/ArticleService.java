package com.infohub.project.article;

import java.util.List;

import com.infohub.project.article.Criteria;

public interface ArticleService {
	
	List<ArticleVO> articlListAll(Criteria cri) throws Exception;
	List<ArticleVO> articlListAll1(Criteria cri) throws Exception;
	List<ArticleVO> articlListAll2(Criteria cri) throws Exception;
	List<ArticleVO> articlListAll3(Criteria cri) throws Exception;
	List<ArticleVO> articlListAll4(Criteria cri) throws Exception;
	List<ArticleVO> articlListAll5(Criteria cri) throws Exception;
	List<ArticleVO> articlListAll6(Criteria cri) throws Exception;

	List<ArticleVO> articleContent(int articleId) throws Exception;
	
	int countHearts(int articleId) throws Exception;
	
	public List<ArticleVO> result(int articleId) throws Exception;
	public int getTotalCount(Criteria cri)throws Exception;	
	
	List<ArticleVO> noArticleContent(int articleId) throws Exception;
	
	List<ArticleVO> viewsArticle() throws Exception;
	
	List<ArticleVO> findAllArticles() throws Exception;
	
	
}
