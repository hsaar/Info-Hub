package com.infohub.project.comment.article;

import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class ArticleCommentDAO {

    private final DataSource dataSource;

    public ArticleCommentDAO(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    // 내가 쓴 기사 댓글 목록 조회
    public List<ArticleCommentDTO> getCommentsByUser(int loginNo) throws SQLException {
        String sql = "SELECT commentId, comment, createdDate, lastModified, login_loginNo, article_articleId " +
                     "FROM commentarticle " +
                     "WHERE login_loginNo = ? " +
                     "ORDER BY createdDate DESC";

        List<ArticleCommentDTO> list = new ArrayList<>();

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, loginNo);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ArticleCommentDTO dto = new ArticleCommentDTO();
                    dto.setCommentId(rs.getInt("commentId"));
                    dto.setLoginNo(rs.getInt("login_loginNo"));
                    dto.setArticleId(rs.getInt("article_articleId"));
                    dto.setContent(rs.getString("comment"));
                    dto.setCreatedAt(rs.getString("createdDate"));
                    dto.setUpdatedAt(rs.getString("lastModified"));
                    list.add(dto);
                }
            }
        }
        return list;
    }

    // 삭제
    public void deleteComment(int commentId, int loginNo) throws SQLException {
        String sql = "DELETE FROM commentarticle WHERE commentId = ? AND login_loginNo = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, commentId);
            ps.setInt(2, loginNo);
            ps.executeUpdate();
        }
    }

    // 수정과 상세 조회는 사용하지 않음
    public void updateComment(ArticleCommentDTO dto) throws SQLException {
        throw new UnsupportedOperationException("댓글 수정은 사용하지 않음");
    }

    public ArticleCommentDTO getCommentDetail(int commentId, int loginNo) throws SQLException {
        throw new UnsupportedOperationException("댓글 상세 조회는 사용하지 않음");
    }
}
