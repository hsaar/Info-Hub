package com.infohub.project.policy;

import java.sql.SQLException;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/policy")
public class PolicyRestController {

    @Autowired
    private PolicyService service;

    // 정책 목록 조회
    @GetMapping
    public ResponseEntity<List<PolicyDTO>> getPolicies(
            @RequestParam(required = false) Integer regionId,
            @RequestParam(required = false) Integer categoryId,
            @RequestParam(required = false) String orderBy) throws SQLException {
        return ResponseEntity.ok(service.findPolicies(regionId, categoryId, orderBy));
    }

    // 정책 상세 조회
    @GetMapping("/{id}")
    public ResponseEntity<PolicyDTO> getPolicyDetail(@PathVariable("id") int policyId) throws SQLException {
        return ResponseEntity.ok(service.findPolicyDetail(policyId));
    }

    // 좋아요
    @PostMapping("/{id}/like")
    public ResponseEntity<String> likePolicy(@PathVariable("id") int policyId) throws SQLException {
        service.increaseLikes(policyId);
        return ResponseEntity.ok("like_success");
    }
}
