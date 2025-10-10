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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.infohub.project.board.BoardController;
import com.infohub.project.board.BoardService;
import com.infohub.project.board.BoardVO;

@Controller
@RequestMapping("/comment")
public class CommentBoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Autowired
	private CommentBoardService cService;
	@Autowired
	private BoardService service;

	@GetMapping("/comments")
	public String getComments(@RequestParam("boardno") int boardno, Model model, HttpSession session) {
	    List<CommentBoardVO> comments = cService.getComments(boardno);
	    model.addAttribute("comments", comments);

	    // ✅ 세션 로그인 번호도 전달
	    Integer loginNo = (Integer) session.getAttribute("loginNo");
	    model.addAttribute("loginNo", loginNo);

	    // ✅ board도 다시 넣어줘야 JSP 내부 JSTL이 정상 동작
	    BoardVO board = service.getDetail(boardno); // ← 게시판 서비스에서 가져오기
	    model.addAttribute("board", board);

	    return "board/boardreply"; // boardreply.jsp를 렌더링
	}

	@ResponseBody
	@PostMapping("/add")
	public String addComment(CommentBoardVO comment, HttpSession session,
			@RequestParam(value = "loginNo", required = false) Integer loginNoFromRequest) {
		Integer loginNo = (Integer) session.getAttribute("loginNo");
		Integer finalLoginNo = (loginNo != null) ? loginNo : loginNoFromRequest;
		if (loginNo == null) {
			return "NOT_LOGGED_IN"; // (실제 로그인 구현 시)
		}

		comment.setLoginNo(finalLoginNo);

		cService.addComment(comment);
		return "success";
	}

	@ResponseBody
	@PostMapping("/update")
	// [수정] AJAX 요청의 form data를 CommentBoardVO 객체로 받습니다.
	public String updateComment(CommentBoardVO comment, HttpSession session) {
		Integer loginNo = (Integer) session.getAttribute("loginNo"); // 실제 로그인 시 사용
		// [디버그 로그 추가 1] 들어온 데이터 확인
		System.out.println("🔥 updateComment 요청 도착: " + comment);

		if (loginNo == null) {
			return "NOT_LOGGED_IN";
		}

		CommentBoardVO dbComment = cService.getCommentById(comment.getCommentId());

		if (dbComment == null || !dbComment.getLoginNo().equals(loginNo)) {
			return "UNAUTHORIZED";
		}
// 수정 VO에 로그인 번호 설정
		comment.setLoginNo(loginNo);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		comment.setLastModified(sdf.format(new Date()));

		cService.updateComment(comment);
		return "SUCCESS";
	}

	@ResponseBody // ajax
	@PostMapping("/delete")
	public void deleteComment(@RequestParam int commentId, @RequestParam int boardno) {
		// [권장] 삭제 전 권한 체크 로직 추가 필요 (현재는 생략)
		cService.removeComment(commentId);

	}
}
