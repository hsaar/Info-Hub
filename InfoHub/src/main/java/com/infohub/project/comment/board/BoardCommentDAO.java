package com.infohub.project.comment.board;

import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class BoardCommentDAO {

    private final DataSource dataSource;

    public BoardCommentDAO(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    // 내가 쓴 게시판 댓글 목록 조회
    public List<BoardCommentDTO> getCommentsByUser(int loginNo) throws SQLException {
        String sql = "SELECT commentId, loginNo, boardno, comment, createdDate, lastModified " +
                     "FROM commentboard " +
                     "WHERE loginNo = ? AND boardno IS NOT NULL " +
                     "ORDER BY createdDate DESC";

        List<BoardCommentDTO> list = new ArrayList<>();

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, loginNo);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    BoardCommentDTO dto = new BoardCommentDTO();
                    dto.setCommentId(rs.getInt("commentId"));
                    dto.setLoginNo(rs.getInt("loginNo"));
                    dto.setBoardNo(rs.getInt("boardno"));
                    dto.setContent(rs.getString("comment"));
                    dto.setCreatedAt(rs.getString("createdDate"));
                    dto.setUpdatedAt(rs.getString("lastModified"));
                    list.add(dto);
                }
            }
        }
        return list;
    }

    // 댓글 삭제
    public void deleteComment(int commentId, int loginNo) throws SQLException {
        String sql = "DELETE FROM commentboard WHERE commentId = ? AND loginNo = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, commentId);
            ps.setInt(2, loginNo);
            ps.executeUpdate();
        }
    }
}
