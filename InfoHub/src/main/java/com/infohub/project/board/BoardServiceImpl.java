package com.infohub.project.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardDAO dao;

	@Override
	public int boardCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.boardCount();
	}
	
	

}
