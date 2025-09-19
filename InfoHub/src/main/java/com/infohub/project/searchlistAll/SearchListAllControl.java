package com.infohub.project.searchlistAll;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class SearchListAllControl { 
	
	private static final Logger logger = LoggerFactory.getLogger(SearchListAllControl.class);
	
	@Autowired
	private SearchListAllService service;
	
	@GetMapping("searchCount") 
	public String searchCount(Model model) throws Exception{
		int searchCount = service.searchCount();
		model.addAttribute("searchCount", searchCount);
		return "index";
	}
	
	
	@RequestMapping("searchlistAll")
	public String SearchListAll(Model model) throws Exception{
		logger.info("검색조회전체목록");
		
		List<SearchListAllDTO> searchlistAll = service.searchlistAll();
		model.addAttribute("searchlistAll", searchlistAll);
		
		return "searchlistAll";
	} 
	
}
//	@RequestMapping("searchCount")
//	public String searchCount(Model model) throws Exception{
//		int searchCount = service.searchCount();
//		
//		model.addAttribute("count", searchCount);
//		return "index";
//	}