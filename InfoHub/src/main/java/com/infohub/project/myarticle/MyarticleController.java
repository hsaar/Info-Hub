package com.infohub.project.myarticle;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.infohub.project.login.LoginController;
import com.infohub.project.login.LoginDTO;
import com.infohub.project.login.LoginServiceImpl;

@Controller
public class MyarticleController {
	private Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private MyarticleServiceImpl mse;
	
	@Autowired
	private LoginServiceImpl lse;
	
	@GetMapping("myArticle")
	public String customized_article(Model model, HttpSession session) {
		
		LoginDTO user = new LoginDTO();
		
		if(session != null) {
			String userId = (String) session.getAttribute("userId");
			user = lse.getUserById(userId);
		}
		
		List<String> keywords = Arrays.stream(user.getKeywords().split(","))
										.map(String::trim)
										.collect(Collectors.toList());
		
		int keywordsNo = keywords.size();
		
		if(keywordsNo >0) {
			model.addAttribute("keyword0",keywords.get(0));
			List<MyarticleDTO> list0 = mse.listAll(keywords.get(0));
			model.addAttribute("list0", list0);
			keywordsNo--;
		}
		if(keywordsNo >0) {
			model.addAttribute("keyword1",keywords.get(1));
			List<MyarticleDTO> list1 = mse.listAll(keywords.get(1));
			model.addAttribute("list1", list1);
			keywordsNo--;
		}
		if(keywordsNo >0) {
			model.addAttribute("keyword2",keywords.get(2));
			List<MyarticleDTO> list2 = mse.listAll(keywords.get(2));
			model.addAttribute("list2", list2);
			keywordsNo--;
		}
		if(keywordsNo >0) {
			model.addAttribute("keyword3",keywords.get(3));
			List<MyarticleDTO> list3 = mse.listAll(keywords.get(3));
			model.addAttribute("list3", list3);
			keywordsNo--;
		}
		if(keywordsNo >0) {
			model.addAttribute("keyword4",keywords.get(4));
			List<MyarticleDTO> list4 = mse.listAll(keywords.get(4));
			model.addAttribute("list4", list4);
			keywordsNo--;
		}
		
		model.addAttribute("keyword5", "취업지원");
		List<MyarticleDTO> list5 = mse.listAll("취업지원");
		model.addAttribute("list5", list5);
		
		model.addAttribute("keyword6", "문화바우처");
		List<MyarticleDTO> list6 = mse.listAll("문화바우처");
		model.addAttribute("list6", list6);
		
		model.addAttribute("keyword7", "의료비지원");
		List<MyarticleDTO> list7 = mse.listAll("의료비지원");
		model.addAttribute("list7", list7);
		
		model.addAttribute("keyword8", "심리상담");
		List<MyarticleDTO> list8 = mse.listAll("심리상담");
		model.addAttribute("list8", list8);
		
		model.addAttribute("keyword9", "생활안정");
		List<MyarticleDTO> list9 = mse.listAll("생활안정");
		model.addAttribute("list9", list9);
		
		
		
		return "customized/myArticle";
	}
	
	@PostMapping("/updateKeywords")
	public String updateKeywords(@RequestParam("profileSelectedKeywords")String keywords, Model model, HttpSession session) {
		String userId = null;
		
		if(session != null) {
			userId = (String) session.getAttribute("userId");
		}
		
		int i = lse.updateKeywords(userId, keywords);
		
		if(i>0) {
			logger.info("키워드업데이트성공");
		}
		
		return "redirect:/myArticle";
	}
	

	
}
