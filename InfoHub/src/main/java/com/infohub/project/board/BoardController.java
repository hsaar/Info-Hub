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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.infohub.project.category.CategoryVO;
import com.infohub.project.commentboard.CommentBoardService;
import com.infohub.project.commentboard.CommentBoardVO;
import com.infohub.project.category.CategoryService;

import com.infohub.project.board.BoardController;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Autowired
	BoardService service;
	@Autowired
	CategoryService cService;
	@Autowired
	CommentBoardService rService;

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
	public ModelAndView list(@RequestParam(value = "categoryId", required = false) Integer categoryId) {
		logger.info("====list=====");
		ModelAndView mav = new ModelAndView();

		List<BoardVO> list = service.list(); // 필요하다면 categoryId 조건도 추가
		mav.addObject("list", list);

		// 실제 JSP 경로: /WEB-INF/views/board/boardlist.jsp
		mav.setViewName("board/boardlist");
		return mav;
	}

	 // 카테고리별 인기글
    @GetMapping("/popularByCategory/{categoryId}")
    public String getPopularBoardsByCategory(@PathVariable int categoryId, Model model) {
        List<BoardVO> boardList = service.selectPopularBoardsByCategory(categoryId);
        model.addAttribute("boardList", boardList);
        model.addAttribute("category", categoryId);
        return "board/boardlist";
    }
	
	
    // ✅ 전체 인기글
    @GetMapping("/popular")
    public String getPopularBoards(Model model) {
        List<BoardVO> boardList = service.getPopularBoards();
        model.addAttribute("boardList", boardList);
        model.addAttribute("popular", true);
        return "board/boardlist";
    }
	
	// 게시글 조회(log4jdbc 4.1이상에서 작동함 log4jdbc-log4j2-jdbc4.1)
	@RequestMapping(value = "board/detail", method = RequestMethod.GET)
	public String detail(@RequestParam("boardno") int boardno,
			@RequestParam(value = "categoryId", required = false) Integer categoryId, Model model,
			RedirectAttributes rttr) {

		service.updateReadCnt(boardno);
		BoardVO boardVO = service.getDetail(boardno);
		 //List<CommentBoardVO> comments = rService.getComments(boardno);
		
		model.addAttribute("board", boardVO);
		model.addAttribute("categoryId", categoryId); // 뷰에서도 categoryId 쓸 수 있게 전달
		 //model.addAttribute("comments", comments);
		// 1. (추가된 부분) 게시글이 존재하지 않으면 목록으로 리다이렉트
		if (boardVO == null) {
			rttr.addFlashAttribute("msg", "존재하지 않거나 삭제된 게시글입니다.");
			// (수정된 부분) categoryId의 유무에 따라 리다이렉트 경로 결정
			if (categoryId != null) {
				// 카테고리 ID가 있으면 해당 카테고리 목록으로 이동
				// URL 형식: /board/listcategory?category=1
				return "redirect:listcategory?category=" + categoryId;
			} else {
				// 카테고리 ID가 없으면 전체 목록 페이지로 이동
				// URL 형식: /board/list
				return "redirect:list";
			}
		}

		// 3. 정상 조회 시 Model에 데이터 추가 및 상세 페이지 뷰 반환
		model.addAttribute("board", boardVO);
		model.addAttribute("categoryId", categoryId); // 뷰에서도 categoryId 쓸 수 있게 전달

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
		boardVO.setLogin_loginNo(1); // 예: 관리자 계정 ID
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
			@RequestParam(value = "categoryId", required = false) Integer categoryId, RedirectAttributes rttr) {

		int r = service.delete(boardno);

		if (r > 0) {
			rttr.addFlashAttribute("msg", "글삭제에 성공하였습니다.");
			// **수정된 부분 1: 삭제 성공 시**
			// 카테고리 ID가 있으면 listcategory로, 없으면 전체 목록(list)으로 리다이렉트
			if (categoryId != null) {
				// 예시 URL: /board/listcategory?category=1
				return "redirect:listcategory?category=" + categoryId;
			}
			// 전체 게시판 목록으로 이동 (listcategory가 아닌 경우, 현재 list 매핑을 사용)
			return "redirect:list";
		}

		// **수정된 부분 2: 삭제 실패 시**
		rttr.addFlashAttribute("msg", "글삭제에 실패하였습니다.");

		// 카테고리 ID가 있으면 해당 카테고리 목록으로 돌아감
		if (categoryId != null) {
			// 예시 URL: /board/listcategory?category=1
			return "redirect:listcategory?category=" + categoryId;
		}
		// 카테고리 ID가 없거나 null이면, 원래 로직대로 상세 페이지를 유지하거나 (원래 의도),
		// 전체 목록으로 이동하는 것도 고려할 수 있습니다. 여기서는 상세 페이지 유지 로직을 따릅니다.
		// 참고: 글이 삭제되지 않았으므로 상세 페이지를 보여주는 것이 타당함.
		return "redirect:detail?boardno=" + boardno;
	}
}// controllerend