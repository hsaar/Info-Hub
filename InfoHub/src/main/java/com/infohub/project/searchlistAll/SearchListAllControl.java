package com.infohub.project.searchlistAll;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SearchListAllControl {

	private static final Logger logger = LoggerFactory.getLogger(SearchListAllControl.class);

	@Autowired
	private SearchListAllService service;

	@GetMapping("searchCount")
	public String searchCount(Model model) throws Exception {
		int searchCount = service.searchCount();
		model.addAttribute("searchCount", searchCount);
		return "/article/searchlistAll";
	}	

	@RequestMapping("searchlistAll")
	public String searchlistAll(Model model) throws Exception {

		logger.info("cri전체조회");

		List<SearchListAllDTO> searchlistAll = service.searchlistAll();
		model.addAttribute("searchlistAll", searchlistAll);

		return "/article/searchlistAll";
	}

	@RequestMapping(value = "/slistPage", method = RequestMethod.GET)
	public String listPage(Criteria cri, Model model) throws Exception {

		logger.info("listPage");

		List<SearchListAllDTO> SearchListAll = service.listPage(cri);
		model.addAttribute("list", SearchListAll);

		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = service.getTotalCount(cri);
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("pageMaker", pageMaker);

		return "/article/slistPage";
	}

	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("article_id") int article_id, @ModelAttribute("cri") Criteria cri, Model model)
			throws Exception {
		logger.info("read GET...");
		SearchListAllDTO searchlistAll = service.read(article_id);
		model.addAttribute(searchlistAll);
		
	}
}

//@RequestMapping("searchlistAll")
//public String searchlistAll(Model model) throws Exception{
//	logger.info("검색조회전체목록");
//	
//	List<SearchListAllDTO> searchlistAll = service.searchlistAll();
//	model.addAttribute("searchlistAll", searchlistAll);
//	
//	return "/article/searchlistAll";
//} 
//

//	@RequestMapping("searchCount")
//		public String searchCount(Model model) throws Exception{
//			int searchCount = service.searchCount();
//		
//			model.addAttribute("count", searchCount);
//			return "index";
//		}