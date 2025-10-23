package com.infohub.project.article;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infohub.project.openapi.ElasticsearchService;

@Service
public class SiteIndexService {
	
	@Autowired
    private ElasticsearchService esService;
	
	public List<ArticleVO> getAllArticles() throws Exception {
        // Elasticsearch에서 Map 리스트 가져오기
        List<Map<String, Object>> maps = esService.searchAll("site_index");
        List<ArticleVO> articles = new ArrayList<>();

        for (Map<String, Object> map : maps) {
            ArticleVO article = new ArticleVO();

            // 🔹 articleId 변환 (null-safe + Number 처리)
            Object articleIdObj = map.get("articleId");
            article.setArticleId(articleIdObj != null ? ((Number) articleIdObj).intValue() : 0);

            // 🔹 title 변환 (null-safe)
            Object titleObj = map.get("title");
            article.setTitle(titleObj != null ? titleObj.toString() : "");

            // 🔹 link 변환 (null-safe)
            Object linkObj = map.get("link");
            article.setLink(linkObj != null ? linkObj.toString() : "");

            // 🔹 필요하면 다른 필드도 동일하게 처리
            // Object dateObj = map.get("date");
            // article.setDate(dateObj != null ? dateObj.toString() : "");

            articles.add(article);
        }

        return articles;
    }

}
