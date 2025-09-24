package com.infohub.project.searchlistAll;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class SearchListAllControl {

	private static final Logger logger = LoggerFactory.getLogger(SearchListAllControl.class);

	@Autowired
	private SearchListAllService service;

	@RequestMapping("slistPage")
	public String slistPage(Criteria cri, Model model) throws Exception {

		logger.info("slistPage");

		List<SearchListAllDTO> slistPage = service.slistPage(cri);
		model.addAttribute("slistPage", slistPage);

		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = service.getTotalCount(cri);
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("pageMaker", pageMaker);
		
		logger.info(" sList page : " + slistPage);
		
		return "article/slistPage";
	}

	@RequestMapping("read")
	public String read(int articleId, Model model) throws Exception {
		
		logger.info("readPage");
		
		List<SearchListAllDTO> read = service.read(articleId);
		model.addAttribute("read", read);
		
		logger.info(" read page : " + read);
		return "article/read";
	}
}

//	@RequestMapping("/searchlistAll")
//	public String searchlistAll(Model model) throws Exception {
//
//		logger.info("전체조회");
//
//		List<SearchListAllDTO> list = service.searchlistAll();
//		model.addAttribute("list", list);
//		logger.info(" List page : " + list);
//		return "/article/searchlistAll";
//	}

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