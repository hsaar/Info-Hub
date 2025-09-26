package com.infohub.project.myboard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service   // 스프링 서비스 등록
public class MyBoardService {

    @Autowired
    private MyBoardDAO dao;

    // 내가 쓴 게시글 목록 조회
    public List<MyBoardDTO> getMyBoards(int loginNo) throws SQLException {
        return dao.findBoardsByUser(loginNo);
    }

    // 게시글 상세 조회
    public MyBoardDTO getBoardDetail(int boardNo, int loginNo) throws SQLException {
        return dao.findBoardDetail(boardNo, loginNo);
    }

    // 게시글 수정
    public void updateBoard(MyBoardDTO dto) throws SQLException {
        dao.updateBoard(dto);
    }

    // 게시글 삭제
    public void deleteBoard(int boardNo, int loginNo) throws SQLException {
        dao.deleteBoard(boardNo, loginNo);
    }
}
