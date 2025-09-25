package com.infohub.project.comment.article;

import java.sql.SQLException;
import java.util.List;

public class ArticleCommentService {

    private final ArticleCommentDAO dao;

    public ArticleCommentService(ArticleCommentDAO dao) {
        this.dao = dao;
    }

    // 내가 쓴 댓글 목록 조회
    public List<ArticleCommentDTO> getMyComments(int loginNo) throws SQLException {
        return dao.getCommentsByUser(loginNo);
    }

    // 내가 쓴 댓글 상세 조회
    public ArticleCommentDTO getMyCommentDetail(int commentId, int loginNo) throws SQLException {
        return dao.getCommentDetail(commentId, loginNo);
    }

    // 내가 쓴 댓글 수정
    public void updateMyComment(ArticleCommentDTO dto) throws SQLException {
        dao.updateComment(dto);
    }

    // 내가 쓴 댓글 삭제
    public void deleteMyComment(int commentId, int loginNo) throws SQLException {
        dao.deleteComment(commentId, loginNo);
    }
}
