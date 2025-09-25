package com.infohub.project.myhearts;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository   // 스프링 빈 등록
public class HeartDAO {

    @Autowired
    private DataSource dataSource;   // root-context.xml

    // 좋아요 추가
    public void addHeart(int loginNo, int articleId) throws SQLException {
        String sql = "INSERT INTO hearts (login_loginNo, article_articleId, createdDate) VALUES (?, ?, NOW())";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, loginNo);
            pstmt.setInt(2, articleId);
            pstmt.executeUpdate();
        }
    }

    // 내가 누른 기사 좋아요 목록
    public List<HeartDTO> getHeartsByUser(int loginNo) throws SQLException {
        List<HeartDTO> results = new ArrayList<>();
        String sql = "SELECT h.heartNo, h.createdDate, a.articleId, a.title, a.content, a.image " +
                     "FROM hearts h JOIN article a ON h.article_articleId = a.articleId " +
                     "WHERE h.login_loginNo = ? ORDER BY h.createdDate DESC";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, loginNo);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    HeartDTO dto = new HeartDTO();
                    dto.setHeartNo(rs.getInt("heartNo"));
                    dto.setCreatedDate(rs.getString("createdDate"));
                    dto.setArticleId(rs.getInt("articleId"));
                    dto.setArticleTitle(rs.getString("title"));
                    dto.setArticleContent(rs.getString("content"));
                    dto.setArticleImage(rs.getString("image"));
                    dto.setLoginNo(loginNo);
                    results.add(dto);
                }
            }
        }
        return results;
    }

    // 좋아요 삭제
    public void deleteHeart(int heartNo) throws SQLException {
        String sql = "DELETE FROM hearts WHERE heartNo = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, heartNo);
            pstmt.executeUpdate();
        }
    }
}
