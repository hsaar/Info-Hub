package com.infohub.project.openapi;

import java.util.*;
import java.util.stream.Collectors;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.infohub.project.article.ArticleVO;
import com.infohub.project.article.SiteIndexService;
import com.infohub.project.login.LoginDTO;
import com.infohub.project.login.LoginService;

@RestController
@RequestMapping("/news")
public class NaverController {

    private final NaverApiService naverApiService;
    private final LoginService loginService;
    private final ElasticsearchService esService;
    private final SiteIndexService siService;

    @Autowired
    public NaverController(NaverApiService naverApiService, LoginService loginService, ElasticsearchService esService, SiteIndexService siService) {
        this.naverApiService = naverApiService;
        this.loginService = loginService;
        this.esService = esService;
        this.siService = siService;
        
    }

    @GetMapping("/test")
    public Map<String, Object> testNews(@RequestParam String keyword) {
        Map<String, Object> result = new LinkedHashMap<>();
        try {
            String jsonString = naverApiService.searchNews(keyword.trim());
            JSONObject json = new JSONObject(jsonString);
            result.put("data", json.toMap()); // 전체 JSON 그대로 반환
        } catch (Exception e) {
            result.put("error", "뉴스 불러오기 실패");
        }
        return result;
    }

    // --- 로그인 유저 관심 키워드 뉴스 ---
    @GetMapping("/titlesAndLinks")
    public Map<String, List<Map<String, String>>> getNewsTitlesAndLinks(HttpSession session, Model model) {
        String userId = (String) session.getAttribute("userId");
        if (userId == null)
            return Map.of("error", List.of(Map.of("title", "", "link", "")));

        LoginDTO user = loginService.getUserById(userId);
        if (user == null || user.getKeywords() == null || user.getKeywords().isEmpty())
            return Map.of("error", List.of(Map.of("title", "관심 키워드가 없습니다.", "link", "")));

        String[] keywords = user.getKeywords().split(",");
        Map<String, List<Map<String, String>>> result = new LinkedHashMap<>();

        for (String keyword : keywords) {
            try {
                String jsonString = naverApiService.searchNews(keyword.trim());
                JSONObject json = new JSONObject(jsonString);
                JSONArray items = json.getJSONArray("items");

                List<Map<String, String>> newsList = items.toList().stream()
                        .map(o -> {
                            Map<?, ?> map = (Map<?, ?>) o;
                            Map<String, String> newsItem = new HashMap<>();
                            newsItem.put("title", map.get("title").toString());
                            newsItem.put("link", map.get("link").toString());
                            return newsItem;
                        })
                        .collect(Collectors.toList());

                result.put(keyword.trim(), newsList);

            } catch (Exception e) {
                result.put(keyword.trim(), List.of(Map.of("title", "뉴스 불러오기 실패", "link", "")));
            }
        }

        return result;
    }

    // --- Elasticsearch 검색 (실제 + 더미) ---
    @GetMapping("/elasticsearch")
    public Map<String, Object> searchElasticsearch(@RequestParam String keyword) {
        Map<String, Object> result = new LinkedHashMap<>();
        try {
            List<Map<String, Object>> hits = esService.searchByKeyword("news_index", keyword);

            // 🔹 ES 결과 없으면 테스트용 더미 5개 생성
            if (hits == null || hits.isEmpty()) {
                hits = new ArrayList<>();
                for (int i = 1; i <= 5; i++) {
                    Map<String, Object> dummy = new HashMap<>();
                    dummy.put("title", "테스트 뉴스 " + i + " (" + keyword + ")");
                    dummy.put("link", "https://example.com/news/" + i);
                    hits.add(dummy);
                }
            }

            // title + link 형태로 가공
            List<Map<String, String>> newsList = hits.stream().map(hit -> {
                Map<String, String> map = new HashMap<>();
                map.put("title", hit.get("title").toString());
                map.put("link", hit.get("link").toString());
                return map;
            }).toList();

            result.put("data", newsList);

        } catch (Exception e) {
            e.printStackTrace();
            // 🔹 ES 실패 시 더미 반환
            List<Map<String, String>> dummyData = new ArrayList<>();
            for (int i = 1; i <= 5; i++) {
                Map<String, String> dummy = new HashMap<>();
                dummy.put("title", "테스트 뉴스 " + i + " (" + keyword + ")");
                dummy.put("link", "https://example.com/news/" + i);
                dummyData.add(dummy);
            }
            result.put("data", dummyData);
            result.put("error", "Elasticsearch 검색 실패 (테스트 데이터 제공)");
        }

        return result;
    }
    
}
