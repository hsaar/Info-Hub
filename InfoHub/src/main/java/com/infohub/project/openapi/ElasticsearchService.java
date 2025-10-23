package com.infohub.project.openapi;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.SSLContext;


import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.conn.ssl.NoopHostnameVerifier;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.ssl.SSLContexts;
import org.apache.http.impl.client.CloseableHttpClient;

import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.infohub.project.article.ArticleVO;

import co.elastic.clients.elasticsearch.ingest.simulate.Document;

@Service
public class ElasticsearchService {

	private final RestTemplate restTemplate;
	

    public ElasticsearchService() {
        try {
            // 🔹 HTTPS + 기본 인증 세팅
            String username = "elastic"; // elastic 기본 계정
            String password = "ccaQ+nruS53M9X4E=*nb"; // 설치 시 발급된 비밀번호

            BasicCredentialsProvider credentialsProvider = new BasicCredentialsProvider();
            credentialsProvider.setCredentials(AuthScope.ANY,
                    new UsernamePasswordCredentials(username, password));

            SSLContext sslContext = SSLContexts.custom()
                    .loadTrustMaterial(null, (certificate, authType) -> true) // 인증서 무시
                    .build();

            CloseableHttpClient httpClient = HttpClients.custom()
                    .setSSLContext(sslContext)
                    .setSSLHostnameVerifier(NoopHostnameVerifier.INSTANCE)
                    .setDefaultCredentialsProvider(credentialsProvider)
                    .build();

            HttpComponentsClientHttpRequestFactory factory = new HttpComponentsClientHttpRequestFactory(httpClient);
            this.restTemplate = new RestTemplate(factory);

        } catch (Exception e) {
            throw new RuntimeException("RestTemplate 초기화 실패", e);
        }
    }

    // 🔹 색인 기능
    public boolean indexOrUpdateArticle(String index, ArticleVO article) {
        String url = "http://192.168.0.16:9200/" + index + "/_doc/" + article.getArticleId();
        try {
            // PUT 요청으로 문서 생성/업데이트
            restTemplate.put(url, article);
            return true;
        } catch (Exception e) {
            System.err.println("Elasticsearch 색인/업데이트 실패: " + e.getMessage());
            return false;
        }
    }

    // 🔹 검색 기능
    public List<Map<String, Object>> searchByKeyword(String index, String keyword) {
        String url = "http://192.168.0.16:9200/" + index + "/_search?q=title:" + keyword;

        try {
            Map<String, Object> response = restTemplate.getForObject(url, Map.class);

            if (response == null || !response.containsKey("hits")) {
                return Collections.emptyList();
            }

            Map<String, Object> hitsObj = (Map<String, Object>) response.get("hits");
            List<Map<String, Object>> hitsList = (List<Map<String, Object>>) hitsObj.get("hits");

            List<Map<String, Object>> results = new ArrayList<>();
            for (Map<String, Object> hit : hitsList) {
                results.add((Map<String, Object>) hit.get("_source"));
            }
            return results;

        } catch (Exception e) {
            System.err.println("Elasticsearch 연결 실패: " + e.getMessage());
            return Collections.emptyList();
        }
    }
    
    public List<Map<String, Object>> searchAll(String index) {
        String url = "http://192.168.0.16:9200/" + index + "/_search?size=1000"; // 최대 1000개 문서 가져오기
        try {
            Map<String, Object> response = restTemplate.getForObject(url, Map.class);

            if (response == null || !response.containsKey("hits")) {
                return Collections.emptyList();
            }

            Map<String, Object> hitsObj = (Map<String, Object>) response.get("hits");
            List<Map<String, Object>> hitsList = (List<Map<String, Object>>) hitsObj.get("hits");

            List<Map<String, Object>> results = new ArrayList<>();
            for (Map<String, Object> hit : hitsList) {
                results.add((Map<String, Object>) hit.get("_source"));
            }
            return results;

        } catch (Exception e) {
            System.err.println("Elasticsearch 전체 조회 실패: " + e.getMessage());
            return Collections.emptyList();
        }
    }
    
 // 🔹 검색 기능 (JSON match 쿼리 사용)
    public List<Map<String, Object>> searchByKeyword1(String index, String keyword) {
        
    	
    	String url = "http://192.168.0.16:9200/" + index + "/_search";

        // 부분 검색: query_string 사용
        Map<String, Object> query = Map.of(
            "query", Map.of(
                "query_string", Map.of(
                    "fields", List.of("name"),       // name 필드 검색
                    "query", "*" + keyword + "*"     // 와일드카드
                )
            )
        );

        try {
            Map<String, Object> response = restTemplate.postForObject(url, query, Map.class);

            if (response == null || !response.containsKey("hits")) {
                return Collections.emptyList();
            }

            Map<String, Object> hitsObj = (Map<String, Object>) response.get("hits");
            List<Map<String, Object>> hitsList = (List<Map<String, Object>>) hitsObj.get("hits");

            List<Map<String, Object>> results = new ArrayList<>();
            for (Map<String, Object> hit : hitsList) {
                results.add((Map<String, Object>) hit.get("_source"));
            }
            return results;

        } catch (Exception e) {
            System.err.println("Elasticsearch 검색 실패: " + e.getMessage());
            return Collections.emptyList();
        }
    }
    
    public void updateDocument(String index, String id, Map<String, Object> fields) {
        String url = "http://192.168.0.16:9200/" + index + "/_update/" + id;
        Map<String, Object> body = Map.of("doc", fields);

        RestTemplate restTemplate = new RestTemplate();
        restTemplate.postForObject(url, body, String.class);
    }
    
}