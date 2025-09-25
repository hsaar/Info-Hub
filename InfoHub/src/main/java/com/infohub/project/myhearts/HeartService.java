package com.infohub.project.myhearts;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service   // 서비스 계층 등록
public class HeartService {

    @Autowired
    private HeartDAO dao;

    // 기사 좋아요 추가
    public void addHeart(int loginNo, int articleId) throws SQLException {
        dao.addHeart(loginNo, articleId);
    }

    // 내가 좋아요 누른 기사 목록
    public List<HeartDTO> getHeartsByUser(int loginNo) throws SQLException {
        return dao.getHeartsByUser(loginNo);
    }

    // 좋아요 취소
    public void deleteHeart(int heartNo) throws SQLException {
        dao.deleteHeart(heartNo);
    }
}
