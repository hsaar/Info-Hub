package com.infohub.project.myboard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/myboard")
public class MyBoardController {

    @Autowired
    private MyBoardService service;

    // 내가 쓴 게시글 목록
    @GetMapping("/list")
    public String listMyBoards(@RequestParam("loginNo") int loginNo, Model model) {
        try {
            List<MyBoardDTO> boards = service.getMyBoards(loginNo);
            model.addAttribute("boards", boards);
            return "mypage/my_board"; // myBoardList.jsp
        } catch (SQLException e) {
            model.addAttribute("error", "DB 오류 발생");
            return "policy/error"; // error.jsp
        }
    }

    // 내가 쓴 게시글 상세 조회
    @GetMapping("/detail")
    public String boardDetail(@RequestParam("boardno") int boardno,
    						  HttpSession session,
                              Model model) {
    	Integer loginNo = (Integer)session.getAttribute("loginNo");
    	
        try {
            MyBoardDTO board = service.getBoardDetail(boardno, loginNo);
            if (board != null) {
                model.addAttribute("board", board);
                return "board/boarddetail"; 
            } else {
                model.addAttribute("error", "본인 게시글만 조회할 수 있습니다.");
                return "policy/error"; // error.jsp
            }
        } catch (SQLException e) {
            model.addAttribute("error", "DB 오류 발생");
            return "policy/error"; // error.jsp
        }
    }
    
    @GetMapping("/api")
    @ResponseBody
    public List<MyBoardDTO> getMyBoardsApi(HttpSession session) throws SQLException {
        Integer loginNo = (Integer) session.getAttribute("loginNo");
        if (loginNo == null) {
            return new ArrayList<>();
        }
        return service.getMyBoards(loginNo);
    }

    // 게시글 수정
    @PostMapping("/update")
    public String updateBoard(@ModelAttribute MyBoardDTO dto, Model model) {
        try {
            service.updateBoard(dto);
            model.addAttribute("result", "update_success");
            return "mypage/my_board"; 
        } catch (SQLException e) {
            model.addAttribute("error", "DB 오류 발생");
            return "policy/error";
        }
    }
    
    // 게시글 삭제
    @PostMapping("/delete")
    public String deleteBoard(@RequestParam("boardNo") int boardNo,
                              HttpSession session,
                              Model model) {
        Integer loginNo = (Integer) session.getAttribute("loginNo");
        if (loginNo == null) {
            model.addAttribute("error", "로그인 정보 없음");
            return "policy/error";
        }

        try {
            service.deleteBoard(boardNo, loginNo);
            model.addAttribute("result", "delete_success");
            return "mypage/my_board"; 
        } catch (SQLException e) {
            model.addAttribute("error", "DB 오류 발생");
            return "policy/error";
        }
    }

}
