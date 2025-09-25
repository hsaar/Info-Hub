package com.infohub.project.comment.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;
import java.util.List;

@Controller
@RequestMapping("/mypage/boardComments")
public class BoardCommentController {

    @Autowired
    private BoardCommentService service;

    // 내가 쓴 게시판 댓글 목록
    @GetMapping
    public String listMyComments(@RequestParam("loginNo") int loginNo, Model model) {
        try {
            List<BoardCommentDTO> comments = service.getMyComments(loginNo);
            model.addAttribute("comments", comments);
            return "mypage/boardCommentList"; // boardCommentList.jsp
        } catch (SQLException e) {
            model.addAttribute("error", "DB 오류 발생");
            return "error";
        }
    }

    // 내가 쓴 댓글 상세 조회
    @GetMapping("/detail")
    public String commentDetail(@RequestParam("commentId") int commentId,
                                @RequestParam("loginNo") int loginNo) {
        try {
            BoardCommentDTO dto = service.getMyCommentDetail(commentId, loginNo);
            if (dto != null) {
                // 해당 댓글이 달린 게시글로 이동
                return "redirect:/board/detail?boardId=" + dto.getBoardId();
            } else {
                return "error";
            }
        } catch (SQLException e) {
            return "error";
        }
    }

    // 내가 쓴 댓글 수정
    @PostMapping("/update")
    public String updateMyComment(@ModelAttribute BoardCommentDTO dto, Model model) {
        try {
            service.updateMyComment(dto);
            // 수정 후 다시 목록으로 이동
            return "redirect:/mypage/boardComments?loginNo=" + dto.getLoginNo();
        } catch (SQLException e) {
            model.addAttribute("error", "DB 오류 발생");
            return "error";
        }
    }

    // 내가 쓴 댓글 삭제
    @PostMapping("/delete")
    public String deleteMyComment(@RequestParam("commentId") int commentId,
                                  @RequestParam("loginNo") int loginNo,
                                  Model model) {
        try {
            service.deleteMyComment(commentId, loginNo);
            // 삭제 후 다시 목록으로 이동
            return "redirect:/mypage/boardComments?loginNo=" + loginNo;
        } catch (SQLException e) {
            model.addAttribute("error", "DB 오류 발생");
            return "error";
        }
    }
}
