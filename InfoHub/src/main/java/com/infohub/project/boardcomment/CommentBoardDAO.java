package com.infohub.project.boardcomment;

import java.util.List;

public interface CommentBoardDAO {
	 List<CommentBoardVO> getCommentsByboardno(int boardno);
	    void insertComment(CommentBoardVO comment);
	  CommentBoardVO getCommentById(int commentId);
	  void updateComment(CommentBoardVO comment);
	    void deleteComment(int commentId);
	  int deleteAll(int boardno);
	    List<CommentBoardVO> getRepliesByCommentId(int commentId);
}
