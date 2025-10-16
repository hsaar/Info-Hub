package com.infohub.project.boardcomment;

import java.util.List;

public interface CommentBoardService {
	List<CommentBoardVO> getComments(int boardno);
	CommentBoardVO getCommentById(int commentId);
	 void updateComment(CommentBoardVO comment);
    void addComment(CommentBoardVO comment);
    int deleteComment(CommentBoardVO comment);
    void deleteAllComments(int boardno);
}
