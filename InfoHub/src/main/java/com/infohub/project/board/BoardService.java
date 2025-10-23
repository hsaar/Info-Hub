package com.infohub.project.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface BoardService {
	// 삽입, 삭제, 갱신(수정) 메소드의 리턴타입은 되도록이면 int
	
	//전체목록을 가져오는 메소드
			public List<BoardVO> list();
			
			//리스트페이징
			 List<BoardVO> listPage(Integer categoryId, String keyword, String sort, int page, int size);
			    int count(Integer categoryId, String keyword);
			//전체인기글
			public List<BoardVO> getPopularBoards();
			
			//카테고리 별 글목록
			public List<BoardVO> getListByCategory(@Param("categoryId") int categoryId) throws Exception;
			
			// 조회수 1 증가(Increases the read count of a post by 1)+ 단일 게시글 조회
			void updateReadCnt(int boardno);  //조회수 증가
			public BoardVO getDetail(int boardno);  //getRead(), getView()
			
			
			// 글추가 insert
			public int register(BoardVO boardVO)throws Exception ;
		
			
			// 글수정
			public int update(BoardVO boardVO);
			
			
			//댓글+ 좋아요 + 게시글 전체삭제
			public int delete(int boardno);
			
		
			
			//로그인 처리를 위한 메소드
			public Map login(Map<String,Object> map);

		}
