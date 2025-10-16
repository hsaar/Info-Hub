package com.infohub.project.boardcomment;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.infohub.project.board.BoardController;
import com.infohub.project.board.BoardService;
import com.infohub.project.board.BoardVO;
import com.infohub.project.login.LoginService;

@Controller
@RequestMapping("/comment")
public class CommentBoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Autowired
	private CommentBoardService cService;
	@Autowired
	private BoardService service;
	@Autowired
	private LoginService lService;

	@GetMapping("/comments")
	public String getComments(@RequestParam("boardno") int boardno, Model model, HttpSession session) {
		List<CommentBoardVO> comments = cService.getComments(boardno);
		model.addAttribute("comments", comments);

		Integer loginNo = (Integer) session.getAttribute("loginNo");
		model.addAttribute("loginNo", loginNo);

		String loginUser = (String) session.getAttribute("loginUser");
		model.addAttribute("loginUser", loginUser);

		BoardVO board = service.getDetail(boardno);
		model.addAttribute("board", board);
		return "board/boardreply";
	}

	@ResponseBody
	@PostMapping("/add")
	public String addComment(@RequestBody CommentBoardVO comment, HttpSession session) {
		Integer loginNo = (Integer) session.getAttribute("loginNo");

		if (loginNo == null) {
			System.out.println("로그인 세션 정보(loginNo 또는 loginUser)가 없습니다.");
			return "NOT_LOGGED_IN"; // (실제 로그인 구현 시)
		}

		comment.setLoginNo(loginNo);
		cService.addComment(comment);
		System.out.println("댓글 작성자 세션 loginNo: " + loginNo);
		System.out.println("댓글 내용: " + comment.getComment());
		System.out.println("댓글 작성 성공: [loginNo: " + loginNo + "]");
		return "success";
	}

	@ResponseBody
	@PostMapping("/update")
	// [수정] AJAX 요청의 form data를 CommentBoardVO 객체로 받습니다.
	public String updateComment(@RequestBody CommentBoardVO comment, HttpSession session) {
		Integer loginNo = (Integer) session.getAttribute("loginNo"); // 실제 로그인 시 사용

		if (loginNo == null) {
			return "NOT_LOGGED_IN";
		}

		CommentBoardVO dbComment = cService.getCommentById(comment.getCommentId());

		if (dbComment == null || !dbComment.getLoginNo().equals(loginNo)) {
			return "UNAUTHORIZED";
		}
// 수정 VO에 로그인 번호 설정
		comment.setLoginNo(loginNo);
		comment.setLastModified(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));

		cService.updateComment(comment);
		return "SUCCESS";
	}

	// 댓글삭제
	@ResponseBody
	@PostMapping("/delete")
	public String deleteComment(@RequestBody CommentBoardVO comment, HttpSession session) {
		Integer loginNo = (Integer) session.getAttribute("loginNo");

		if (loginNo == null)
			return "NOT_LOGGED_IN";

		comment.setLoginNo(loginNo);
		int result = cService.deleteComment(comment);

		if (result > 0)
			return "SUCCESS";
		else
			return "FAIL_NO_PERMISSION";
	}

}
