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

    // 스크랩 목록 조회
    @GetMapping
    public String getScraps(
            @RequestParam("loginNo") int loginId,
            @RequestParam(value = "type", required = false, defaultValue = "policy") String type,
            Model model
    ) throws SQLException {
        if ("article".equals(type)) {   // 기사 스크랩 목록
            List<ScrapDTO> scraps = service.getArticleScrapsByUser(loginId);
            model.addAttribute("scraps", scraps);
            return "articleScrapList";  // articleScrapList.jsp 뷰로 전달
        } else {   // 정책 스크랩 목록
            List<ScrapDTO> scraps = service.getPolicyScrapsByUser(loginId);
            model.addAttribute("scraps", scraps);
            return "policyScrapList";   // policyScrapList.jsp 뷰로 전달
        }
    }

    // 스크랩 추가
    @PostMapping
    public String addScrap(
            @RequestParam("loginNo") int loginId,
            @RequestParam("type") String type,
            @RequestParam(value = "policyId", required = false) Integer policyId,
            @RequestParam(value = "articleId", required = false) Integer articleId,
            Model model
    ) throws SQLException {
        if ("article".equals(type) && articleId != null) {   // 기사 스크랩 추가
            service.addArticleScrap(loginId, articleId);
            model.addAttribute("result", "article_scrap_success");
            return "scrapResult"; // scrapResult.jsp
        } else if ("policy".equals(type) && policyId != null) {   // 정책 스크랩 추가
            service.addPolicyScrap(loginId, policyId);
            model.addAttribute("result", "policy_scrap_success");
            return "scrapResult"; // scrapResult.jsp
        }
        model.addAttribute("error", "invalid_request");
        return "scrapResult"; // scrapResult.jsp
    }

    // 스크랩 삭제
    @DeleteMapping
    public String deleteScrap(
            @RequestParam("scrapsNo") int scrapId,
            Model model
    ) throws SQLException {
        service.deleteScrap(scrapId);
        model.addAttribute("result", "delete_success");
        return "scrapResult"; // scrapResult.jsp
    }
}
