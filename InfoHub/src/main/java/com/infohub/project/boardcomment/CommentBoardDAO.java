package com.infohub.project.boardcomment;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface CommentBoardDAO {
	List<CommentBoardVO> getCommentsByboardno(int boardno);

	void insertComment(CommentBoardVO comment);

	CommentBoardVO getCommentById(int commentId);

	void updateComment(CommentBoardVO comment);

	// 물리적 삭제
    int deletePhysicalComment(CommentBoardVO comment);

    // 대댓글 달린 댓글 삭제(숨김 처리)
    int updateCommentAsDeleted(CommentBoardVO comment);

    // 남은 대댓글 수 확인
    int countReplies(CommentBoardVO comment);

	// 2. 게시글 전체 삭제 시 - 대댓글 먼저 물리적 삭제 (자식 행)
	int deleteRepliesByBoardno(int boardno);

	// 3. 게시글 전체 삭제 시 - 원 댓글 나중에 물리적 삭제 (부모 행)
	int deleteRootsByBoardno(int boardno);

	List<CommentBoardVO> getRepliesByCommentId(int commentId);
}
