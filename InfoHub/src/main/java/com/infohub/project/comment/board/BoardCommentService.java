package com.infohub.project.comment.board;

import java.sql.SQLException;
import java.util.List;

public class BoardCommentService {

    private final BoardCommentDAO dao;

    public BoardCommentService(BoardCommentDAO dao) {
        this.dao = dao;
    }

    // 내가 쓴 댓글 목록 조회
    public List<BoardCommentDTO> getMyComments(int loginNo) throws SQLException {
        return dao.getCommentsByUser(loginNo);
    }

    // 내가 쓴 댓글 상세 조회 → 해당 게시물로 이동
    public BoardCommentDTO getMyCommentDetail(int commentId, int loginNo) throws SQLException {
        return dao.getCommentDetail(commentId, loginNo);
    }

    // 내가 쓴 댓글 수정
    public void updateMyComment(BoardCommentDTO dto) throws SQLException {
        dao.updateComment(dto);
    }

    // 내가 쓴 댓글 삭제
    public void deleteMyComment(int commentId, int loginNo) throws SQLException {
        dao.deleteComment(commentId, loginNo);
    }
}
