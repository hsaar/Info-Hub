package com.infohub.project.customizedservice;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

import com.infohub.project.login.LoginService;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class CustomizedController {

    private static final Logger logger = LoggerFactory.getLogger(CustomizedController.class);

    @Autowired
    private CustomizedService service;
    
    @Autowired
    private LoginService loginService;

    @RequestMapping("myBenifitPush")
    public String myBenifitPush(Model model, HttpSession session) throws Exception { 
        logger.info("myBenifitPush (마감 임박 알림 조회) 호출");

        String userId = (String) session.getAttribute("userId"); 
        logger.info("--- 1. myBenifitPush Controller 호출됨. (User: {}) ---", userId);
        
        if (userId == null) {
            logger.warn("비로그인 사용자의 myBenifit 접근 시도!");
            return "redirect:/login"; 
        }

        List<CustomizedDTO> deadlineAlerts = service.getDeadlineAlerts(userId);
        int dataSize = deadlineAlerts != null ? deadlineAlerts.size() : 0;
        logger.info("--- 2. myBenifitPush 결과 데이터 개수: {} ---", dataSize);
        
        model.addAttribute("myBenifitPush", deadlineAlerts);
    
        return "customized/myBenifitPush"; 
    }
}