package com.infohub.project.openapi;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.infohub.project.article.ArticleService;
import com.infohub.project.article.ArticleVO;
import com.infohub.project.article.KeywordDTO;
import com.infohub.project.article.KeywordService;
import com.infohub.project.registration.RegKeywordService;

@Controller
public class PageController {
	
	@Autowired
	ArticleService service;
	
	@Autowired
	KeywordService keyservice;
	
	@Autowired
	RegKeywordService regKeyservice;

	@GetMapping("/newsSearch")
    public String newsSearchPage(Model model) throws Exception{
        // WEB-INF/views/article/newsSearch.jsp를 반환
		System.out.println("newsSearchPage 호출됨");
		
		List<ArticleVO> allArticles = service.findAllArticles();
		List<ArticleVO> randomTwo = new ArrayList<>();

		if (!allArticles.isEmpty()) {
		    Collections.shuffle(allArticles);
		    randomTwo = allArticles.size() >= 2 
		        ? new ArrayList<>(allArticles.subList(0, 2)) 
		        : new ArrayList<>(allArticles);
		}
		model.addAttribute("randomArticles", randomTwo);
		System.out.println(randomTwo);
		
		List<ArticleVO> viewsArticle = service.viewsArticle();
		model.addAttribute("viewsArticle", viewsArticle);
		System.out.println(viewsArticle);
		
		List<KeywordDTO> topKeywords = keyservice.findTop7();
		model.addAttribute("topKeywords", topKeywords);
		
		Date date = new Date();
		SimpleDateFormat isoFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		
		String formattedDate = isoFormat.format(date);
		
		model.addAttribute("formattedDate", formattedDate );
		
        return "article/newsSearch";
    }
}
