package com.infohub.project.myarticle;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyarticleController {

	@Autowired
	private MyarticleServiceImpl se;
	
	@GetMapping("myArticle")
	public String customized_article(Model model) {
		List<MyarticleDTO> list = se.listAll("show");
		int count = se.count("show");
		
		model.addAttribute("name", list.get(1).getName());
		model.addAttribute("image", list.get(1).getimage());
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		
		return "customized/myArticle";
	}
}
