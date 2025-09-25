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
	@PostMapping("scrapsCheck")
	public int scrapsCount(int article_articleId) throws Exception {
		System.out.println("scrapsCheck");
		
		int scrapsCheck = service.scrapsCheck(article_articleId);
		
		return scrapsCheck;
	}
	
	@ResponseBody
	@PostMapping("scrap")
	public int scrap(int article_articleId) throws Exception {
		System.out.println("scrap");
		
		int scrap = service.scrapsCheck(article_articleId);
		if (scrap==0) {
			service.scrapsInsert(article_articleId);
		}else if(scrap==1) {
			service.scrapsDelete(article_articleId);
		}
		return scrap;
	}
	

}
