package com.infohub.project.policy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service   // 스프링 서비스 빈 등록
public class PolicyImpl implements PolicyService {

    @Autowired
    private PolicyDAO dao;   // DAO 주입

    // 목록 조회 → 지역, 카테고리 조건 적용 + 정렬
    @Override
    public List<PolicyDTO> findPolicies(Integer regionId, Integer categoryId, String orderBy) throws SQLException {
    	return dao.findPolicies(regionId, categoryId, orderBy);
    }

    // 상세 조회 → policyId 단일 정책 불러오기
    @Override
    public PolicyDTO findPolicyDetail(int registrationNo) throws SQLException {
        return dao.findPolicyDetail(registrationNo);
    }

    // 정책 추가 (관리자용)
    @Override
    public void insertPolicy(PolicyDTO dto) throws SQLException {
        dao.insertPolicy(dto);
    }

    // 정책 수정 (관리자용)
    @Override
    public void updatePolicy(PolicyDTO dto) throws SQLException {
        dao.updatePolicy(dto);
    }

    // 정책 삭제 (관리자용)
    @Override
    public void deletePolicy(int registrationNo) throws SQLException {
        dao.deletePolicy(registrationNo);
    }

    // 좋아요 증가
    @Override
    public void increaseLikes(int registrationNo) throws SQLException {
        dao.increaseLikes(registrationNo);
    }
}
