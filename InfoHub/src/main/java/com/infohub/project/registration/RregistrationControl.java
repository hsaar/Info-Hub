package com.infohub.project.registration;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.infohub.project.HomeController;

@Controller
public class RregistrationControl { 
	
	private static final Logger logger = LoggerFactory.getLogger(RregistrationControl.class);
	
	@Autowired
	private RegistrationService service;
	
	@RequestMapping("registrationlistAll")
	public String registrationlistAll(Model model) throws Exception{
		logger.info("전체조회");
		
		List<RegistrationDTO> registrationlistAll = service.registrationlistAll();
		model.addAttribute("registrationlistAll", registrationlistAll);

		return "article/registrationlistAll";
	}
	
}