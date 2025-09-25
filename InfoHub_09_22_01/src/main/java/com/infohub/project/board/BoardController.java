package com.infohub.project.board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.infohub.project.board.BoardController;

import com.infohub.project.board.BoardVO;
 


@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Autowired
	BoardService service;
	
	@GetMapping("boardmain")
	public String boardmain() {
		return "./board/boardmain";
	}

	@RequestMapping(value = "board/login", method = RequestMethod.GET)
	public String login() {
		logger.info("login view 이동");
		return "./board/login";
	}

	// 로그인
	@RequestMapping(value = "board/login", method = RequestMethod.POST)
	public String login(@RequestParam Map<String, Object> map, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws Exception {
		request.setCharacterEncoding("utf-8");
		logger.info("요청정보 받아서 보내기");
		Map user = service.login(map);

		if (user == null) { // 로그인 실패
			logger.info("로그인 안됨");
			return "redirect:login";
		} else { // 로그인 성공
			// 세션부여
			session.setAttribute("user", user);
			return "./board/redirect:/";
		}
	}

	// 로그아웃
	@RequestMapping(value = "board/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, RedirectAttributes rttr) {
		session.invalidate();
		rttr.addFlashAttribute("msg", "로그아웃되었습니다");
		return "./board/redirect:/";
	}

	// 글목록
	@RequestMapping(value = "board/list", method = RequestMethod.GET)
	public ModelAndView list() {
		logger.info("====list=====");
		ModelAndView mav = new ModelAndView();

		List<BoardVO> list = service.list();
		mav.addObject("list", list);
		mav.setViewName("list");
		return mav;
	}

	//게시글 조회
	@RequestMapping(value = "board/detail", method = RequestMethod.GET)
	public String detail(@RequestParam("bno") int bno, Model model) {

		// 비지니스모델 , 서비스
		BoardVO boardVO = service.getDetail(bno);
		service.updateReadCnt(bno);

		model.addAttribute("board", boardVO);

		return "./board/boarddetail";
	}

	// 글쓰기 페이지 이동
	@GetMapping(value = "boardpost")
	public String register(Model model) {
		logger.info("글쓰기 이동");
		 model.addAttribute("serverTime", new java.util.Date());
		return "./board/boardpost";
	}

	// 글쓰기 페이지
	@RequestMapping(value = "board/register", method = RequestMethod.POST)
	public String register(BoardVO boardVO, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		request.setCharacterEncoding("UTF-8");
		logger.info("내용" + boardVO);
		int r = service.register(boardVO);

		if (r > 0) {
			rttr.addFlashAttribute("msg", "추가에 성공하였습니다.");
		}
		return "./board/redirect:list";
	}
	
	//글수정 페이지 이동
	@RequestMapping(value = "board/update", method = RequestMethod.GET)
	public String update(@RequestParam("bno") int bno, Model model) {
		BoardVO board = service.getDetail(bno);
		model.addAttribute("board", board);
		return "./board/update";
	}
	
	//글수정
	@RequestMapping(value = "board/update", method = RequestMethod.POST)
	public String update(BoardVO boardVO, RedirectAttributes attr,HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		int r = service.update(boardVO);
		// 수정에 성공하면 목록보기로 이동
		if (r > 0) {
			attr.addFlashAttribute("msg", "수정에 성공 하였습니다.");
			return "redirect:list";
		}
		// 수정에 실패하면 수정보기 화면으로 이동
		return "redirect:update?bno=" + boardVO.getBoardno();
	}
	
	//글삭제
	@RequestMapping(value="board/delete",method = RequestMethod.GET)
	public String delete(@RequestParam("bno") int bno, RedirectAttributes rttr) {
		int r = service.delete(bno);
		
		if(r > 0) {
			rttr.addFlashAttribute("msg","글삭제에 성공하였습니다.");
			return "redirect:list";
		}
		return "redirect:detail?bno=" + bno;
	}
}
