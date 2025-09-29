package com.infohub.project.commentboard;

import java.util.List;

public interface CommentBoardDAO {
	 List<CommentBoardVO> getCommentsByBoardNo(int boardNo);
	    void insertComment(CommentBoardVO comment);
	  CommentBoardVO getCommentById(int commentId);
	  void updateComment(CommentBoardVO comment);
	    void deleteComment(int commentId);
	    List<CommentBoardVO> getRepliesByCommentId(int commentId);
}
