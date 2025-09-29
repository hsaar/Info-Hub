package com.infohub.project.comment.article;

import java.sql.SQLException;
import java.util.List;

public interface ArticleCommentService {

    // 내가 쓴 댓글 목록 조회
    List<ArticleCommentDTO> getMyComments(int loginNo) throws SQLException;

    // 내가 쓴 댓글 상세 조회 → 해당 기사로 이동
    ArticleCommentDTO getMyCommentDetail(int commentId, int loginNo) throws SQLException;

    // 내가 쓴 댓글 수정
    void updateMyComment(ArticleCommentDTO dto) throws SQLException;

    // 내가 쓴 댓글 삭제
    void deleteMyComment(int commentId, int loginNo) throws SQLException;
}
