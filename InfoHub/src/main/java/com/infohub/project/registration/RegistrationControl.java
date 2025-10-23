package com.infohub.project.registration;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.infohub.project.registration.RegistrationDTO;

import com.infohub.project.HomeController;
import com.infohub.project.article.ArticleService;
import com.infohub.project.article.ArticleVO;

import com.infohub.project.registration.RegCriteria; 
import com.infohub.project.registration.RegPageMaker;

@Controller
public class RegistrationControl { 
	
	private static final Logger logger = LoggerFactory.getLogger(RegistrationControl.class);
	
	@Autowired
	private RegistrationService service;
	
	@Autowired
	ArticleService artservice;
	
	@Autowired
	RegKeywordService regKeyservice;
	
	 @RequestMapping("registrationlistAll")
	   public String registrationlistAll(Model model, RegCriteria cri) throws Exception{
	      logger.info("전체조회");
	      
	      List<RegistrationDTO> registrationlistAll = service.registrationlistAll(cri);
	      model.addAttribute("registrationlistAll", registrationlistAll);
	      
	      
	      List<ArticleVO> allArticles = artservice.findAllArticles();
			List<ArticleVO> randomTwo = new ArrayList<>();
			

			if (!allArticles.isEmpty()) {
			    Collections.shuffle(allArticles);
			    randomTwo = allArticles.size() >= 2 
			        ? new ArrayList<>(allArticles.subList(0, 2)) 
			        : new ArrayList<>(allArticles);
			}
			model.addAttribute("randomArticles", randomTwo);
			
			
	      RegPageMaker pageMaker = new RegPageMaker(cri);
	      int totalCount = service.getTotalCount(cri);
	      pageMaker.setTotalCount(totalCount);
	      model.addAttribute("pageMaker", pageMaker);
	      
	      List<ArticleVO> viewsArticle = artservice.viewsArticle();
	      model.addAttribute("viewsArticle", viewsArticle);
	      
	      List<RegKeywordDTO> topKeywords = regKeyservice.findTop7();
	      model.addAttribute("topKeywords", topKeywords);
	      
	      Date date = new Date();
			SimpleDateFormat isoFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
			
			String formattedDate = isoFormat.format(date);
			
			model.addAttribute("formattedDate", formattedDate );
	      
	      return "article/registrationlistAll";
	   }
	
	 	@ResponseBody
	    @PostMapping("logRegKeyword")
	    public int logRegKeyword(@RequestParam("keyword") String regkeyword) {
	        System.out.println("logRegKeyword AJAX 요청 수신 - 키워드: " + regkeyword);
	        try {
	            regKeyservice.logAndCountKeyword(regkeyword); 
	            return 1;
	        } catch (Exception e) {
	            System.err.println("혜택/정책 키워드 로깅 중 오류 발생: " + e.getMessage());
	            e.printStackTrace();
	            return 0;
	        }
	    }
	
	@Autowired
	ArticleService as;
	
	@RequestMapping("timeline")
	   public String timelineListAll(Model model) throws Exception{
	      logger.info("타임라인혜택 전체조회");
	      
	      List<RegistrationDTO> timeline = service.timelineListAll();
	      model.addAttribute("timelineListAll", timeline);
	      
	      
	      List<ArticleVO> allArticles = as.findAllArticles();
			List<ArticleVO> randomTwo = new ArrayList<>();
			

			if (!allArticles.isEmpty()) {
			    Collections.shuffle(allArticles);
			    randomTwo = allArticles.size() >= 2 
			        ? new ArrayList<>(allArticles.subList(0, 2)) 
			        : new ArrayList<>(allArticles);
			}
			model.addAttribute("randomArticles", randomTwo);
			
	      List<ArticleVO> viewsArticle = as.viewsArticle();
	      model.addAttribute("viewsArticle", viewsArticle);
	      
	      List<RegKeywordDTO> topKeywords = regKeyservice.findTop7();
	      model.addAttribute("topKeywords", topKeywords);
	      
	      Date date = new Date();
			SimpleDateFormat isoFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
			
			String formattedDate = isoFormat.format(date);
			
			model.addAttribute("formattedDate", formattedDate );

	      return "article/timeline";
	   }
	
	@RequestMapping("registrationContent")
	public String registrationContent(Model model, int registrationNo) throws Exception{
		logger.info("registrationContent..");
		
		List<RegistrationDTO> registrationContent = service.registrationContent(registrationNo);
		model.addAttribute("registrationContent", registrationContent);
		
		
		List<ArticleVO> allArticles = as.findAllArticles();
		List<ArticleVO> randomTwo = new ArrayList<>();
		

		if (!allArticles.isEmpty()) {
		    Collections.shuffle(allArticles);
		    randomTwo = allArticles.size() >= 2 
		        ? new ArrayList<>(allArticles.subList(0, 2)) 
		        : new ArrayList<>(allArticles);
		}
		model.addAttribute("randomArticles", randomTwo);
		
		
		List<ArticleVO> viewsArticle = as.viewsArticle();
		model.addAttribute("viewsArticle", viewsArticle);
		
		List<RegKeywordDTO> topKeywords = regKeyservice.findTop7();
		model.addAttribute("topKeywords", topKeywords);
		
		Date date = new Date();
		SimpleDateFormat isoFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		
		String formattedDate = isoFormat.format(date);
		
		model.addAttribute("formattedDate", formattedDate );
		
		return "article/registrationContent";
	}
	
	@RequestMapping("noRegistrationContent")
	public String noRegistrationContent(Model model, int registrationNo) throws Exception{
		logger.info("noRegistrationContent..");
		
		List<RegistrationDTO> noRegistrationContent = service.noRegistrationContent(registrationNo);
		model.addAttribute("noRegistrationContent", noRegistrationContent);
		
		
		List<ArticleVO> allArticles = as.findAllArticles();
		List<ArticleVO> randomTwo = new ArrayList<>();
		

		if (!allArticles.isEmpty()) {
		    Collections.shuffle(allArticles);
		    randomTwo = allArticles.size() >= 2 
		        ? new ArrayList<>(allArticles.subList(0, 2)) 
		        : new ArrayList<>(allArticles);
		}
		model.addAttribute("randomArticles", randomTwo);
		
		
		List<ArticleVO> viewsArticle = as.viewsArticle();
		model.addAttribute("viewsArticle", viewsArticle);
		
		List<RegKeywordDTO> topKeywords = regKeyservice.findTop7();
		model.addAttribute("topKeywords", topKeywords);
		
		Date date = new Date();
		SimpleDateFormat isoFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		
		String formattedDate = isoFormat.format(date);
		
		model.addAttribute("formattedDate", formattedDate );
		
		
		return "article/noRegistrationContent";
	}
	
	@RequestMapping("myBenifit")
	public String myBenifit(Model model) throws Exception{
		logger.info("myBenifit..");
		
		List<RegistrationDTO> myBenifit = service.myBenifit();
		model.addAttribute("myBenifit", myBenifit);
		
		return "customized/myBenifit";
	}
}