package com.infohub.project.policy;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository   // 스프링 빈 등록
public class PolicyDAO {

    @Autowired
    private DataSource dataSource;   // root-context.xml

    // 목록 조회 → 지역, 카테고리 조건 적용 + 정렬
    public List<PolicyDTO> findPolicies(Integer regionId, Integer categoryId, String orderBy) throws SQLException {
        List<PolicyDTO> results = new ArrayList<>();
        StringBuilder sql = new StringBuilder(
            "SELECT registrationNo, title, content, regionId, categoryId, createdAt, likes " +
            "FROM registration WHERE 1=1"
        );

        if (regionId != null) sql.append(" AND regionId = ?");
        if (categoryId != null) sql.append(" AND categoryId = ?");

        // 정렬 조건
        if ("popular".equalsIgnoreCase(orderBy)) {
            sql.append(" ORDER BY likes DESC");   // 인기순 (좋아요 기준)
        } else {
            sql.append(" ORDER BY createdAt DESC"); // 최신순 (기본값)
        }

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {

            int idx = 1;
            if (regionId != null) pstmt.setInt(idx++, regionId);
            if (categoryId != null) pstmt.setInt(idx++, categoryId);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    PolicyDTO dto = new PolicyDTO();
                    dto.setRegistrationNo(rs.getInt("registrationNo"));
                    dto.setTitle(rs.getString("title"));
                    dto.setContent(rs.getString("content"));
                    dto.setRegionId(rs.getInt("regionId"));
                    dto.setCategoryId(rs.getInt("categoryId"));
                    dto.setCreatedAt(rs.getString("createdAt"));
                    dto.setLikes(rs.getInt("likes"));
                    results.add(dto);
                }
            }
        }
        return results;
    }


    // 상세 조회 → registrationNo 단일 정책 불러오기
    public PolicyDTO findPolicyDetail(int registrationNo) throws SQLException {
        PolicyDTO dto = null;
        String sql = "SELECT registrationNo, title, content, link, " +
                     "startDate, endDate, minAge, maxAge, likes, createdAt " +
                     "FROM registration WHERE registrationNo = ?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, registrationNo);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    dto = new PolicyDTO();
                    dto.setRegistrationNo(rs.getInt("registrationNo"));
                    dto.setTitle(rs.getString("title"));
                    dto.setContent(rs.getString("content"));
                    dto.setLink(rs.getString("link"));
                    dto.setStartDate(rs.getString("startDate"));
                    dto.setEndDate(rs.getString("endDate"));
                    dto.setMinAge(rs.getInt("minAge"));
                    dto.setMaxAge(rs.getInt("maxAge"));
                    dto.setLikes(rs.getInt("likes"));
                    dto.setCreatedAt(rs.getString("createdAt"));
                }
            }
        }
        return dto;
    }

    // 정책 추가 (관리자용)
    public void insertPolicy(PolicyDTO dto) throws SQLException {
        String sql = "INSERT INTO registration " +
                     "(title, content, link, startDate, endDate, regionId, categoryId, createdAt, minAge, maxAge) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, NOW(), ?, ?)";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, dto.getTitle());
            pstmt.setString(2, dto.getContent());
            pstmt.setString(3, dto.getLink());
            pstmt.setString(4, dto.getStartDate());
            pstmt.setString(5, dto.getEndDate());
            pstmt.setInt(6, dto.getRegionId());
            pstmt.setInt(7, dto.getCategoryId());
            pstmt.setInt(8, dto.getMinAge());
            pstmt.setInt(9, dto.getMaxAge());

            pstmt.executeUpdate();
        }
    }

    // 정책 수정 (관리자용)
    public void updatePolicy(PolicyDTO dto) throws SQLException {
        String sql = "UPDATE registration SET title=?, content=?, link=?, " +
                     "startDate=?, endDate=?, regionId=?, categoryId=?, " +
                     "minAge=?, maxAge=? WHERE registrationNo=?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, dto.getTitle());
            pstmt.setString(2, dto.getContent());
            pstmt.setString(3, dto.getLink());
            pstmt.setString(4, dto.getStartDate());
            pstmt.setString(5, dto.getEndDate());
            pstmt.setInt(6, dto.getRegionId());
            pstmt.setInt(7, dto.getCategoryId());
            pstmt.setInt(8, dto.getMinAge());
            pstmt.setInt(9, dto.getMaxAge());
            pstmt.setInt(10, dto.getRegistrationNo());

            pstmt.executeUpdate();
        }
    }

    // 정책 삭제 (관리자용)
    public void deletePolicy(int registrationNo) throws SQLException {
        String sql = "DELETE FROM registration WHERE registrationNo=?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, registrationNo);
            pstmt.executeUpdate();
        }
    }

    // 좋아요 증가
    public void increaseLikes(int registrationNo) throws SQLException {
        String sql = "UPDATE registration SET likes = likes + 1 WHERE registrationNo = ?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, registrationNo);
            pstmt.executeUpdate();
        }
    }
}
