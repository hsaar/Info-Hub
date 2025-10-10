package com.infohub.project.scraps;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


@Controller
public class ScrapsControl {
	
	@Autowired
	ScrapsService service;
	
	@GetMapping("scrapsCount")
	public String scrapsCount(Model model) throws Exception {
		
		int scrapsCount = service.scrapsCount();
			model.addAttribute("scrapsCount", scrapsCount);
		
		return "scrapsCount";
	}
	
	@ResponseBody
	@PostMapping("scrapsCheck")
	public int scrapsCheck(ScrapsVO scrapsVO) throws Exception {
		System.out.println("scrapsCheck");
		
		int scrapsCheck = service.scrapsCheck(scrapsVO);
		
		return scrapsCheck;
	}
	
	@ResponseBody
	@PostMapping("scrap")
	public int scrap(ScrapsVO scrapsVO) throws Exception {
		System.out.println("scrap");
		
		int scrap = service.scrapsCheck(scrapsVO);
		if (scrap==0) {
			service.scrapsInsert(scrapsVO);
		}else if(scrap==1) {
			service.scrapsDelete(scrapsVO);
		}
		return scrap;
	}
	
	@ResponseBody
	@PostMapping("scraps/myscraps")
	public List<ScrapsVO> myscraps(@RequestParam int loginNo) throws Exception{
		System.out.println("myscraps..");
		
	
		return service.myscraps(loginNo);
	}
	
	@ResponseBody
	@PostMapping("scrapsDelete")
	public int scrapsDelete(ScrapsVO scrapsVO) throws Exception {
		System.out.println("scrapsDelete");
		
		return service.scrapsDelete(scrapsVO);
		
	}
	
	@RequestMapping("timelineMyBenifit")
    public String getMyScraps(Model model, HttpSession session) throws Exception {

		Integer loginNo = (Integer) session.getAttribute("loginNo");
		System.out.println(loginNo);

        List<ScrapsVO> timelineMyBenifit = service.getMyScraps(loginNo);
        model.addAttribute("getMyScraps", timelineMyBenifit);

        return "customized/timelineMyBenifit"; // JSP 경로
    }

}
