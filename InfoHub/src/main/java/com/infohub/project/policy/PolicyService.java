package com.infohub.project.policy;

import java.sql.SQLException;
import java.util.List;

public class PolicyService {
    private PolicyDAO dao = new PolicyDAO();

    // 목록조회 (region, category만)
    public List<PolicyDTO> getPolicies(Integer regionId, Integer categoryId) throws SQLException {
        return dao.findPolicies(regionId, categoryId, null); // keyword는 null 처리
    }

    // 목록조회 (region, category, keyword) → 검색패널
    public List<PolicyDTO> getPolicies(Integer regionId, Integer categoryId, String keyword) throws SQLException {
        return dao.findPolicies(regionId, categoryId, keyword);
    }

    // 상세조회
    public PolicyDTO getPolicyDetail(int policyId) throws SQLException {
        return dao.findPolicyDetail(policyId);
    }
    
    // 정책 추가 (관리자용)
    public void addPolicy(PolicyDTO dto) throws SQLException {
        dao.insertPolicy(dto);
    }
    
    // 좋아요 증가
    public void addLike(int policyId) throws SQLException {
        dao.increaseLikes(policyId);
    }
}
