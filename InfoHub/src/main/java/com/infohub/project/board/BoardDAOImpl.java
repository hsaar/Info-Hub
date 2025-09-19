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
	public int boardCount() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BoardVO> list() {
		// TODO Auto-generated method stub
		return sqlsession.selectList(nameSpace+".list");
	}

	@Override
	public int updateReadCnt(int bno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BoardVO getDetail(int bno) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(nameSpace+".detail",bno);
	}

	@Override
	public int register(BoardVO boardVO) {
		// TODO Auto-generated method stub
		return sqlsession.insert(nameSpace+".register",boardVO);
	}

	@Override
	public int update(BoardVO boardVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int bno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Map login(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
