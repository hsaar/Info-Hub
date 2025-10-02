package com.infohub.project.myscraps;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository   // 스프링 빈 등록
public class ScrapDAO {

    @Autowired
    private DataSource dataSource;   // root-context.xml

    // 스크랩 추가 (정책)
    public void addPolicyScrap(int loginNo, int policyId) throws SQLException {
        String sql = "INSERT INTO scraps (loginNo, policyId, createdDate) VALUES (?, ?, NOW())";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, loginNo);
            pstmt.setInt(2, policyId);
            pstmt.executeUpdate();
        }
    }

 // 스크랩 목록 (정책)
    public List<ScrapDTO> getPolicyScrapsByUser(int loginNo) throws SQLException {
        List<ScrapDTO> results = new ArrayList<>();
        String sql = "SELECT s.scrapsNo, s.createdDate, s.policyId, " +
                     "p.title AS policyTitle, p.content AS policyContent, " +
                     "p.categoryId AS policyCategoryId, " +
                     "p.applicationEnd AS policyApplicationEnd " + 
                     "FROM scraps s " +
                     "JOIN policy p ON s.policyId = p.policyId " +
                     "WHERE s.loginNo = ? " +
                     "ORDER BY s.createdDate DESC";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, loginNo);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    ScrapDTO dto = new ScrapDTO();
                    dto.setScrapNo(rs.getInt("scrapsNo"));
                    dto.setCreatedAt(rs.getString("createdDate"));
                    dto.setPolicyId(rs.getInt("policyId"));

                    // 정책 정보
                    dto.setPolicyTitle(rs.getString("policyTitle"));
                    dto.setPolicyContent(rs.getString("policyContent"));
                    dto.setPolicyCategoryId(rs.getInt("policyCategoryId"));
                    dto.setPolicyApplicationEnd(rs.getString("policyApplicationEnd"));

                    results.add(dto);
                }
            }
        }
        return results;
    }

    // 스크랩 삭제
    public void deleteScrap(int scrapNo) throws SQLException {
        String sql = "DELETE FROM scraps WHERE scrapsNo = ?";
        try (Connection conn = dataSource.getConnection(); 
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, scrapNo);
            pstmt.executeUpdate();
        }
    }
}
