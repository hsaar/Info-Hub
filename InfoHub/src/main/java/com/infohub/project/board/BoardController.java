package com.infohub.project.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {
	@Autowired
	BoardService service;
	
	@GetMapping("boardCount")
	public String boardCount(Model model) {
		try {
			int cnt=service.boardCount();
			model.addAttribute("cnt", cnt);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "index";
	}
}
