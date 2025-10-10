package com.infohub.project.comment.article;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("article/comments")
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
        return "mypage/my_comment"; // 뷰 이름
    }

    // 내가 쓴 댓글 상세 조회 → 해당 기사로 이동
    @GetMapping("/detail/{commentId}")
    public String getMyCommentDetail(@PathVariable int commentId, @RequestParam int loginNo, Model model) throws SQLException {
        ArticleCommentDTO comment = service.getMyCommentDetail(commentId, loginNo);
        model.addAttribute("comment", comment);
        return "mypage/my_comment";
    }
    
    @GetMapping("/api")
    @ResponseBody
    public List<ArticleCommentDTO> getArticleComments(HttpSession session) throws SQLException {
        Integer loginNo = (Integer) session.getAttribute("loginNo");
        if (loginNo == null) {
            // 로그인 안 된 경우 빈 리스트 반환
            return List.of();
        }

        return service.getMyComments(loginNo);
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
        return "redirect:/article/comments/my?loginNo=" + loginNo;
    }

}
