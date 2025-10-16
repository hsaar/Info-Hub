package com.infohub.project.boardcomment;

import java.util.HashMap;
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
	// 인터페이스의 시그니처를 그대로 따릅니다.
	public int updateCommentAsDeleted(CommentBoardVO comment) {
		return sqlsession.update(nameSpace + ".updateCommentAsDeleted", comment);
	}

	@Override
	public int deletePhysicalComment(CommentBoardVO comment) {
		return sqlsession.delete(nameSpace + ".deletePhysicalComment", comment);
	}

	@Override
	public int countReplies(CommentBoardVO comment) {
		return sqlsession.selectOne(nameSpace + ".countReplies", comment);
	}

	@Override
	public int deleteRepliesByBoardno(int boardno) {
		// TODO Auto-generated method stub
		return sqlsession.delete(nameSpace + ".deleteRepliesByBoardno", boardno);
	}

	@Override
	public int deleteRootsByBoardno(int boardno) {
		// TODO Auto-generated method stub
		return sqlsession.delete(nameSpace + ".deleteRootsByBoardno", boardno);
	}

	@Override
	public List<CommentBoardVO> getRepliesByCommentId(int commentId) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(nameSpace + ".getRepliesByCommentId", commentId);
	}

}
