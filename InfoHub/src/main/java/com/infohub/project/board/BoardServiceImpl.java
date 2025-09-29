package com.infohub.project.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDAO dao;

	@Override
	public List<BoardVO> list() {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public List<BoardVO> getListByCategory(int categoryId) throws Exception {
		// TODO Auto-generated method stub
		return dao.getListByCategory(categoryId);
	}

	@Override
	public void updateReadCnt(int boardNo) {
		// TODO Auto-generated method stub
		dao.updateReadCnt(boardNo);
	}

	@Override
	public BoardVO getDetail(int boardno) {
		// TODO Auto-generated method stub
		return dao.getDetail(boardno);
	}

	@Override
	public int register(BoardVO boardVO) throws Exception {
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
	public List<BoardVO> selectPopularBoardsByCategory(int categoryId) {
		// TODO Auto-generated method stub
		return dao.selectPopularBoardsByCategory(categoryId);
	}

	@Override
	public List<BoardVO> getPopularBoards() {
		return dao.selectPopularBoards();
	}
	@Override
	public Map login(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.login(map);
	}

}
