package com.infohub.project.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
	
	@Autowired
	LoginServiceImpl se;
	
	@GetMapping("login")
	public String login(Model model) {
		model.addAttribute("listAll", se.listAll());
		model.addAttribute("getUserById", se.getUserById(1));
		return "./login/login";
	}
	@GetMapping("idfind")
	public String idfind(Model model) {
		
		return "./idfind/idfind";
	}
	@GetMapping("logout")
	public String logout(Model model) {
		return "./logout/logout";
	}
	@GetMapping("memberjoin")
	public String memberjoin(Model model) {
		return "./memberjoin/memberjoin";
	}
	@GetMapping("myinfo")
	public String myinfo(Model model) {
		return "./myinfo/myinfo";
	}
	@GetMapping("passwordfind")
	public String passwordfind(Model model) {
		return "./passwordfind/passwordfind";
	}
}
