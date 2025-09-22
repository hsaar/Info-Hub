package com.infohub.project;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.infohub.project.test.testDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	testDAO dao = new testDAO();
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping("/")
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		int i = dao.test();
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("test", i);
		
		return "index";
	}
	
	@GetMapping("article_home")
	public String article_home(Model model) {
		return "/article/article_home";
	}
	
	@GetMapping("timeline")
	public String timeline(Model model) {
		return "timeline";
	}
	
	@GetMapping("registrationlistAll")
	public String registrationlistAll(Model model) {
		return "/article/registrationlistAll";
	}
	
	@GetMapping("my_benifit")
	public String my_benifit(Model model) {
		return "/customized/my_benifit";
	}
	
	@GetMapping("customized_article")
	public String customized_article(Model model) {
		return "/customized/customized_article";
	}
	
	@GetMapping("board_main")
	public String board_main(Model model) {
		return "/board/board_main";
	}
	
	@GetMapping("policy")
	public String policy(Model model) {
		return "/otherPage/policy";
	}
	
	@GetMapping("benefits")
	public String benefits(Model model) {
		return "/otherPage/benefits";
	}
	
	@GetMapping("mypage_main")
	public String mypage_main(Model model) {
		return "/mypage/mypage_main";
	}
	
	
}
