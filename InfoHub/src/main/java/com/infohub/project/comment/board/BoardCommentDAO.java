package com.infohub.project.comment.board;

import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;

@Repository
public class BoardCommentDAO {

    // 내가 쓴 댓글 목록 조회
    public List<BoardCommentDTO> getCommentsByUser(int loginNo) throws SQLException {
        // DB 로직 구현
        return null;
    }

    // 내가 쓴 댓글 상세 조회
    public BoardCommentDTO getCommentDetail(int commentId, int loginNo) throws SQLException {
        // DB 로직 구현
        return null;
    }

    // 내가 쓴 댓글 수정
    public void updateComment(BoardCommentDTO dto) throws SQLException {
        // DB 로직 구현
    }

    // 내가 쓴 댓글 삭제
    public void deleteComment(int commentId, int loginNo) throws SQLException {
        // DB 로직 구현
    }
}
