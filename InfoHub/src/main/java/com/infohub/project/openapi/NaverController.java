package com.infohub.project.openapi;

import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/naver")
public class NaverController {
	
	private final NaverApiService naverApiService;
	private NaverTextUtil naverTextUtil;
	
	@Autowired
	public NaverController(NaverApiService naverApiExample) {
		this.naverApiService = naverApiExample;
	}
	
	@GetMapping(value = "/news", produces = "application/json; charset=UTF-8")
	public String searchBlog(@RequestParam String query){
		
		return naverApiService.searchNews(query);
	}
}
