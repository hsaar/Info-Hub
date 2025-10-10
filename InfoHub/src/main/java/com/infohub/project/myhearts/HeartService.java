package com.infohub.project.myhearts;

import java.sql.SQLException;
import java.util.List;

public interface HeartService {

    // 기사 좋아요 추가
    void addHeart(int loginNo, int articleId) throws SQLException;

    // 내가 좋아요 누른 기사 목록
    List<HeartDTO> getHeartsByUser(int loginNo) throws SQLException;

    // 좋아요 취소
    void deleteHeart(int heartNo) throws SQLException;
}
