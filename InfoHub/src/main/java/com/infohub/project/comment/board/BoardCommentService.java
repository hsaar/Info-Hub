package com.infohub.project.comment.board;

import java.sql.SQLException;
import java.util.List;

public interface BoardCommentService {

    // 내가 쓴 댓글 목록 조회
    List<BoardCommentDTO> getMyComments(int loginNo) throws SQLException;

    // 내가 쓴 댓글 상세 조회 → 해당 게시글로 이동
    BoardCommentDTO getMyCommentDetail(int commentId, int loginNo) throws SQLException;

    // 내가 쓴 댓글 수정
    void updateMyComment(BoardCommentDTO dto) throws SQLException;

    // 내가 쓴 댓글 삭제
    void deleteMyComment(int commentId, int loginNo) throws SQLException;
}
