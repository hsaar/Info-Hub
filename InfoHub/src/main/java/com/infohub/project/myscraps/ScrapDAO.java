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
        String sql = "INSERT INTO scraps (login_loginNo, policy_policyId, createdDate) VALUES (?, ?, NOW())";

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
        String sql = "SELECT s.scrapsNo, s.createdDate, p.policy_policyId, p.title, p.content " +
                     "FROM scraps s JOIN policy p ON s.policy_policyId = p.policy_policyId " +
                     "WHERE s.login_loginNo = ? ORDER BY s.createdDate DESC";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, loginNo);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    ScrapDTO dto = new ScrapDTO();
                    dto.setScrapId(rs.getInt("scrapsNo"));
                    dto.setCreatedAt(rs.getString("createdDate"));
                    dto.setPolicyId(rs.getInt("policy_policyId"));
                    dto.setPolicyTitle(rs.getString("title"));
                    dto.setPolicyContent(rs.getString("content"));
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
