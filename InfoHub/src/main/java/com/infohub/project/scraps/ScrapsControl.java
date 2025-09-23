package com.infohub.project.scraps;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class ScrapsControl {
	
	@Autowired
	ScrapsService service;
	
	@GetMapping("scrapsCount")
	public String scrapsCount(Model model) throws Exception {
		
		int scrapsCount = service.scrapsCount();
			model.addAttribute("scrapsCount", scrapsCount);
		
		return "scrapsCount";
	}
	
	@ResponseBody
	@PostMapping("scrapCheck")
	public int scrapCount(int article_article_id) throws Exception {
		System.out.println("scrap");
		
		int scrapCheck = service.scrapsCheck(article_article_id);
		
		return scrapCheck;
	}
	
	@ResponseBody
	@PostMapping("scrap")
	public int scrap(int article_article_id) throws Exception {
		System.out.println("scrap");
		
		int scrap = service.scrapsCheck(article_article_id);
		if (scrap==0) {
			service.scrapsInsert(article_article_id);
		}else if(scrap==1) {
			service.scrapsDelete(article_article_id);
		}
		return scrap;
	}
	
	

}
