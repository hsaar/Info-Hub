package com.infohub.project.policy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;
import java.util.List;

@RestController
@RequestMapping("/api/policy")
public class PolicyRestController {

    @Autowired
    private PolicyService service;

    // 정책 목록 조회
    @GetMapping
    public List<PolicyDTO> getPolicies(
            @RequestParam(required = false) Integer regionId,
            @RequestParam(required = false) Integer categoryId,
            @RequestParam(required = false) String orderBy
    ) throws SQLException {
        return service.findPolicies(regionId, categoryId, orderBy);
    }

    // 정책 상세 조회
    @GetMapping("/{id}")
    public PolicyDTO getPolicyDetail(@PathVariable("id") int registrationNo) throws SQLException {
        return service.findPolicyDetail(registrationNo);
    }

    // 좋아요 증가
    @PostMapping("/{id}/like")
    public String likePolicy(@PathVariable("id") int registrationNo) throws SQLException {
        service.increaseLikes(registrationNo);
        return "like_success";
    }
}
