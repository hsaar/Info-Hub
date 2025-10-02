package com.infohub.project.myscraps;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;

@Controller
@RequestMapping("/scraps")
public class ScrapController {

    @Autowired
    private ScrapService service;

    // 정책 스크랩 목록 조회
    @GetMapping
    public String getPolicyScraps(HttpSession session, Model model) throws SQLException {
        Integer loginNo = (Integer) session.getAttribute("loginNo");
        if (loginNo == null) {
            return "redirect:/login"; 
        }
        List<ScrapDTO> scraps = service.getPolicyScrapsByUser(loginNo);
        
        model.addAttribute("scraps", scraps);
        return "mypage/my_scrap";
    }
    
    @GetMapping("/api")
    @ResponseBody
    public List<ScrapDTO> getScrapsApi(HttpSession session) throws SQLException {
        Integer loginNo = (Integer) session.getAttribute("loginNo");
        if (loginNo == null) {
            return java.util.Collections.emptyList(); // 로그인 안 하면 빈 배열
        }
        return service.getPolicyScrapsByUser(loginNo);
    }

    // 정책 스크랩 추가
    @PostMapping
    public String addPolicyScrap(
            @RequestParam("policyId") int policyId,
            HttpSession session,
            Model model
    ) throws SQLException {
        Integer loginNo = (Integer) session.getAttribute("loginNo");
        if (loginNo == null) {
            return "redirect:/login";
        }

        service.addPolicyScrap(loginNo, policyId);
        List<ScrapDTO> scraps = service.getPolicyScrapsByUser(loginNo);
        model.addAttribute("scraps", scraps);
        model.addAttribute("result", "policy_scrap_success");
        return "mypage/my_scrap";
    }

    // 정책 스크랩 삭제
    @PostMapping("/delete") 
    public String deletePolicyScrap(
            @RequestParam("scrapsNo") int scrapId,
            HttpSession session,
            Model model
    ) throws SQLException {
        Integer loginNo = (Integer) session.getAttribute("loginNo");
        if (loginNo == null) {
            return "redirect:/login";
        }

        service.deleteScrap(scrapId);
        List<ScrapDTO> scraps = service.getPolicyScrapsByUser(loginNo);
        model.addAttribute("scraps", scraps);
        model.addAttribute("result", "delete_success");
        return "mypage/my_scrap"; 
    }
}


