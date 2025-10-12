package com.infohub.project.boardcomment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentBoardServiceImpl implements CommentBoardService {
	@Autowired
	private CommentBoardDAO cDAO;

	@Override
	public List<CommentBoardVO> getComments(int boardno) {
		System.out.println("2");
		List<CommentBoardVO> comments = cDAO.getCommentsByboardno(boardno);
		// 각 댓글에 대댓글 연결
//		for (CommentBoardVO comment : comments) {
//			comment.setReplies(cDAO.getRepliesByCommentId(comment.getCommentId()));
//		}
		System.out.println("5");
		return comments;

	}

	@Override
	public void updateComment(CommentBoardVO comment) {
		// TODO Auto-generated method stub
		cDAO.updateComment(comment);
	}

	@Override
	public void addComment(CommentBoardVO comment) {
		// TODO Auto-generated method stub
		cDAO.insertComment(comment);
	}

	@Override
	public void removeComment(int commentId) {
		// TODO Auto-generated method stub
		cDAO.deleteComment(commentId);
	}

	@Override
	public CommentBoardVO getCommentById(int commentId) {
		// TODO Auto-generated method stub
		return cDAO.getCommentById(commentId);
	}



	

	
}
