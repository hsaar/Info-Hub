package com.infohub.project.policy;

import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service   // 스프링 서비스 계층
public class PolicyService {

    @Autowired
    private PolicyDAO dao;

    // 목록조회 (지역, 카테고리만)
    public List<PolicyDTO> getPolicies(Integer regionId, Integer categoryId) throws SQLException {
        return dao.findPolicies(regionId, categoryId, null);
    }

    // 목록조회 (검색 포함)
    public List<PolicyDTO> getPolicies(Integer regionId, Integer categoryId, String keyword) throws SQLException {
        return dao.findPolicies(regionId, categoryId, keyword);
    }

    // 상세조회
    public PolicyDTO getPolicyDetail(int policyId) throws SQLException {
        return dao.findPolicyDetail(policyId);
    }

    // 정책 추가
    public void addPolicy(PolicyDTO dto) throws SQLException {
        dao.insertPolicy(dto);
    }

    // 좋아요 증가
    public void addLike(int policyId) throws SQLException {
        dao.increaseLikes(policyId);
    }
}
