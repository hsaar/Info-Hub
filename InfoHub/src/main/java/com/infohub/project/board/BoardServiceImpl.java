package com.infohub.project.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.infohub.project.boardcomment.CommentBoardDAO;
import com.infohub.project.boardcomment.CommentBoardService;
import com.infohub.project.boardhearts.HeartsBoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDAO dao;

	@Autowired
	CommentBoardDAO cDao;
	
	@Autowired
	CommentBoardService cService;
	
	@Autowired
	HeartsBoardDAO hDao;
	
	@Override
	public List<BoardVO> list() {
		// TODO Auto-generated method stub
		return dao.list();
	}
	

	  @Override
	    public List<BoardVO> listPage(Integer categoryId, String keyword, String sort, int page, int size) {
	        int offset = (page - 1) * size;

	        Map<String, Object> params = new HashMap<>();
	        params.put("categoryId", categoryId);
	        params.put("keyword", keyword);
	        params.put("sort", sort);
	        params.put("offset", offset);
	        params.put("size", size);

	        return dao.listPage(params);
	    }

	    @Override
	    public int count(Integer categoryId, String keyword) {
	        Map<String, Object> params = new HashMap<>();
	        params.put("categoryId", categoryId);
	        params.put("keyword", keyword);
	        return dao.count(params);
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
	    @Transactional // 댓글 삭제와 게시글 삭제를 하나의 트랜잭션으로 묶습니다.
	    public int delete(int boardno) { 
	        
	        // 1️⃣ 댓글 먼저 순차적으로 삭제 (Service에서 Service 호출)
	        cService.deleteAllComments(boardno); 
	        
	        // 2️⃣ 좋아요/추천 기록 삭제
	        hDao.deleteAllHeartsByBoardno(boardno);
	        
	        // 3️⃣ 게시글 삭제
	        return dao.delete(boardno);
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
