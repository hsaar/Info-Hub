package com.infohub.project.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Inject
	private SqlSession sqlsession;
	private static final String nameSpace = "com.infohub.project.boardMapper";

	@Override
	public List<BoardVO> list() {
		// TODO Auto-generated method stub
		return sqlsession.selectList(nameSpace + ".list");
	}

	@Override
	public List<BoardVO> listPage(Map<String, Object> params) {
		return sqlsession.selectList(nameSpace + ".listPage", params);
	}

	@Override
	public int count(Map<String, Object> params) {
		return sqlsession.selectOne(nameSpace + ".count", params);
	}

	@Override
	public List<BoardVO> getListByCategory(int categoryId) throws Exception {
		// SQL 쿼리를 실행하고 결과를 List<BoardVO> 형태로 반환
		return sqlsession.selectList(nameSpace + ".getListByCategory", categoryId);
	}

	@Override
	public void updateReadCnt(int boardno) {
		// TODO Auto-generated method stub
		sqlsession.update(nameSpace + ".updateReadCnt", boardno);
	}

	@Override
	public BoardVO getDetail(int boardno) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(nameSpace + ".getDetail", boardno);
	}


	@Override
	public int register(BoardVO boardVO) {
		// TODO Auto-generated method stub
		return sqlsession.insert(nameSpace + ".register", boardVO);
	}

	@Override
	public int update(BoardVO boardVO) {
		// TODO Auto-generated method stub
		return sqlsession.update(nameSpace + ".update", boardVO);
	}

	@Override
	public int delete(int boardno) {
		// TODO Auto-generated method stub
		return sqlsession.delete(nameSpace + ".delete", boardno);
	}

	@Override
	public List<BoardVO> selectPopularBoards() {
		return sqlsession.selectList(nameSpace + ".selectPopularBoards");
	}

	@Override
	public Map login(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(nameSpace + ".login", map);
	}

}
