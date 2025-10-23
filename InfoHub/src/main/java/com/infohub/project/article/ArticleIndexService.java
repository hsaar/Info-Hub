package com.infohub.project.article;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infohub.project.openapi.ElasticsearchService;

@Service
public class ArticleIndexService {

    @Autowired
    private ElasticsearchService esService;

    @Autowired
    private ArticleService asService; // DB에서 기사 가져오는 Repository

    // DB 기사 전체 색인
    public void indexAllArticles() throws Exception {
        List<ArticleVO> articles = asService.elasticArticles(); // DB에서 전체 기사
        for (ArticleVO article : articles) {

          boolean success = esService.indexOrUpdateArticle("news_index", article);
          	if (!success) {
          		System.err.println("색인/업데이트 실패: articleId=" + article.getArticleId());
            }
        }
    }
}
