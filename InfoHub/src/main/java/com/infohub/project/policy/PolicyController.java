package com.infohub.project.policy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;

@Controller 
@RequestMapping("/policy/view")
public class PolicyController {

    @Autowired
    private PolicyService service;

    // 목록 조회 & 상세 조회
    @GetMapping
    public String getPolicies(
            @RequestParam(value = "registrationNo", required = false) Integer registrationNo,
            @RequestParam(value = "regionId", required = false) Integer regionId,
            @RequestParam(value = "category", required = false) Integer categoryId,
            @RequestParam(value = "orderBy", required = false) String orderBy,
            Model model) {

        try {
            if (registrationNo != null) {  // 상세 조회
                model.addAttribute("policyDetail", service.findPolicyDetail(registrationNo));
                return "policyDetail"; // policyDetail.jsp
            }
            model.addAttribute("policyList", service.findPolicies(regionId, categoryId, orderBy));  // 목록 조회
            return "otherPage/map"; // policyList.jsp
        } catch (SQLException e) {
            model.addAttribute("error", "DB 오류 발생");
            return "policy/error"; // error.jsp
        }
    }

    // 정책 추가
    @PostMapping("/insert")
    public String insertPolicy(@ModelAttribute PolicyDTO dto, Model model) {
        try {
            service.insertPolicy(dto);  // 정책 추가
            model.addAttribute("result", "insert_success");
            return "policy/policyResult"; // policyResult.jsp
        } catch (SQLException e) {
            model.addAttribute("error", "DB 오류");
            return "policy/error"; // error.jsp
        } catch (Exception e) {
            model.addAttribute("error", "잘못된 요청");
            return "policy/error"; // error.jsp
        }
    }
    
    // 정책 수정 (관리자용)
    @PutMapping
    public String updatePolicy(@ModelAttribute PolicyDTO dto, Model model) {
        try {
            service.updatePolicy(dto);
            model.addAttribute("result", "update_success");
            return "policy/policyResult"; // policyResult.jsp
        } catch (Exception e) {
            model.addAttribute("error", "DB 오류");
            return "policy/error"; // error.jsp
        }
    }

    // 정책 삭제 (관리자용)
    @DeleteMapping
    public String deletePolicy(@RequestParam("registrationNo") int registrationNo, Model model) {
        try {
            service.deletePolicy(registrationNo);
            model.addAttribute("result", "delete_success");
            return "policy/policyResult"; // policyResult.jsp
        } catch (Exception e) {
            model.addAttribute("error", "DB 오류");
            return "policy/error"; // error.jsp
        }
    }
    
    // 좋아요
    @PostMapping("/like")
    public String likePolicy(
            @RequestParam(value = "registrationNo") Integer registrationNo,
            Model model) {
        try {
            service.increaseLikes(registrationNo);  // 좋아요 증가
            model.addAttribute("result", "like_success");
            return "policy/policyResult"; // policyResult.jsp
        } catch (SQLException e) {
            model.addAttribute("error", "DB 오류");
            return "policy/error"; // error.jsp
        } catch (Exception e) {
            model.addAttribute("error", "잘못된 요청");
            return "policy/error"; // error.jsp
        }
    }
}

