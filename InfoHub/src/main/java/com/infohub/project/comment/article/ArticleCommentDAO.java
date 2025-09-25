package com.infohub.project.comment.article;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

public class ArticleCommentDAO {

    private final DataSource dataSource;

    public ArticleCommentDAO(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    // 내가 쓴 기사 댓글 목록
    public List<ArticleCommentDTO> getCommentsByUser(int loginNo) throws SQLException {
        String sql = "SELECT * FROM commentarticle WHERE login_loginNo = ? ORDER BY createdDate DESC";
        List<ArticleCommentDTO> list = new ArrayList<>();

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, loginNo);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ArticleCommentDTO dto = new ArticleCommentDTO();
                    dto.setCommentId(rs.getInt("commentId"));
                    dto.setComment(rs.getString("comment"));
                    dto.setCreatedDate(rs.getTimestamp("createdDate").toLocalDateTime());
                    dto.setLastModified(rs.getTimestamp("lastModified").toLocalDateTime());
                    dto.setLoginNo(rs.getInt("login_loginNo"));
                    dto.setArticleId(rs.getInt("article_articleId"));
                    list.add(dto);
                }
            }
        }
        return list;
    }

    // 내가 쓴 댓글 상세 조회
    public ArticleCommentDTO getCommentDetail(int commentId, int loginNo) throws SQLException {
        String sql = "SELECT * FROM commentarticle WHERE commentId = ? AND login_loginNo = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, commentId);
            ps.setInt(2, loginNo);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new ArticleCommentDTO(
                            rs.getInt("commentId"),
                            rs.getString("comment"),
                            rs.getTimestamp("createdDate").toLocalDateTime(),
                            rs.getTimestamp("lastModified").toLocalDateTime(),
                            rs.getInt("login_loginNo"),
                            rs.getInt("article_articleId")
                    );
                }
            }
        }
        return null;
    }

    // 내가 쓴 댓글 수정
    public void updateComment(ArticleCommentDTO dto) throws SQLException {
        String sql = "UPDATE commentarticle SET comment=?, lastModified=NOW() " +
                     "WHERE commentId=? AND login_loginNo=?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, dto.getComment());
            ps.setInt(2, dto.getCommentId());
            ps.setInt(3, dto.getLoginNo());
            ps.executeUpdate();
        }
    }

    // 내가 쓴 댓글 삭제
    public void deleteComment(int commentId, int loginNo) throws SQLException {
        String sql = "DELETE FROM commentarticle WHERE commentId=? AND login_loginNo=?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, commentId);
            ps.setInt(2, loginNo);
            ps.executeUpdate();
        }
    }
}
