package com.infohub.project.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.infohub.project.board.*;

public interface BoardDAO {
	// 삽입, 삭제, 갱신(수정) 메소드의 리턴타입은 되도록이면 int

	// 전체목록을 가져오는 메소드
	public List<BoardVO> list();
	// 전체글 리스트 페이징
	 List<BoardVO> listPage(Map<String, Object> params);
	    int count(Map<String, Object> params);
	    
	    
	 
	// 카테고리 별 글목록
	public List<BoardVO> getListByCategory(@Param("categoryId") int categoryId) throws Exception;

	// 조회수 1 증가(Increases the read count of a post by 1)+ 단일 게시글 조회
	void updateReadCnt(int boardno); // 조회수 증가

	public BoardVO getDetail(int boardno);
	

	// 글추가 insert
	public int register(BoardVO boardVO);
	
	// 글수정
	public int update(BoardVO boardVO);

	// 글삭제
	public int delete(int boardno);

	// 전체인기글
	public List<BoardVO> selectPopularBoards();

	// 로그인 처리를 위한 메소드
	public Map login(Map<String, Object> map);

}