package com.infohub.project.myboard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class MyBoardDAO {

    @Autowired
    private DataSource dataSource;

    // 내가 쓴 게시글 목록 조회
    public List<MyBoardDTO> findBoardsByUser(int loginNo, String orderBy) throws SQLException {
        List<MyBoardDTO> results = new ArrayList<>();

        StringBuilder sql = new StringBuilder(
            "SELECT b.boardno, b.title, b.content, b.regiDate, b.readcnt, " +
            "COUNT(h.heartId) AS hearts, b.categoryboard_categoryId AS categoryId " +
            "FROM board b " +
            "LEFT JOIN heartsboard h ON b.boardno = h.boardNo " +
            "WHERE b.loginLoginNo = ? " +
            "GROUP BY b.boardno, b.title, b.content, b.regiDate, b.readcnt, b.categoryboard_categoryId "
        );

        if ("hearts".equals(orderBy)) {
            sql.append("ORDER BY hearts DESC, b.regiDate DESC");
        } else {
            sql.append("ORDER BY b.regiDate DESC");
        }

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {

            pstmt.setInt(1, loginNo);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    MyBoardDTO dto = new MyBoardDTO();
                    dto.setBoardNo(rs.getInt("boardno"));
                    dto.setTitle(rs.getString("title"));
                    dto.setContent(rs.getString("content"));
                    dto.setRegiDate(rs.getString("regiDate"));
                    dto.setReadCnt(rs.getInt("readcnt"));
                    dto.setLoginNo(loginNo);
                    dto.setHearts(rs.getInt("hearts"));
                    dto.setCategoryId(rs.getInt("categoryId")); // ← 추가
                    results.add(dto);
                }
            }
        }

        return results;
    }

    // 게시글 상세 조회
    public MyBoardDTO findBoardDetail(int boardNo, int loginNo) throws SQLException {
        MyBoardDTO dto = null;
        String sql = "SELECT boardno, title, content, regiDate, readcnt, loginLoginNo, categoryboard_categoryId AS categoryId " +
                     "FROM board WHERE boardno = ? AND loginLoginNo = ?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, boardNo);
            pstmt.setInt(2, loginNo);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    dto = new MyBoardDTO();
                    dto.setBoardNo(rs.getInt("boardno"));
                    dto.setTitle(rs.getString("title"));
                    dto.setContent(rs.getString("content"));
                    dto.setRegiDate(rs.getString("regiDate"));
                    dto.setReadCnt(rs.getInt("readcnt"));
                    dto.setLoginNo(rs.getInt("loginLoginNo"));
                    dto.setCategoryId(rs.getInt("categoryId")); // ← 추가
                }
            }
        }
        return dto;
    }

    // 게시글 수정
    public void updateBoard(MyBoardDTO dto) throws SQLException {
        String sql = "UPDATE board SET title=?, content=? WHERE boardno=? AND loginLoginNo=?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, dto.getTitle());
            pstmt.setString(2, dto.getContent());
            pstmt.setInt(3, dto.getBoardNo());
            pstmt.setInt(4, dto.getLoginNo());

            pstmt.executeUpdate();
        }
    }

   // 게시글 삭제
    public void deleteBoard(int boardNo, int loginNo) throws SQLException {
        try (Connection conn = dataSource.getConnection()) {
            conn.setAutoCommit(false);

            // 해당 게시글의 댓글 삭제
            String deleteCommentsSql = "DELETE FROM commentboard WHERE boardno = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(deleteCommentsSql)) {
                pstmt.setInt(1, boardNo);
                pstmt.executeUpdate();
            }

            // 게시글 삭제
            String deleteBoardSql = "DELETE FROM board WHERE boardno=? AND loginLoginNo=?";
            try (PreparedStatement pstmt = conn.prepareStatement(deleteBoardSql)) {
                pstmt.setInt(1, boardNo);
                pstmt.setInt(2, loginNo);
                pstmt.executeUpdate();
            }

            conn.commit();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

}
