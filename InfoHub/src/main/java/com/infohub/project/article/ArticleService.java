package com.infohub.project.article;

import java.util.List;

public interface ArticleService {
	
	List<ArticleVO> articlListAll() throws Exception;
	List<ArticleVO> articlListAll1() throws Exception;
	List<ArticleVO> articlListAll2() throws Exception;
	List<ArticleVO> articlListAll3() throws Exception;
	List<ArticleVO> articlListAll4() throws Exception;
	List<ArticleVO> articlListAll5() throws Exception;

	List<ArticleVO> articleContent(String title) throws Exception;
	
}
