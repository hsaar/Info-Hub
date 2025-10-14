package com.infohub.project.comment.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
public class BoardCommentImpl implements BoardCommentService {

    private final BoardCommentDAO dao;

    @Autowired
    public BoardCommentImpl(BoardCommentDAO dao) {
        this.dao = dao;
    }

    // 내가 쓴 댓글 목록 조회
    @Override
    public List<BoardCommentDTO> getMyComments(int loginNo) throws SQLException {
        return dao.getCommentsByUser(loginNo);
    }

    // 삭제 기능만 사용
    @Override
    public void deleteMyComment(int commentId, int loginNo) throws SQLException {
        dao.deleteComment(commentId, loginNo);
    }

    @Override
    public BoardCommentDTO getMyCommentDetail(int commentId, int loginNo) {
        throw new UnsupportedOperationException("댓글 상세 조회는 사용하지 않음");
    }

    @Override
    public void updateMyComment(BoardCommentDTO dto) {
        throw new UnsupportedOperationException("댓글 수정은 사용하지 않음");
    }
}
