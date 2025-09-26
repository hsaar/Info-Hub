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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.infohub.project.category.CategoryVO;
import com.infohub.project.category.CategoryService;

import com.infohub.project.board.BoardController;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Autowired
	BoardService service;
	@Autowired
	CategoryService cService;

	/*
	 * @RequestMapping(value = "board/login", method = RequestMethod.GET) public
	 * String login() { logger.info("login view 이동"); return "login"; }
	 * 
	 * // 로그인
	 * 
	 * @RequestMapping(value = "board/login", method = RequestMethod.POST) public
	 * String login(@RequestParam Map<String, Object> map, HttpServletRequest
	 * request, HttpServletResponse response, HttpSession session) throws Exception
	 * { request.setCharacterEncoding("utf-8"); logger.info("요청정보 받아서 보내기"); Map
	 * user = service.login(map);
	 * 
	 * if (user == null) { // 로그인 실패 logger.info("로그인 안됨"); return "redirect:login";
	 * } else { // 로그인 성공 // 세션부여 session.setAttribute("user", user); return
	 * "redirect:/"; } }
	 * 
	 * // 로그아웃
	 * 
	 * @RequestMapping(value = "board/logout", method = RequestMethod.GET) public
	 * String logout(HttpSession session, RedirectAttributes rttr) {
	 * session.invalidate(); rttr.addFlashAttribute("msg", "로그아웃되었습니다"); return
	 * "redirect:/"; }
	 */

	// 카테고리별 게시판
	@RequestMapping("board/listcategory")
	public String list(@RequestParam("category") int categoryId, Model model) throws Exception {
		List<BoardVO> list = service.getListByCategory(categoryId);
		model.addAttribute("list", list);
		model.addAttribute("category", categoryId);
		return "board/boardlist"; // jsp 하나만 사용
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

	/*
	 * //실시간 인기글 만드는중
	 * 
	 * @RequestMapping(value = "board/popular", method=RequestMethod.GET) public
	 * String list()
	 */
	// 게시글 조회
	@RequestMapping(value = "board/detail", method = RequestMethod.GET)
	public String detail(@RequestParam("boardno") int boardno, Model model) {

		// 비지니스모델 , 서비스
		service.updateReadCnt(boardno);
		BoardVO boardVO = service.getDetail(boardno);

		model.addAttribute("board", boardVO);

		return "board/boarddetail";
	}

	// 글쓰기 페이지 이동
	@RequestMapping(value = "/board/register", method = RequestMethod.GET)
	public String register(@RequestParam(value = "category", required = false) Integer categoryId, Model model) {
		// 드롭다운용 전체 카테고리 불러오기
		List<CategoryVO> mainCategories = cService.getMainCategories();
		model.addAttribute("mainCategories", mainCategories);

		// 카테고리별 게시판에서 왔을 경우 hidden으로 넘길 categoryId 세팅
		model.addAttribute("categoryId", categoryId);

		return "board/boardregister";
	}

	// 카테고리 소분류
	@RequestMapping(value = "/selectcategory/sub", method = RequestMethod.GET)
	@ResponseBody
	public List<CategoryVO> getSubCategories(@RequestParam("parentId") int parentId) {
		System.out.println("받은 parentId = " + parentId);
		return cService.getSubCategories(parentId);
	}

	@RequestMapping(value = "/board/register", method = RequestMethod.POST)
	public String register(BoardVO boardVO, RedirectAttributes rttr) throws Exception {
		// 임시 로그인 id 세팅 (나중에 로그인 구현 시 세션값으로 교체)
		boardVO.setlogin_loginNo(1); // 예: 관리자 계정 ID
		int r = service.register(boardVO);

		if (r > 0) {
			rttr.addFlashAttribute("msg", "추가에 성공하였습니다.");
		}

		// 등록한 글이 속한 카테고리 게시판으로 리다이렉트
		return "redirect:/board/listcategory?category=" + boardVO.getCategoryId();
	}

	// 글수정 페이지 이동
	@RequestMapping(value = "board/update", method = RequestMethod.GET)
	public String update(@RequestParam("boardno") int boardno, Model model) {

		// 1. 게시글 상세 정보 조회
		BoardVO boardVO = service.getDetail(boardno);
		model.addAttribute("board", boardVO);

		// 2. 드롭다운용 전체 카테고리 불러오기
		List<CategoryVO> mainCategories = cService.getMainCategories();
		model.addAttribute("mainCategories", mainCategories);

		// 3. (가장 중요한 수정 부분)
		// 기존 카테고리 JSP의 <c:if>를 활용하기 위해
		// BoardVO에서 현재 게시글의 메인 카테고리 ID를 'categoryId'라는 이름으로 Model에 추가합니다.
		// boardVO.getCategoryId() 메서드가 메인 카테고리 ID를 반환한다고 가정합니다.
		model.addAttribute("categoryId", boardVO.getCategoryId());

		// 서브 카테고리도 필요하다면 따로 currentSubCategoryId 등으로 추가하여 활용할 수 있습니다.
		// model.addAttribute("currentSubCategoryId", boardVO.getSubCategoryId());

		// (기존 코드에서 카테고리별 게시판에서 왔을 때의 categoryId 설정 부분은 주석 처리 또는 제거합니다.)
		// model.addAttribute("categoryId", categoryId);

		return "/board/boardupdate";
	}

	// 글수정
	@RequestMapping(value = "board/update", method = RequestMethod.POST)
	public String update(BoardVO boardVO, RedirectAttributes attr, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		int r = service.update(boardVO);
		// 수정에 성공하면 목록보기로 이동
		if (r > 0) {
			attr.addFlashAttribute("msg", "수정에 성공 하였습니다.");
			return "redirect:list";
		}
		// 수정에 실패하면 수정보기 화면으로 이동
		return "redirect:update?boardno=" + boardVO.getBoardno();
	}

	// 글삭제
	@RequestMapping(value = "board/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("boardno") int boardno,
			@RequestParam(value = "categoryId", required = false) Integer categoryId, // 카테고리 ID 추가
			RedirectAttributes rttr) {

		int r = service.delete(boardno);
		 if (r > 0) {
		        rttr.addFlashAttribute("msg", "글삭제에 성공하였습니다.");
		        // 삭제 성공 시 목록으로 이동 (카테고리가 있으면 카테고리 목록으로)
		        if (categoryId != null) {
		            return "redirect:list?categoryId=" + categoryId;
		        }
		        return "redirect:list"; // 카테고리가 없으면 전체 목록으로
		    }
		 // **수정된 부분:** 삭제 실패 시 페이지 유지
		    if (categoryId != null) {
		        rttr.addFlashAttribute("msg", "글삭제에 실패하였습니다.");
		        // 카테고리 정보 없이 접근했거나, 카테고리가 없는 게시판이라면 상세 페이지 유지 (원래 로직)
		        return "redirect:detail?boardno=" + boardno; 
		    }
		    // 해당 카테고리 목록 페이지로 돌아가기
	        return "redirect:list?categoryId=" + categoryId;
	}

}// controllerend