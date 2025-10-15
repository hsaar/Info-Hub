package com.infohub.project.boardcomment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentBoardServiceImpl implements CommentBoardService {
	@Autowired
	private CommentBoardDAO cDAO;

	@Override
	public List<CommentBoardVO> getComments(int boardno) {
		List<CommentBoardVO> comments = cDAO.getCommentsByboardno(boardno);
		// 각 댓글에 대댓글 연결
//		for (CommentBoardVO comment : comments) {
//			comment.setReplies(cDAO.getRepliesByCommentId(comment.getCommentId()));
//		}
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
	public boolean removeComment(int commentId, Integer loginNo) {
		Map<String, Object> params = new HashMap<>();
	    params.put("commentId", commentId);
	    params.put("loginNo", loginNo);

	    int result = cDAO.deleteComment(params);
	    return result > 0; // 삭제된 행이 1개 이상이면 true
	}

	@Override
	public CommentBoardVO getCommentById(int commentId) {
		// TODO Auto-generated method stub
		return cDAO.getCommentById(commentId);
	}



	

	
}
