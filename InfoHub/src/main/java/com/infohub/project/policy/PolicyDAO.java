package com.infohub.project.policy;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PolicyDAO {
    private static final String url = "jdbc:mysql://192.168.0.14:3306/policy?serverTimezone=UTC";
    private static final String user = "avangers5";
    private static final String pass = "12345";

    public PolicyDAO() {}

    // 목록 조회 → 지역, 카테고리 선택 여부에 따라 동적 조건 적용
    public List<PolicyDTO> findPolicies(Integer regionId, Integer categoryId, String keyword) throws SQLException {
        List<PolicyDTO> results = new ArrayList<>();
        StringBuilder sql = new StringBuilder(
                "SELECT policy_id, title, content, region_id, category_id, keyword, created_at, likes " +
                "FROM policy WHERE 1=1"
            );

            if (regionId != null) sql.append(" AND region_id = ?");
            if (categoryId != null) sql.append(" AND category_id = ?");
            if (keyword != null && !keyword.isEmpty()) {
                sql.append(" AND (title LIKE ? OR content LIKE ? OR keyword LIKE ?)");
            }

            try (Connection conn = DriverManager.getConnection(url, user, pass);
                 PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {

                int idx = 1;
                if (regionId != null) pstmt.setInt(idx++, regionId);
                if (categoryId != null) pstmt.setInt(idx++, categoryId);
                if (keyword != null && !keyword.isEmpty()) {
                    String like = "%" + keyword + "%";
                    pstmt.setString(idx++, like);
                    pstmt.setString(idx++, like);
                    pstmt.setString(idx++, like);
                }

                try (ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        PolicyDTO dto = new PolicyDTO();
                        dto.setPolicyId(rs.getInt("policy_id"));
                        dto.setTitle(rs.getString("title"));
                        dto.setContent(rs.getString("content"));
                        dto.setRegionId(rs.getInt("region_id"));
                        dto.setCategoryId(rs.getInt("category_id"));
                        dto.setKeyword(rs.getString("keyword"));
                        dto.setCreatedAt(rs.getString("created_at"));
                        dto.setLikes(rs.getInt("likes"));
                        results.add(dto);
                    }
                }
            }
            return results;
        }

    // 상세 조회 → policy_id 단일 정책 불러오기
    public PolicyDTO findPolicyDetail(int policyId) throws SQLException {
        PolicyDTO dto = null;
        String sql = "SELECT * FROM policy WHERE policy_id = ?";

        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, policyId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    dto = new PolicyDTO();
                    dto.setPolicyId(rs.getInt("policy_id"));
                    dto.setTitle(rs.getString("title"));
                    dto.setContent(rs.getString("content"));
                    dto.setApplicationLink(rs.getString("application_link"));
                    dto.setApplicationStart(rs.getString("application_start"));
                    dto.setApplicationEnd(rs.getString("application_end"));
                    dto.setLikes(rs.getInt("likes"));
                    dto.setRegionId(rs.getInt("region_id"));
                    dto.setCategoryId(rs.getInt("category_id"));
                    dto.setKeyword(rs.getString("keyword"));
                    dto.setCreatedAt(rs.getString("created_at"));
                }
            }
        }
        return dto;
    }

    // 정책 추가 (관리자용)
    public void insertPolicy(PolicyDTO dto) throws SQLException {
        String sql = "INSERT INTO policy " +
                     "(title, content, application_link, application_start, application_end, region_id, category_id, keyword, created_at) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, NOW())";

        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, dto.getTitle());
            pstmt.setString(2, dto.getContent());
            pstmt.setString(3, dto.getApplicationLink());
            pstmt.setString(4, dto.getApplicationStart());
            pstmt.setString(5, dto.getApplicationEnd());
            pstmt.setInt(6, dto.getRegionId());
            pstmt.setInt(7, dto.getCategoryId());
            pstmt.setString(8, dto.getKeyword());
            // created_at은 DB에서 NOW()로 자동 입력

            pstmt.executeUpdate();
        }
    }
    
    // 좋아요 증가
    public void increaseLikes(int policyId) throws SQLException {
        String sql = "UPDATE policy SET likes = likes + 1 WHERE policy_id = ?";

        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, policyId);
            pstmt.executeUpdate();
        }
    }
}
