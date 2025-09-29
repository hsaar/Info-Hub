package com.infohub.project.comment.article;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;
import java.util.List;

@Controller
@RequestMapping("/comments")
public class ArticleCommentController {

    private final ArticleCommentService service;

    @Autowired
    public ArticleCommentController(ArticleCommentService service) {
        this.service = service;
    }

    // 내가 쓴 댓글 목록 조회
    @GetMapping("/my")
    public String getMyComments(@RequestParam int loginNo, Model model) throws SQLException {
        List<ArticleCommentDTO> comments = service.getMyComments(loginNo);
        model.addAttribute("comments", comments);
        return "comment/myComments"; // 뷰 이름 (JSP/Thymeleaf)
    }

    // 내가 쓴 댓글 상세 조회 → 해당 기사로 이동
    @GetMapping("/detail/{commentId}")
    public String getMyCommentDetail(@PathVariable int commentId, @RequestParam int loginNo, Model model) throws SQLException {
        ArticleCommentDTO comment = service.getMyCommentDetail(commentId, loginNo);
        model.addAttribute("comment", comment);
        return "comment/commentDetail";
    }

    // 내가 쓴 댓글 수정
    @PostMapping("/update")
    public String updateMyComment(@ModelAttribute ArticleCommentDTO dto) throws SQLException {
        service.updateMyComment(dto);
        return "redirect:/comments/my?loginNo=" + dto.getLoginNo();
    }

    // 내가 쓴 댓글 삭제
    @PostMapping("/delete/{commentId}")
    public String deleteMyComment(@PathVariable int commentId, @RequestParam int loginNo) throws SQLException {
        service.deleteMyComment(commentId, loginNo);
        return "redirect:/comments/my?loginNo=" + loginNo;
    }
}
