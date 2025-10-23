package com.infohub.project.article;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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
import com.infohub.project.registration.RegKeywordDTO;
import com.infohub.project.registration.RegKeywordService;


@Controller
public class ArticleControl {
	
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	ArticleService service;
	
	@Autowired
	KeywordService keyservice;
	
	@Autowired
	RegKeywordService regKeyservice;
	
	
	@RequestMapping("articleListAll")
	public String articleListAll(Model model, Criteria cri) throws Exception{
		logger.info("articleListAll..");
		
		List<ArticleVO> articleListAll = service.articlListAll(cri);
		model.addAttribute("articleListAll", articleListAll);
		
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

		
		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = service.getTotalCount(cri);
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("pageMaker", pageMaker);
		
		List<ArticleVO> viewsArticle = service.viewsArticle();
		model.addAttribute("viewsArticle", viewsArticle);
		
		List<KeywordDTO> topKeywords = keyservice.findTop7();
		model.addAttribute("topKeywords", topKeywords);
		
		Date date = new Date();
		SimpleDateFormat isoFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		
		String formattedDate = isoFormat.format(date);
		
		model.addAttribute("formattedDate", formattedDate );
		
		return "article/articleListAll";
	}
	
	@RequestMapping("articleListAll1")
	public String articleListAll1(Model model, Criteria cri) throws Exception{
		logger.info("articleListAll1..");
		
		 
		List<ArticleVO> articleListAll1 = service.articlListAll1(cri);
		model.addAttribute("articleListAll1", articleListAll1);
		
		int articlecategories_categoriesNo = 1;
		
		int categoryTotalCount = service.getTotalCountByCategory(articlecategories_categoriesNo);
		logger.info("일자리취업 총 게시물 수 = " + categoryTotalCount);
		model.addAttribute("categoryTotalCount", categoryTotalCount);
		
		    
		List<ArticleVO> allArticles = service.findAllArticles();
		List<ArticleVO> randomTwo = new ArrayList<>();
		

		if (!allArticles.isEmpty()) {
		    Collections.shuffle(allArticles);
		    randomTwo = allArticles.size() >= 2 
		        ? new ArrayList<>(allArticles.subList(0, 2)) 
		        : new ArrayList<>(allArticles);
		}
		model.addAttribute("randomArticles", randomTwo);

		
		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = service.getTotalCount(cri);
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("pageMaker", pageMaker);
		
		List<ArticleVO> viewsArticle = service.viewsArticle();
		model.addAttribute("viewsArticle", viewsArticle);
		
		List<KeywordDTO> topKeywords = keyservice.findTop7();
		model.addAttribute("topKeywords", topKeywords);
		
		Date date = new Date();
		SimpleDateFormat isoFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		
		String formattedDate = isoFormat.format(date);
		
		model.addAttribute("formattedDate", formattedDate );
		
		return "article/articleListAll1";
	}
	
	@RequestMapping("articleListAll2")
	public String articleListAll2(Model model, Criteria cri) throws Exception{
		logger.info("articleListAll2..");
		
		List<ArticleVO> articleListAll2 = service.articlListAll2(cri);
		model.addAttribute("articleListAll2", articleListAll2);
		
		int articlecategories_categoriesNo = 2;
		
		int categoryTotalCount = service.getTotalCountByCategory(articlecategories_categoriesNo);
		logger.info("주거/복지 총 게시물 수 = " + categoryTotalCount);
		model.addAttribute("categoryTotalCount", categoryTotalCount);
		
		List<ArticleVO> allArticles = service.findAllArticles();
		List<ArticleVO> randomTwo = new ArrayList<>();
		
		if (!allArticles.isEmpty()) {
		    Collections.shuffle(allArticles);
		    randomTwo = allArticles.size() >= 2 
		        ? new ArrayList<>(allArticles.subList(0, 2)) 
		        : new ArrayList<>(allArticles);
		}
		model.addAttribute("randomArticles", randomTwo);
		
		
		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = service.getTotalCount(cri);
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("pageMaker", pageMaker);
		
		List<ArticleVO> viewsArticle = service.viewsArticle();
		model.addAttribute("viewsArticle", viewsArticle);
		
		List<KeywordDTO> topKeywords = keyservice.findTop7();
		model.addAttribute("topKeywords", topKeywords);
		
		Date date = new Date();
		SimpleDateFormat isoFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		
		String formattedDate = isoFormat.format(date);
		
		model.addAttribute("formattedDate", formattedDate );
		
		return "article/articleListAll2";
	}
	
	@RequestMapping("articleListAll3")
	public String articleListAll3(Model model, Criteria cri) throws Exception{
		logger.info("articleListAll3..");
		
		List<ArticleVO> articleListAll3 = service.articlListAll3(cri);
		model.addAttribute("articleListAll3", articleListAll3);
		
		int articlecategories_categoriesNo = 3;
		
		int categoryTotalCount = service.getTotalCountByCategory(articlecategories_categoriesNo);
		logger.info("교육 총 게시물 수 = " + categoryTotalCount);
		model.addAttribute("categoryTotalCount", categoryTotalCount);
		
		
		List<ArticleVO> allArticles = service.findAllArticles();
		List<ArticleVO> randomTwo = new ArrayList<>();
		

		if (!allArticles.isEmpty()) {
		    Collections.shuffle(allArticles);
		    randomTwo = allArticles.size() >= 2 
		        ? new ArrayList<>(allArticles.subList(0, 2)) 
		        : new ArrayList<>(allArticles);
		}
		model.addAttribute("randomArticles", randomTwo);
		
		
		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = service.getTotalCount(cri);
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("pageMaker", pageMaker);
		
		List<ArticleVO> viewsArticle = service.viewsArticle();
		model.addAttribute("viewsArticle", viewsArticle);
		
		List<KeywordDTO> topKeywords = keyservice.findTop7();
		model.addAttribute("topKeywords", topKeywords);
		
		Date date = new Date();
		SimpleDateFormat isoFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		
		String formattedDate = isoFormat.format(date);
		
		model.addAttribute("formattedDate", formattedDate );
		
		return "article/articleListAll3";
	}
	
	@RequestMapping("articleListAll4")
	public String articleListAll4(Model model, Criteria cri) throws Exception{
		logger.info("articleListAll4..");
		
		List<ArticleVO> articleListAll4 = service.articlListAll4(cri);
		model.addAttribute("articleListAll4", articleListAll4);
		
		int articlecategories_categoriesNo = 4;
		
		int categoryTotalCount = service.getTotalCountByCategory(articlecategories_categoriesNo);
		logger.info("문화/여가 총 게시물 수 = " + categoryTotalCount);
		model.addAttribute("categoryTotalCount", categoryTotalCount);
		
		List<ArticleVO> allArticles = service.findAllArticles();
		List<ArticleVO> randomTwo = new ArrayList<>();
		

		if (!allArticles.isEmpty()) {
		    Collections.shuffle(allArticles);
		    randomTwo = allArticles.size() >= 2 
		        ? new ArrayList<>(allArticles.subList(0, 2)) 
		        : new ArrayList<>(allArticles);
		}
		model.addAttribute("randomArticles", randomTwo);
		
		
		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = service.getTotalCount(cri);
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("pageMaker", pageMaker);
		
		List<ArticleVO> viewsArticle = service.viewsArticle();
		model.addAttribute("viewsArticle", viewsArticle);
		
		List<KeywordDTO> topKeywords = keyservice.findTop7();
		model.addAttribute("topKeywords", topKeywords);
		
		Date date = new Date();
		SimpleDateFormat isoFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		
		String formattedDate = isoFormat.format(date);
		
		model.addAttribute("formattedDate", formattedDate );
		
		return "article/articleListAll4";
	}
	
	@RequestMapping("articleListAll5")
	public String articleListAll5(Model model, Criteria cri) throws Exception{
		logger.info("articleListAll5..");
		
		List<ArticleVO> articleListAll5 = service.articlListAll5(cri);
		model.addAttribute("articleListAll5", articleListAll5);
		
		int articlecategories_categoriesNo = 5;
		
		int categoryTotalCount = service.getTotalCountByCategory(articlecategories_categoriesNo);
		logger.info("건강/의료 총 게시물 수 = " + categoryTotalCount);
		model.addAttribute("categoryTotalCount", categoryTotalCount);
		
		List<ArticleVO> allArticles = service.findAllArticles();
		List<ArticleVO> randomTwo = new ArrayList<>();
		

		if (!allArticles.isEmpty()) {
		    Collections.shuffle(allArticles);
		    randomTwo = allArticles.size() >= 2 
		        ? new ArrayList<>(allArticles.subList(0, 2)) 
		        : new ArrayList<>(allArticles);
		}
		model.addAttribute("randomArticles", randomTwo);
		
		
		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = service.getTotalCount(cri);
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("pageMaker", pageMaker);
		
		List<ArticleVO> viewsArticle = service.viewsArticle();
		model.addAttribute("viewsArticle", viewsArticle);
		
		List<KeywordDTO> topKeywords = keyservice.findTop7();
		model.addAttribute("topKeywords", topKeywords);
		
		Date date = new Date();
		SimpleDateFormat isoFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		
		String formattedDate = isoFormat.format(date);
		
		model.addAttribute("formattedDate", formattedDate );
		
		return "article/articleListAll5";
	}
	
	@RequestMapping("articleListAll6")
	public String articleListAll6(Model model, Criteria cri) throws Exception{
		logger.info("articleListAll6..");
		
		List<ArticleVO> articleListAll6 = service.articlListAll6(cri);
		model.addAttribute("articleListAll6", articleListAll6);
		
		int articlecategories_categoriesNo = 6;
		
		int categoryTotalCount = service.getTotalCountByCategory(articlecategories_categoriesNo);
		logger.info("금융/경제 총 게시물 수 = " + categoryTotalCount);
		model.addAttribute("categoryTotalCount", categoryTotalCount);
		
		List<ArticleVO> allArticles = service.findAllArticles();
		List<ArticleVO> randomTwo = new ArrayList<>();
		

		if (!allArticles.isEmpty()) {
		    Collections.shuffle(allArticles);
		    randomTwo = allArticles.size() >= 2 
		        ? new ArrayList<>(allArticles.subList(0, 2)) 
		        : new ArrayList<>(allArticles);
		}
		model.addAttribute("randomArticles", randomTwo);
		
		
		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = service.getTotalCount(cri);
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("pageMaker", pageMaker);
		
		List<ArticleVO> viewsArticle = service.viewsArticle();
		model.addAttribute("viewsArticle", viewsArticle);
		
		List<KeywordDTO> topKeywords = keyservice.findTop7();
		model.addAttribute("topKeywords", topKeywords);
		
		Date date = new Date();
		SimpleDateFormat isoFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		
		String formattedDate = isoFormat.format(date);
		
		model.addAttribute("formattedDate", formattedDate );
		
		return "article/articleListAll6";
	}
	
	@RequestMapping("articleContent")
	public String articleContent(Model model, int articleId) throws Exception{
		logger.info("articleContent..");
		
		List<ArticleVO> articleContent = service.articleContent(articleId);
		model.addAttribute("articleContent", articleContent);
		
		
		List<ArticleVO> allArticles = service.findAllArticles();
		List<ArticleVO> randomTwo = new ArrayList<>();
		

		if (!allArticles.isEmpty()) {
		    Collections.shuffle(allArticles);
		    randomTwo = allArticles.size() >= 2 
		        ? new ArrayList<>(allArticles.subList(0, 2)) 
		        : new ArrayList<>(allArticles);
		}
		model.addAttribute("randomArticles", randomTwo);
		
		
		List<ArticleVO> viewsArticle = service.viewsArticle();
		model.addAttribute("viewsArticle", viewsArticle);
		
		List<KeywordDTO> topKeywords = keyservice.findTop7();
		model.addAttribute("topKeywords", topKeywords);
		
		Date date = new Date();
		SimpleDateFormat isoFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		
		String formattedDate = isoFormat.format(date);
		
		model.addAttribute("formattedDate", formattedDate );
		
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
		
		
		List<ArticleVO> allArticles = service.findAllArticles();
		List<ArticleVO> randomTwo = new ArrayList<>();
		

		if (!allArticles.isEmpty()) {
		    Collections.shuffle(allArticles);
		    randomTwo = allArticles.size() >= 2 
		        ? new ArrayList<>(allArticles.subList(0, 2)) 
		        : new ArrayList<>(allArticles);
		}
		model.addAttribute("randomArticles", randomTwo);
		
		
		List<ArticleVO> viewsArticle = service.viewsArticle();
		model.addAttribute("viewsArticle", viewsArticle);
		
		List<KeywordDTO> topKeywords = keyservice.findTop7();
		model.addAttribute("topKeywords", topKeywords);
		
		Date date = new Date();
		SimpleDateFormat isoFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		
		String formattedDate = isoFormat.format(date);
		
		model.addAttribute("formattedDate", formattedDate );
		
		return "article/noArticleContent";
	}
	
	@RequestMapping("viewsArticle")
	public String viewsArticle(Model model) throws Exception{
		logger.info("viewsArticle..");
		
		List<ArticleVO> viewsArticle = service.viewsArticle();
		model.addAttribute("viewsArticle", viewsArticle);
		
		return "article/articleListAll";
	}
	
	@ResponseBody
	 @PostMapping("logKeyword") // 클라이언트 AJAX 요청 URL
	 public int logKeyword(@RequestParam("keyword") String skeyword) {
	     System.out.println("logKeyword AJAX 요청 수신 - 키워드: " + skeyword);
	     try {
	         // Service 메소드를 호출하여 키워드 처리 (카운트 증가 or 삽입)
	         keyservice.logAndCountKeyword(skeyword); 
	         return 1; // 성공
	     } catch (Exception e) {
	         System.err.println("키워드 로깅 중 오류 발생: " + e.getMessage());
	         e.printStackTrace(); // 디버깅을 위해 스택 트레이스를 출력
	         return 0; // 실패
	     }
	 }	
	
	@RequestMapping("chart")
    public String chart(Model model) throws Exception {
        // 6개 카테고리 총 게시물 수
        int[] categoryCounts = new int[6];
        for (int i = 0; i < 6; i++) {
            categoryCounts[i] = service.getTotalCountByCategory(i + 1);
        }
        model.addAttribute("categoryCounts", categoryCounts);
        
        Date date = new Date();
       SimpleDateFormat isoFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
       
       String formattedDate = isoFormat.format(date);
       
       model.addAttribute("formattedDate", formattedDate );

       List<KeywordDTO> articleTopKeywords = keyservice.findTop7(); 
       model.addAttribute("articleTopKeywords", articleTopKeywords); 

       List<RegKeywordDTO> registrationTopKeywords = regKeyservice.findTop7();
       model.addAttribute("registrationTopKeywords", registrationTopKeywords);
       
        return "article/chart";
    }
	
}
