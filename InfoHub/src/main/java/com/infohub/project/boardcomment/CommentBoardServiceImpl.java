package com.infohub.project.boardcomment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CommentBoardServiceImpl implements CommentBoardService {
	@Autowired
	private CommentBoardDAO cDAO;

	@Override
	public List<CommentBoardVO> getComments(int boardno) {
		List<CommentBoardVO> comments = cDAO.getCommentsByboardno(boardno);
		// 각 댓글에 대댓글 연결
		for (CommentBoardVO comment : comments) {
			comment.setReplies(cDAO.getRepliesByCommentId(comment.getCommentId()));
		}
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
	@Transactional // 댓글의 삭제/업데이트는 하나의 트랜잭션으로 처리
	public int deleteComment(CommentBoardVO comment) {
		int replyCount = cDAO.countReplies(comment);
		int result = 0;
		if (replyCount > 0) {
			// 2-1. 대댓글 존재 → 숨김 처리
			result = cDAO.updateCommentAsDeleted(comment);
		} else {
			// 2-2. 대댓글 없음 → 물리 삭제
			result = cDAO.deletePhysicalComment(comment);
		}

		return result;
	}

	

	@Transactional
	@Override
	public void deleteAllComments(int boardno) {
		// 1. 대댓글 먼저 삭제 (자식)
		cDAO.deleteRepliesByBoardno(boardno);

		// 2. 원 댓글 나중에 삭제 (부모)
		cDAO.deleteRootsByBoardno(boardno);
	}

	@Override
	public CommentBoardVO getCommentById(int commentId) {
		// TODO Auto-generated method stub
		return cDAO.getCommentById(commentId);
	}

}
