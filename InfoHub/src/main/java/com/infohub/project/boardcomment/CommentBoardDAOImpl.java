package com.infohub.project.boardcomment;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CommentBoardDAOImpl implements CommentBoardDAO {
	@Inject
	private SqlSession sqlsession;

	private static final String nameSpace = "com.infohub.project.boardCommentMapper";

	@Override
	public List<CommentBoardVO> getCommentsByboardno(int boardno) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(nameSpace + ".getCommentsByboardno", boardno);
	}

	@Override
	public void insertComment(CommentBoardVO comment) {
		// TODO Auto-generated method stub
		sqlsession.insert(nameSpace + ".insertComment", comment);
	}

	@Override
	public CommentBoardVO getCommentById(int commentId) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(nameSpace + ".getCommentById", commentId);
	}

	@Override
	public void updateComment(CommentBoardVO comment) {
		// TODO Auto-generated method stub
		sqlsession.update(nameSpace + ".updateComment", comment);
	}

	@Override
	public int deleteComment(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return sqlsession.delete(nameSpace + ".deleteComment", params);
	}

	@Override
	public int deleteAll(int boardno) {
		// TODO Auto-generated method stub
		return sqlsession.delete(nameSpace + ".deleteAll", boardno);
	}

	@Override
	public List<CommentBoardVO> getRepliesByCommentId(int commentId) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(nameSpace + ".getRepliesByCommentId", commentId);
	}

}
