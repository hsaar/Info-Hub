package com.infohub.project.scrap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;
import java.util.List;

@Controller
@RequestMapping("/scraps")	// HTTP 요청 처리
public class ScrapServer {

    @Autowired
    private ScrapService service;

    // 정책 스크랩 목록 조회
    @GetMapping
    public String getPolicyScraps(
            @RequestParam("loginNo") int loginId,
            Model model
    ) throws SQLException {
        List<ScrapDTO> scraps = service.getPolicyScrapsByUser(loginId);
        model.addAttribute("scraps", scraps);
        return "policyScrapList";   // policyScrapList.jsp
    }

    // 정책 스크랩 추가
    @PostMapping
    public String addPolicyScrap(
            @RequestParam("loginNo") int loginId,
            @RequestParam("policyId") int policyId,
            Model model
    ) throws SQLException {
        service.addPolicyScrap(loginId, policyId);
        model.addAttribute("result", "policy_scrap_success");
        return "scrapResult"; // scrapResult.jsp
    }

    // 정책 스크랩 삭제
    @PostMapping("/delete") 
    public String deletePolicyScrap(
            @RequestParam("scrapsNo") int scrapId,
            Model model
    ) throws SQLException {
        service.deleteScrap(scrapId);
        model.addAttribute("result", "delete_success");
        return "scrapResult"; // scrapResult.jsp
    }
}
