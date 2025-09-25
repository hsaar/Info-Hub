package com.infohub.project.comment.board;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

public class BoardCommentDAO {

    private final DataSource dataSource;

    public BoardCommentDAO(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    // 내가 쓴 게시판 댓글 목록
    public List<BoardCommentDTO> getCommentsByUser(int loginNo) throws SQLException {
        String sql = "SELECT * FROM commentboard WHERE board_login_loginNo = ? ORDER BY createdDate DESC";
        List<BoardCommentDTO> list = new ArrayList<>();

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, loginNo);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    BoardCommentDTO dto = new BoardCommentDTO();
                    dto.setCommentId(rs.getInt("commentId"));
                    dto.setComment(rs.getString("comment"));
                    dto.setCreatedDate(rs.getTimestamp("createdDate").toLocalDateTime());
                    dto.setLastModified(rs.getTimestamp("lastModified").toLocalDateTime());
                    dto.setLoginNo(rs.getInt("board_login_loginNo")); // 작성자
                    dto.setBoardId(rs.getInt("board_boardNo"));       // 댓글이 달린 게시글 번호
                    list.add(dto);
                }
            }
        }
        return list;
    }

    // 내가 쓴 댓글 상세 조회 → 해당 게시물로 이동
    public BoardCommentDTO getCommentDetail(int commentId, int loginNo) throws SQLException {
        String sql = "SELECT * FROM commentboard WHERE commentId = ? AND board_login_loginNo = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, commentId);
            ps.setInt(2, loginNo);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new BoardCommentDTO(
                            rs.getInt("commentId"),
                            rs.getString("comment"),
                            rs.getTimestamp("createdDate").toLocalDateTime(),
                            rs.getTimestamp("lastModified").toLocalDateTime(),
                            rs.getInt("board_login_loginNo"),
                            rs.getInt("board_boardNo")
                    );
                }
            }
        }
        return null;
    }

    // 내가 쓴 댓글 수정
    public void updateComment(BoardCommentDTO dto) throws SQLException {
        String sql = "UPDATE commentboard SET comment=?, lastModified=NOW() " +
                     "WHERE commentId=? AND board_login_loginNo=?";
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
        String sql = "DELETE FROM commentboard WHERE commentId=? AND board_login_loginNo=?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, commentId);
            ps.setInt(2, loginNo);
            ps.executeUpdate();
        }
    }
}
