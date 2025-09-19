package com.infohub.project.board;

import java.util.List;
import java.util.Map;

import com.infohub.project.board.*;

public interface BoardDAO {
	int boardCount() throws Exception;
	// 삽입, 삭제, 갱신(수정) 메소드의 리턴타입은 되도록이면 int
	
		//전체목록을 가져오는 메소드
		public List<BoardVO> list();
		
		// 단일 게시글 조회
		public int updateReadCnt(int bno);  //조회수 증가
		public BoardVO getDetail(int bno);  //getRead(), getView()
		
		// 글추가 insert
		public int register(BoardVO boardVO);
		
		// 글수정
		public int update(BoardVO boardVO);
		
		// 글삭제
		public int delete(int bno);
		
		
		//로그인 처리를 위한 메소드
		public Map login(Map<String,Object> map);

	}