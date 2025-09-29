package com.infohub.project.comment.article;

import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;

@Repository
public class ArticleCommentDAO {

    // 내가 쓴 댓글 목록 조회
    public List<ArticleCommentDTO> getCommentsByUser(int loginNo) throws SQLException {
        return null;
    }

    // 내가 쓴 댓글 상세 조회
    public ArticleCommentDTO getCommentDetail(int commentId, int loginNo) throws SQLException {
        return null;
    }

    // 내가 쓴 댓글 수정
    public void updateComment(ArticleCommentDTO dto) throws SQLException {
    }

    // 내가 쓴 댓글 삭제
    public void deleteComment(int commentId, int loginNo) throws SQLException {
    }
}
