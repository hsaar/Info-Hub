package com.infohub.project.article_categories;

import java.util.List;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.infohub.project.HomeController;


@Controller
public class Article_categoriesControl {
	
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	Article_categoriesService service;
	
	@RequestMapping("listAll")
	public String listAll(Model model) throws Exception{
		logger.info("listAll..");
		
		List<Article_categoriesVO> listAll = service.listAll();
		model.addAttribute("listAll", listAll);
		
		
		return "./article/listAll";
	}

}
