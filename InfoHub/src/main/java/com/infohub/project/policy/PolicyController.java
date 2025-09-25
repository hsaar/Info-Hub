package com.infohub.project.policy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;

@Controller 
@RequestMapping("/policies")
public class PolicyController {

    @Autowired
    private PolicyService service;

    // 목록 조회 & 상세 조회
    @GetMapping
    public String getPolicies(
            @RequestParam(value = "policyId", required = false) Integer policyId,
            @RequestParam(value = "regionId", required = false) Integer regionId,
            @RequestParam(value = "category", required = false) Integer categoryId,
            @RequestParam(value = "keyword", required = false) String keyword,
            @RequestParam(value = "orderBy", required = false) String orderBy,
            Model model) {

        try {
            if (policyId != null) {  // 상세 조회
                model.addAttribute("policyDetail", service.getPolicyDetail(policyId));
                return "policyDetail"; // policyDetail.jsp
            }
            model.addAttribute("policyList", service.getPolicies(regionId, categoryId, keyword, orderBy));  // 목록 조회
            return "policyList"; // policyList.jsp
        } catch (SQLException e) {
            model.addAttribute("error", "DB 오류 발생");
            return "error"; // error.jsp
        }
    }

    // 정책 추가 + 좋아요
    @PostMapping
    public String postPolicy(
            @RequestParam(value = "action", required = false) String action,
            @RequestParam(value = "policyId", required = false) Integer policyId,
            @ModelAttribute PolicyDTO dto,
            Model model) {

        try {
            if ("like".equals(action) && policyId != null) {   // 좋아요
                service.addLike(policyId);
                model.addAttribute("result", "like_success");
                return "policyResult"; // policyResult.jsp
            }

            // 정책 추가
            service.addPolicy(dto);
            model.addAttribute("result", "insert_success");
            return "policyResult"; // policyResult.jsp

        } catch (SQLException e) {
            model.addAttribute("error", "DB 오류");
            return "error"; // error.jsp
        } catch (Exception e) {
            model.addAttribute("error", "잘못된 요청");
            return "error"; // error.jsp
        }
    }

    // 정책 수정 (관리자용)
    @PutMapping
    public String updatePolicy(@ModelAttribute PolicyDTO dto, Model model) {
        try {
            service.updatePolicy(dto);
            model.addAttribute("result", "update_success");
            return "policyResult"; // policyResult.jsp
        } catch (Exception e) {
            model.addAttribute("error", "DB 오류");
            return "error"; // error.jsp
        }
    }

    // 정책 삭제 (관리자용)
    @DeleteMapping
    public String deletePolicy(@RequestParam("policyId") int policyId, Model model) {
        try {
            service.deletePolicy(policyId);
            model.addAttribute("result", "delete_success");
            return "policyResult"; // policyResult.jsp
        } catch (Exception e) {
            model.addAttribute("error", "DB 오류");
            return "error"; // error.jsp
        }
    }
}
