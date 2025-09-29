package com.infohub.project.registration;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.infohub.project.HomeController;
import com.infohub.project.article.ArticleService;
import com.infohub.project.article.ArticleVO;

@Controller
public class RregistrationControl { 
	
	private static final Logger logger = LoggerFactory.getLogger(RregistrationControl.class);
	
	@Autowired
	private RegistrationService service;
	
	@Autowired
	ArticleService as;
	
	@RequestMapping("registrationlistAll")
	public String registrationlistAll(Model model) throws Exception{
		logger.info("전체조회");
		
		List<RegistrationDTO> registrationlistAll = service.registrationlistAll();
		model.addAttribute("registrationlistAll", registrationlistAll);
		
		List<ArticleVO> viewsArticle = as.viewsArticle();
		model.addAttribute("viewsArticle", viewsArticle);
		
		List<ArticleVO> keywordArticle = as.keywordArticle();
		model.addAttribute("keywordArticle", keywordArticle);

		return "article/registrationlistAll";
	}
	
	@RequestMapping("timeline")
	public String timelineListAll(Model model) throws Exception{
		logger.info("타임라인혜택 전체조회");
		
		List<RegistrationDTO> timeline = service.timelineListAll();
		model.addAttribute("timelineListAll", timeline);
		
		List<ArticleVO> viewsArticle = as.viewsArticle();
		model.addAttribute("viewsArticle", viewsArticle);
		
		List<ArticleVO> keywordArticle = as.keywordArticle();
		model.addAttribute("keywordArticle", keywordArticle);

		return "article/timeline";
	}
	
}