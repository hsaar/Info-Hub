package com.infohub.project.boardhearts;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HeartsBoardService {
	
	 @Autowired
	    private HeartsBoardDAO hDao;

	    // 좋아요 토글
	    public void toggleHeart(HeartsBoardVO heart) {
	        if (hDao.existsHeart(heart)) {   // 이미 좋아요 눌렀으면
	            hDao.deleteHeart(heart);     // 취소
	        } else {
	            hDao.insertHeart(heart);     // 안 눌렀으면 추가
	        }
	    }

	    // 특정 게시글 좋아요 수
	    public int getHeartCountByBoard(int boardno) {
	        return hDao.countHeartsByBoard(boardno);
	    }

	    public boolean isLiked(int boardno, int loginNo) {
	        return hDao.isLiked(boardno, loginNo) > 0;
	    }
	    
	    // 좋아요 여부 확인용 (선택)
	    public boolean isHearted(HeartsBoardVO heart) {
	        return hDao.existsHeart(heart);
	    }
	}
