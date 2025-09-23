package com.infohub.project.map;

import java.sql.SQLException;
import java.util.List;
import com.infohub.project.policy.*;

// test
public class ShowMap {
    public static void main(String[] args) {
        PolicyService service = new PolicyService();

        try {
            System.out.println("=== 전체 정책 목록 ===");
            List<PolicyDTO> allPolicies = service.getPolicies(null, null); // 조건 없음 → 전체 조회
            for (PolicyDTO p : allPolicies) {
                System.out.println(p);
            }

            System.out.println("\n=== 특정 지역 정책 (regionId=1) ===");
            List<PolicyDTO> regionPolicies = service.getPolicies(1, null); // 지역만 조건
            for (PolicyDTO p : regionPolicies) {
                System.out.println(p);
            }

            System.out.println("\n=== 특정 카테고리 정책 (categoryId=2) ===");
            List<PolicyDTO> categoryPolicies = service.getPolicies(null, 2); // 카테고리만 조건
            for (PolicyDTO p : categoryPolicies) {
                System.out.println(p);
            }

            System.out.println("\n=== 특정 지역 + 카테고리 정책 (regionId=1, categoryId=2) ===");
            List<PolicyDTO> filteredPolicies = service.getPolicies(1, 2); // 지역+카테고리 둘 다 조건
            for (PolicyDTO p : filteredPolicies) {
                System.out.println(p);
            }

            System.out.println("\n=== 키워드 검색 (keyword=청년) ===");
            List<PolicyDTO> keywordPolicies = service.getPolicies(null, null, "청년"); // ✅ keyword 테스트
            for (PolicyDTO p : keywordPolicies) {
                System.out.println(p);
            }

            System.out.println("\n=== 상세 조회 (policyId=1) ===");
            PolicyDTO detail = service.getPolicyDetail(1);
            System.out.println("제목: " + detail.getTitle());
            System.out.println("내용: " + detail.getContent());
            System.out.println("좋아요 수: " + detail.getLikes()); // 정책 상세 조회

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
