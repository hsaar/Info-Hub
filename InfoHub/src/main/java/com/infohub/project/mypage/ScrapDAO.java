package com.infohub.project.mypage;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ScrapDAO {
    private static final String url = "jdbc:mysql://192.168.0.16:3306/policy?serverTimezone=UTC";
    private static final String user = "avangers5";
    private static final String pass = "12345";

    // 스크랩 추가 (정책)
    public void addPolicyScrap(int loginId, int policyId) throws SQLException {
        String sql = "INSERT INTO scraps (login_login_id, policy_id, created_date) VALUES (?, ?, NOW())";

        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, loginId);
            pstmt.setInt(2, policyId);
            pstmt.executeUpdate();
        }
    }

    // 스크랩 추가 (기사)
    public void addArticleScrap(int loginId, int articleId) throws SQLException {
        String sql = "INSERT INTO scraps (login_login_id, article_id, created_date) VALUES (?, ?, NOW())";

        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, loginId);
            pstmt.setInt(2, articleId);
            pstmt.executeUpdate();
        }
    }

    // 스크랩 목록 (정책)
    public List<ScrapDTO> getPolicyScrapsByUser(int loginId) throws SQLException {
        List<ScrapDTO> results = new ArrayList<>();
        String sql = "SELECT s.scraps_id, s.created_date, p.policy_id, p.title, p.content " +
                     "FROM scraps s JOIN policy p ON s.policy_id = p.policy_id " +
                     "WHERE s.login_login_id = ? ORDER BY s.created_date DESC";

        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, loginId);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    ScrapDTO dto = new ScrapDTO();
                    dto.setScrapId(rs.getInt("scraps_id"));
                    dto.setCreatedAt(rs.getString("created_date"));
                    dto.setPolicyId(rs.getInt("policy_id"));
                    dto.setPolicyTitle(rs.getString("title"));
                    dto.setPolicyContent(rs.getString("content"));
                    results.add(dto);
                }
            }
        }
        return results;
    }

    // 스크랩 목록 (기사)
    public List<ScrapDTO> getArticleScrapsByUser(int loginId) throws SQLException {
        List<ScrapDTO> results = new ArrayList<>();
        String sql = "SELECT s.scraps_id, s.created_date, a.article_id, a.title, a.content, a.image " +
                     "FROM scraps s JOIN article a ON s.article_id = a.article_id " +
                     "WHERE s.login_login_id = ? ORDER BY s.created_date DESC";

        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, loginId);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    ScrapDTO dto = new ScrapDTO();
                    dto.setScrapId(rs.getInt("scraps_id"));
                    dto.setCreatedAt(rs.getString("created_date"));
                    dto.setArticleId(rs.getInt("article_id"));
                    dto.setArticleTitle(rs.getString("title"));
                    dto.setArticleContent(rs.getString("content"));
                    dto.setArticleImage(rs.getString("image"));
                    results.add(dto);
                }
            }
        }
        return results;
    }

    // 스크랩 삭제
    public void deleteScrap(int scrapId) throws SQLException {
        String sql = "DELETE FROM scraps WHERE scraps_id = ?";
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, scrapId);
            pstmt.executeUpdate();
        }
    }
}
