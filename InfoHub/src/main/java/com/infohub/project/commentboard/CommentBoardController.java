package com.infohub.project.commentboard;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.infohub.project.board.BoardVO;

@Controller
@RequestMapping("/comment")
public class CommentBoardController {
	@Autowired
	private CommentBoardService cService;

	@GetMapping("/comments")
	public String getComments(@RequestParam int boardNo, Model model) {
	    List<CommentBoardVO> comments = cService.getComments(boardNo);
	    model.addAttribute("comments", comments);
	    return "board/boardreply"; // 댓글 목록 부분만 포함하는 JSP
	}
	

	@PostMapping("/add")
	public String addComment(@ModelAttribute CommentBoardVO comment, RedirectAttributes redirectAttributes) {
	    cService.addComment(comment);
	    System.out.println("comment.getBoardNo() 값: " + comment.getBoardNo());
	    // detail 컨트롤러가 기대하는 'boardno' 이름으로 파라미터 추가
	    redirectAttributes.addAttribute("boardno", comment.getBoardNo());
	    return "redirect:/board/detail";
	}
	@PostMapping("/update")
	public String updateComment(CommentBoardVO comment, HttpSession session) {
		Integer loginNo = (Integer) session.getAttribute("loginNo");

		if (loginNo == null) {
			return "redirect:/login";
		}
		

		CommentBoardVO dbComment = cService.getCommentById(comment.getCommentId());

		if (dbComment.getLoginNo() != (loginNo)) {
			return "redirect:/board/detail?boardNo=" + comment.getBoardNo() + "&error=unauthorized";
		}
		cService.updateComment(comment);
		return "redirect:/board/detail?boardNo=" + comment.getBoardNo();
	}

	@PostMapping("/delete")
	public String deleteComment(@RequestParam int commentId, @RequestParam int boardNo) {
		cService.removeComment(commentId);
		return "redirect:/board/detail?boardNo=" + boardNo;
	}
}
