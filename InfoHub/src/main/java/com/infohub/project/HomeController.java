package com.infohub.project;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.infohub.project.login.LoginDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping("/")
	public String home(HttpSession session, Locale locale, Model model, @SessionAttribute(name = "userId", required = false)String userId) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		LoginDTO loginUser = (LoginDTO) session.getAttribute("loginUser");
	    if (loginUser != null) {
	        model.addAttribute("loginUser", loginUser);
	    }
		
		return "index";
	}

	@GetMapping("myBenifit")
	public String my_benifit(Model model) {
		return "/customized/myBenifit";
	}
	
	@GetMapping("boardlistmain")
	public String boardlistmain(Model model) {
		return "/board/boardlistmain";
	}
	
	@GetMapping("boardlist")
	public String boardlist(Model model) {
		return "/board/boardlist";
	}
	
	@GetMapping("policy")
	public String policy(Model model) {
		return "/otherPage/policy";
	}
	
	@GetMapping("benefits")
	public String benefits(Model model) {
		return "/otherPage/benefits";
	}
	
	@GetMapping("index")
	public String index(Model model) {
		return "index";
	}
}
