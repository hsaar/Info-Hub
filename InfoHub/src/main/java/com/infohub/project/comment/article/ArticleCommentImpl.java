package com.infohub.project.comment.article;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
public class ArticleCommentImpl implements ArticleCommentService {

    private final ArticleCommentDAO dao;

    @Autowired
    public ArticleCommentImpl(ArticleCommentDAO dao) {
        this.dao = dao;
    }

    @Override
    public List<ArticleCommentDTO> getMyComments(int loginNo) throws SQLException {
        return dao.getCommentsByUser(loginNo);
    }

    @Override
    public ArticleCommentDTO getMyCommentDetail(int commentId, int loginNo) throws SQLException {
        return dao.getCommentDetail(commentId, loginNo);
    }

    @Override
    public void updateMyComment(ArticleCommentDTO dto) throws SQLException {
        dao.updateComment(dto);
    }

    @Override
    public void deleteMyComment(int commentId, int loginNo) throws SQLException {
        dao.deleteComment(commentId, loginNo);
    }
}
