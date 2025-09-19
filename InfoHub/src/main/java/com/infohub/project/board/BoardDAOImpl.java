package com.infohub.project.board;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Inject
	private SqlSession sqlsession;
	private static final String nameSpace="com.infohub.project.BoardMapper";

	@Override
	public List<BoardVO> list() {
		// TODO Auto-generated method stub
		return sqlsession.selectList(nameSpace+".list");
	}

	@Override
	public int updateReadCnt(int boardno) {
		// TODO Auto-generated method stub
		return sqlsession.update(nameSpace+".updateReadCnt"+boardno);
	}

	@Override
	public BoardVO getDetail(int boardno) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(nameSpace+".detail",boardno);
	}

	@Override
	public int register(BoardVO boardVO) {
		// TODO Auto-generated method stub
		return sqlsession.insert(nameSpace+".register",boardVO);
	}

	@Override
	public int update(BoardVO boardVO) {
		// TODO Auto-generated method stub
		return sqlsession.update(nameSpace+".update",boardVO);
	}

	@Override
	public int delete(int boardno) {
		// TODO Auto-generated method stub
		return sqlsession.delete(nameSpace+".delete",boardno);
	}

	@Override
	public Map login(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(nameSpace+".login", map);
	}

	
}
