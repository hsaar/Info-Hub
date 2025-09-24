package com.infohub.project.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardDAO dao;

	@Override
	public List<BoardVO> list() {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public int updateReadCnt(int boardno) {
		// TODO Auto-generated method stub
		return dao.updateReadCnt(boardno);
	}

	@Override
	public BoardVO getDetail(int boardno) {
		// TODO Auto-generated method stub
		return dao.getDetail(boardno);
	}

	@Override
	public int register(BoardVO boardVO) {
		// 1. 게시글 정보를 Board 테이블에 저장 (게시글 ID가 반환되거나, VO에 자동 주입)
		int boardId=dao.register(boardVO);
		return dao.register(boardVO);
	}

	@Override
	public int update(BoardVO boardVO) {
		// TODO Auto-generated method stub
		return dao.update(boardVO);
	}

	@Override
	public int delete(int boardno) {
		// TODO Auto-generated method stub
		return dao.delete(boardno);
	}

	@Override
	public Map login(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.login(map);
	}

	
	
	

}
