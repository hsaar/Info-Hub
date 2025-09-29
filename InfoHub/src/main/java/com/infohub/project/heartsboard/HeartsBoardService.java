package com.infohub.project.heartsboard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HeartsBoardService {
	
	 @Autowired
	    private HeartsBoardDAO hDao;

	    // 좋아요 토글 (누르면 추가, 다시 누르면 취소)
	    public void toggleHeart(HeartsBoardVO heart) {
	        if (hDao.existsHeart(heart)) {
	            hDao.deleteHeart(heart);
	        } else {
	        	hDao.insertHeart(heart);
	        }
	    }

	    // 특정 게시글 좋아요 수 조회
	    public int getHeartCountByBoard(int boardno) {
	        return hDao.countHeartsByBoard(boardno);
	    }

}
