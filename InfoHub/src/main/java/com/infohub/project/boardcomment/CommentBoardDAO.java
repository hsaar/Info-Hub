package com.infohub.project.boardcomment;

import java.util.List;
import java.util.Map;

public interface CommentBoardDAO {
	List<CommentBoardVO> getCommentsByboardno(int boardno);

	void insertComment(CommentBoardVO comment);

	CommentBoardVO getCommentById(int commentId);

	void updateComment(CommentBoardVO comment);

	  int deleteComment(Map<String, Object> params);
	  
	int deleteAll(int boardno);

	List<CommentBoardVO> getRepliesByCommentId(int commentId);
}
