package com.infohub.project.openapi;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import org.apache.commons.text.StringEscapeUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

import com.mysql.cj.xdevapi.JsonArray;

@Service
public class NaverApiService {
    private static final String API_URL = "https://openapi.naver.com/v1/search/news.json?query=";
    
    private final WebClient webClient;
    
    @Autowired
    public NaverApiService(WebClient webClient) {
    	this.webClient = webClient;
    }
    
    public String searchNews(String query) {
    	String rawJson = webClient.get().uri(uriBuilder -> uriBuilder.path("/search/news.json").queryParam("query", query).queryParam("display", 10).build())
    			.retrieve().bodyToMono(String.class).block();
    	
        JSONObject json = new JSONObject(rawJson);
        JSONArray items = json.getJSONArray("items");
        
        for (int i = 0; i < items.length(); i++) {
			JSONObject item = items.getJSONObject(i);
			
			String title = cleanText(item.optString("title"));
			String description = cleanText(item.optString("description"));
			
			item.put("title", title);
			item.put("description", description);
		}
        
        return json.toString();
    }
    
    private String cleanText(String raw) {
    	if(raw ==null) return "";
    	
    	String unescaped = StringEscapeUtils.unescapeHtml4(StringEscapeUtils.unescapeJava(raw));
    	
    	String decoded;
    	try {
			decoded = URLDecoder.decode(unescaped,StandardCharsets.UTF_8.name());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			decoded = unescaped;
		}
    	
    	return Jsoup.parse(decoded).text().trim();
    }
    
    
}
