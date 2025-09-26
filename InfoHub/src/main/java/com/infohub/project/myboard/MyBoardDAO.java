package com.infohub.project.myboard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository   // 스프링 빈 등록
public class MyBoardDAO {

    @Autowired
    private DataSource dataSource;   // root-context.xml

    // 내가 쓴 게시글 목록 조회
    public List<MyBoardDTO> findBoardsByUser(int loginNo) throws SQLException {
        List<MyBoardDTO> results = new ArrayList<>();
        String sql = "SELECT boardNo, title, content, regiDate, readCnt " +
                     "FROM board WHERE login_loginNo = ? ORDER BY regiDate DESC";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, loginNo);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    MyBoardDTO dto = new MyBoardDTO();
                    dto.setBoardNo(rs.getInt("boardNo"));
                    dto.setTitle(rs.getString("title"));
                    dto.setContent(rs.getString("content"));
                    dto.setRegiDate(rs.getString("regiDate"));
                    dto.setReadCnt(rs.getInt("readCnt"));
                    dto.setLoginNo(loginNo);
                    results.add(dto);
                }
            }
        }
        return results;
    }

    // 게시글 상세 조회 // 권한 확인용 필터 //
    public MyBoardDTO findBoardDetail(int boardNo, int loginNo) throws SQLException {
        MyBoardDTO dto = null;
        String sql = "SELECT boardNo, title, content, regiDate, readCnt, login_loginNo " +
                     "FROM board WHERE boardNo = ? AND login_loginNo = ?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, boardNo);
            pstmt.setInt(2, loginNo);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    dto = new MyBoardDTO();
                    dto.setBoardNo(rs.getInt("boardNo"));
                    dto.setTitle(rs.getString("title"));
                    dto.setContent(rs.getString("content"));
                    dto.setRegiDate(rs.getString("regiDate"));
                    dto.setReadCnt(rs.getInt("readCnt"));
                    dto.setLoginNo(rs.getInt("login_loginNo"));
                }
            }
        }
        return dto;
    }

    // 게시글 수정
    public void updateBoard(MyBoardDTO dto) throws SQLException {
        String sql = "UPDATE board SET title=?, content=? WHERE boardNo=? AND login_loginNo=?";

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
        String sql = "DELETE FROM board WHERE boardNo=? AND login_loginNo=?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, boardNo);
            pstmt.setInt(2, loginNo);

            pstmt.executeUpdate();
        }
    }
}
