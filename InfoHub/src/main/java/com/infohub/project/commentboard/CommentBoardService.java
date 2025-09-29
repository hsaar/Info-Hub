package com.infohub.project.commentboard;

import java.util.List;

public interface CommentBoardService {
	List<CommentBoardVO> getComments(int boardNo);
	CommentBoardVO getCommentById(int commentId);
	 void updateComment(CommentBoardVO comment);
    void addComment(CommentBoardVO comment);
    void removeComment(int commentId);
}
