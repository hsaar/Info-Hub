package com.infohub.project.policy;

import java.sql.SQLException;
import java.util.List;

public interface PolicyService {

    // 목록 조회 → 지역, 카테고리 조건 적용 + 정렬
    List<PolicyDTO> findPolicies(Integer regionId, Integer categoryId, String orderBy) throws SQLException;

    // 상세 조회 → registrationNo 단일 정책 불러오기
    PolicyDTO findPolicyDetail(int registrationNo) throws SQLException;

    // 정책 추가 (관리자용)
    void insertPolicy(PolicyDTO dto) throws SQLException;

    // 정책 수정 (관리자용)
    void updatePolicy(PolicyDTO dto) throws SQLException;

    // 정책 삭제 (관리자용)
    void deletePolicy(int registrationNo) throws SQLException;

    // 좋아요 증가
    void increaseLikes(int registrationNo) throws SQLException;
}
