package com.infohub.project.boardhearts;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HeartsBoardDAO {

	@Autowired
	private SqlSession sqlSession;

	private static final String namespace = "com.infohub.project.boardHeartsMapper";

	public void insertHeart(HeartsBoardVO heart) {
		sqlSession.insert(namespace + ".insertHeart", heart);
	}

	public void deleteHeart(HeartsBoardVO heart) {
		sqlSession.delete(namespace + ".deleteHeart", heart);
	}

	public int countHeartsByBoard(int boardNo) {
		return sqlSession.selectOne(namespace + ".countHeartsByBoard", boardNo);
	}

	public boolean existsHeart(HeartsBoardVO heart) {
		int count = sqlSession.selectOne(namespace + ".checkHeart", heart);
		return count > 0;
	}
	
	public int deleteAllHeartsByBoardno(int boardNo) {	
		return sqlSession.delete(namespace+".deleteAllHeartsByBoardno", boardNo);
	}
	
}
