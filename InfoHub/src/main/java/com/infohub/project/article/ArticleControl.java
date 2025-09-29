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
import com.infohub.project.article.PageMaker;


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
		
		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = service.getTotalCount(cri);
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("pageMaker", pageMaker);
		
		List<ArticleVO> viewsArticle = service.viewsArticle();
		model.addAttribute("viewsArticle", viewsArticle);
		
		return "article/articleListAll";
	}
	
	@RequestMapping("articleListAll1")
	public String articleListAll1(Model model, Criteria cri) throws Exception{
		logger.info("articleListAll1..");
		
		List<ArticleVO> articleListAll1 = service.articlListAll1(cri);
		model.addAttribute("articleListAll1", articleListAll1);
		
		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = service.getTotalCount(cri);
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("pageMaker", pageMaker);
		
		List<ArticleVO> viewsArticle = service.viewsArticle();
		model.addAttribute("viewsArticle", viewsArticle);
		
		return "article/articleListAll1";
	}
	
	@RequestMapping("articleListAll2")
	public String articleListAll2(Model model, Criteria cri) throws Exception{
		logger.info("articleListAll2..");
		
		List<ArticleVO> articleListAll2 = service.articlListAll2(cri);
		model.addAttribute("articleListAll2", articleListAll2);
		
		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = service.getTotalCount(cri);
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("pageMaker", pageMaker);
		
		List<ArticleVO> viewsArticle = service.viewsArticle();
		model.addAttribute("viewsArticle", viewsArticle);
		
		return "article/articleListAll2";
	}
	
	@RequestMapping("articleListAll3")
	public String articleListAll3(Model model, Criteria cri) throws Exception{
		logger.info("articleListAll3..");
		
		List<ArticleVO> articleListAll3 = service.articlListAll3(cri);
		model.addAttribute("articleListAll3", articleListAll3);
		
		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = service.getTotalCount(cri);
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("pageMaker", pageMaker);
		
		List<ArticleVO> viewsArticle = service.viewsArticle();
		model.addAttribute("viewsArticle", viewsArticle);
		
		return "article/articleListAll3";
	}
	
	@RequestMapping("articleListAll4")
	public String articleListAll4(Model model, Criteria cri) throws Exception{
		logger.info("articleListAll4..");
		
		List<ArticleVO> articleListAll4 = service.articlListAll4(cri);
		model.addAttribute("articleListAll4", articleListAll4);
		
		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = service.getTotalCount(cri);
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("pageMaker", pageMaker);
		
		List<ArticleVO> viewsArticle = service.viewsArticle();
		model.addAttribute("viewsArticle", viewsArticle);
		
		return "article/articleListAll4";
	}
	
	@RequestMapping("articleListAll5")
	public String articleListAll5(Model model, Criteria cri) throws Exception{
		logger.info("articleListAll5..");
		
		List<ArticleVO> articleListAll5 = service.articlListAll5(cri);
		model.addAttribute("articleListAll5", articleListAll5);
		
		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = service.getTotalCount(cri);
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("pageMaker", pageMaker);
		
		List<ArticleVO> viewsArticle = service.viewsArticle();
		model.addAttribute("viewsArticle", viewsArticle);
		
		return "article/articleListAll5";
	}
	
	@RequestMapping("articleContent")
	public String articleContent(Model model, int articleId) throws Exception{
		logger.info("articleContent..");
		
		List<ArticleVO> articleContent = service.articleContent(articleId);
		model.addAttribute("articleContent", articleContent);
		
		List<ArticleVO> viewsArticle = service.viewsArticle();
		model.addAttribute("viewsArticle", viewsArticle);
		
		return "article/articleContent";
	}
	
	@ResponseBody
	@PostMapping("countHearts")
	public int countHearts(int articleId) throws Exception {
		System.out.println("countHearts");
		
		int countHearts = service.countHearts(articleId);
		
		return countHearts;
	}
	
	@RequestMapping("article_result")
	public String result(int articleId, Model model) throws Exception {
			
		logger.info("read");
			
		List<ArticleVO> listSearchVO = service.result(articleId);
		
		model.addAttribute("listSearch", listSearchVO);
			
		logger.info(" article_result : " + listSearchVO);
		
		return "/article/article_result";
	}
	
	@RequestMapping("noArticleContent")
	public String noArticleContent(Model model, int articleId) throws Exception{
		logger.info("noArticleContent..");
		
		List<ArticleVO> noArticleContent = service.noArticleContent(articleId);
		model.addAttribute("noArticleContent", noArticleContent);
		
		List<ArticleVO> viewsArticle = service.viewsArticle();
		model.addAttribute("viewsArticle", viewsArticle);
		
		return "article/noArticleContent";
	}
	
	@RequestMapping("viewsArticle")
	public String viewsArticle(Model model) throws Exception{
		logger.info("viewsArticle..");
		
		List<ArticleVO> viewsArticle = service.viewsArticle();
		model.addAttribute("viewsArticle", viewsArticle);
		
		return "article/articleListAll";
	}
}
