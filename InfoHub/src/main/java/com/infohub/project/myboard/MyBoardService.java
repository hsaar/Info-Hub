package com.infohub.project.myboard;

import java.sql.SQLException;
import java.util.List;

public interface MyBoardService {

    // 내가 쓴 게시글 목록 조회
    List<MyBoardDTO> getMyBoards(int loginNo) throws SQLException;

    // 게시글 상세 조회
    MyBoardDTO getBoardDetail(int boardNo, int loginNo) throws SQLException;

    // 게시글 수정
    void updateBoard(MyBoardDTO dto) throws SQLException;

    // 게시글 삭제
    void deleteBoard(int boardNo, int loginNo) throws SQLException;
}
