package com.infohub.project.article;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.infohub.project.openapi.ElasticsearchService;

@RestController
public class ArticleElasticsearchController {

    @Autowired
    private ArticleIndexService indexService;

    @Autowired
    private ElasticsearchService esService;

    @GetMapping("/news/indexAll")
    public Map<String, Object> indexAllArticles() throws Exception{
        indexService.indexAllArticles();
        Map<String, Object> result = new HashMap<>();
        result.put("status", "success");
        result.put("message", "DB 기사 전체 색인 완료!");
        return result;
    }

    // 🔹 검색 테스트
    @GetMapping("/news/search")
    public List<Map<String, Object>> search(@RequestParam String keyword) {
        return esService.searchByKeyword("news_index", keyword);
    }
    
    
}
