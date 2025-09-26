package com.infohub.project.test;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class testControler {
	
	testDAO dao = new testDAO();
	
	@GetMapping("keyword")
	public String test() {
		return "keyword";
	}
}
