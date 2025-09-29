package com.infohub.project.comment.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;
import java.util.List;

@Controller
@RequestMapping("/board/comments")
public class BoardCommentController {

    private final BoardCommentService service;

    @Autowired
    public BoardCommentController(BoardCommentService service) {
        this.service = service;
    }

    // 내가 쓴 댓글 목록 조회
    @GetMapping("/my")
    public String getMyComments(@RequestParam int loginNo, Model model) throws SQLException {
        List<BoardCommentDTO> comments = service.getMyComments(loginNo);
        model.addAttribute("comments", comments);
        return "boardComment/myComments"; // 뷰 이름 (JSP/Thymeleaf)
    }

    // 내가 쓴 댓글 상세 조회 → 해당 게시글로 이동
    @GetMapping("/detail/{commentId}")
    public String getMyCommentDetail(@PathVariable int commentId, @RequestParam int loginNo, Model model) throws SQLException {
        BoardCommentDTO comment = service.getMyCommentDetail(commentId, loginNo);
        model.addAttribute("comment", comment);
        return "boardComment/commentDetail";
    }

    // 내가 쓴 댓글 수정
    @PostMapping("/update")
    public String updateMyComment(@ModelAttribute BoardCommentDTO dto) throws SQLException {
        service.updateMyComment(dto);
        return "redirect:/board/comments/my?loginNo=" + dto.getLoginNo();
    }

    // 내가 쓴 댓글 삭제
    @PostMapping("/delete/{commentId}")
    public String deleteMyComment(@PathVariable int commentId, @RequestParam int loginNo) throws SQLException {
        service.deleteMyComment(commentId, loginNo);
        return "redirect:/board/comments/my?loginNo=" + loginNo;
    }
}
