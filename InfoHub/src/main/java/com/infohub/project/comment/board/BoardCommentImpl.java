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

    @Override
    public List<BoardCommentDTO> getMyComments(int loginNo) throws SQLException {
        return dao.getCommentsByUser(loginNo);
    }

    @Override
    public BoardCommentDTO getMyCommentDetail(int commentId, int loginNo) throws SQLException {
        return dao.getCommentDetail(commentId, loginNo);
    }

    @Override
    public void updateMyComment(BoardCommentDTO dto) throws SQLException {
        dao.updateComment(dto);
    }

    @Override
    public void deleteMyComment(int commentId, int loginNo) throws SQLException {
        dao.deleteComment(commentId, loginNo);
    }
}
