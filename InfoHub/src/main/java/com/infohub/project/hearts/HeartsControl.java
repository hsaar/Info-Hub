package com.infohub.project.hearts;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.infohub.project.article.ArticleDAO;
import com.infohub.project.article.ArticleService;


@RestController
public class HeartsControl {
	
	@Autowired
	HeartsService service;
	
	@Autowired
	ArticleDAO articleDAO;
	
	@ResponseBody
	@PostMapping("articleHearts")
	public int articleHearts(int article_articleId) throws Exception {
		System.out.println("articleHearts");
		
		int articleHearts = service.articleHearts(article_articleId);
		
		return articleHearts;
	}
	
	@ResponseBody
	@PostMapping("heartsCheck")
	public int heartsCheck(HeartsVO heartsVO) throws Exception {
		System.out.println("heartsCheck");
		
		int heartsCheck = service.heartsCheck(heartsVO);
		//service.heartsCount(article_article_id);
		
		return heartsCheck;
	}
	
	@ResponseBody
	@PostMapping("heart")
	public int heart(HeartsVO heartsVO, int article_articleId) throws Exception {
		System.out.println("heart");
		
		int heart = service.heartsCheck(heartsVO);
		if (heart==0) {
			service.heartsInsert(heartsVO);
			articleDAO.updateHearts(article_articleId);
		}else if(heart==1) {
			service.heartsDelete(heartsVO);
			articleDAO.cancleHearts(article_articleId);
		}
		return heart;
	}
	
}
