package com.infohub.project.policy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.sql.SQLException;

@RestController   // JSON 반환 전용 컨트롤러
@RequestMapping("/policies")
public class PolicyServer {

    @Autowired
    private PolicyService service;

    // 목록 조회 & 상세 조회
    @GetMapping
    public Object getPolicies(
            @RequestParam(value = "policyId", required = false) Integer policyId,
            @RequestParam(value = "regionId", required = false) Integer regionId,
            @RequestParam(value = "category", required = false) Integer categoryId,
            @RequestParam(value = "keyword", required = false) String keyword) {

        try {
            if (policyId != null) {  // 상세 조회
                return service.getPolicyDetail(policyId);
            }
            return service.getPolicies(regionId, categoryId, keyword);  // 목록 조회
        } catch (SQLException e) {
            return "{\"error\":\"DB 오류 발생\"}";
        }
    }

    // 정책 추가 + 좋아요
    @PostMapping
    public String postPolicy(
            @RequestParam(value = "action", required = false) String action,
            @RequestParam(value = "policyId", required = false) Integer policyId,
            @ModelAttribute PolicyDTO dto) {

        try {
            if ("like".equals(action) && policyId != null) {   // 좋아요
                service.addLike(policyId);
                return "{\"result\":\"like_success\"}";
            }

            // 정책 추가
            service.addPolicy(dto);
            return "{\"result\":\"insert_success\"}";

        } catch (SQLException e) {
            return "{\"error\":\"DB 오류\"}";
        } catch (Exception e) {
            return "{\"error\":\"잘못된 요청\"}";
        }
    }
}
