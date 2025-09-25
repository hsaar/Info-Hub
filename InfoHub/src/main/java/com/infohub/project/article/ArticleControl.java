package com.infohub.project.article;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.infohub.project.HomeController;


@Controller
public class ArticleControl {
	
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	ArticleService service;
	
	
	@RequestMapping("articleListAll")
	public String articleListAll(Model model, Criteria cri) throws Exception{
		logger.info("articleListAll..");
		
		List<ArticleVO> articleListAll = service.articlListAll(cri);
		model.addAttribute("articleListAll", articleListAll);
		
		int total = service.getTotal();
		
		PageMakeVO pageMake = new PageMakeVO(cri, total);
		model.addAttribute("pageMake", pageMake);
		
		return "article/articleListAll";
	}
	
	@RequestMapping("articleListAll1")
	public String articleListAll1(Model model) throws Exception{
		logger.info("articleListAll1..");
		
		List<ArticleVO> articleListAll1 = service.articlListAll1();
		model.addAttribute("articleListAll1", articleListAll1);
		
		return "article/articleListAll1";
	}
	
	@RequestMapping("articleListAll2")
	public String articleListAll2(Model model) throws Exception{
		logger.info("articleListAll2..");
		
		List<ArticleVO> articleListAll2 = service.articlListAll2();
		model.addAttribute("articleListAll2", articleListAll2);
		
		return "article/articleListAll2";
	}
	
	@RequestMapping("articleListAll3")
	public String articleListAll3(Model model) throws Exception{
		logger.info("articleListAll3..");
		
		List<ArticleVO> articleListAll3 = service.articlListAll3();
		model.addAttribute("articleListAll3", articleListAll3);
		
		return "article/articleListAll3";
	}
	
	@RequestMapping("articleListAll4")
	public String articleListAll4(Model model) throws Exception{
		logger.info("articleListAll4..");
		
		List<ArticleVO> articleListAll4 = service.articlListAll4();
		model.addAttribute("articleListAll4", articleListAll4);
		
		return "article/articleListAll4";
	}
	
	@RequestMapping("articleListAll5")
	public String articleListAll5(Model model) throws Exception{
		logger.info("articleListAll5..");
		
		List<ArticleVO> articleListAll5 = service.articlListAll5();
		model.addAttribute("articleListAll5", articleListAll5);
		
		return "article/articleListAll5";
	}
	
	@RequestMapping("articleContent")
	public String articleContent(Model model, int articleId) throws Exception{
		logger.info("articleContent..");
		
		List<ArticleVO> articleContent = service.articleContent(articleId);
		model.addAttribute("articleContent", articleContent);
		
		return "article/articleContent";
	}
	
	@ResponseBody
	@PostMapping("countHearts")
	public int countHearts(int articleId) throws Exception {
		System.out.println("countHearts");
		
		int countHearts = service.countHearts(articleId);
		
		return countHearts;
	}
	

}
