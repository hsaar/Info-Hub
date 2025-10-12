package com.infohub.project.board;

import java.util.HashMap;
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

import com.infohub.project.login.LoginDAO;
import com.mysql.cj.Session;
import com.infohub.project.board.BoardController;
import com.infohub.project.boardcategory.CategoryService;
import com.infohub.project.boardcategory.CategoryVO;
import com.infohub.project.boardcomment.CommentBoardService;
import com.infohub.project.boardcomment.CommentBoardVO;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Autowired
	BoardService service;
	@Autowired
	CategoryService cService;
	@Autowired
	CommentBoardService rService;

	@GetMapping("/listmain")
	public String listBoardMain(@RequestParam(value = "categoryId", required = false) Integer categoryId,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "sort", defaultValue = "recent") String sort,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "size", defaultValue = "10") int size, Model model) {

		if (page < 1) {
			page = 1;
		}
		List<BoardVO> list = service.listPage(categoryId, keyword, sort, page, size);

		int totalCount = service.count(categoryId, keyword);
		int totalPages = (int) Math.ceil((double) totalCount / size);
		if (totalPages == 0)
			totalPages = 1;
		int startPage = Math.max(1, page - 2);
		int endPage = Math.min(totalPages, page + 2);

		model.addAttribute("list", list);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("hasMore", page * 20 < totalCount);
		model.addAttribute("nextPage", page + 1);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageSize", size);
		model.addAttribute("categoryId", categoryId);
		model.addAttribute("keyword", keyword);
		model.addAttribute("sort", sort);
		return "board/boardlistmain";
	}

	// 카테고리 별 게시판
	@GetMapping("/list")
	public String boardList(@RequestParam(value = "categoryId", required = false) Integer categoryId,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "sort", required = false, defaultValue = "recent") String sort,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "size", required = false, defaultValue = "20") int size, Model model) {

		if (categoryId == null) {
			System.out.println("[WARN] categoryId 없음, 기본값 null");
		}
		if (sort == null || sort.isEmpty()) {
			sort = "recent";
		}
		List<BoardVO> list = service.listPage(categoryId, keyword, sort, page, size);
		int totalCount = service.count(categoryId, keyword);

		boolean hasMore = (page * size) < totalCount;

		model.addAttribute("list", list);
		model.addAttribute("currentPage", page);
		model.addAttribute("categoryId", categoryId);
		model.addAttribute("keyword", keyword);
		model.addAttribute("sort", sort);
		model.addAttribute("hasMore", hasMore);
		model.addAttribute("nextPage", page + 1);
		if (categoryId != null) {
			CategoryVO category = cService.getMainCategoryById(categoryId);
			model.addAttribute("category", category);
		}

		return "board/boardlist";
	}

	// AJAX fragment파일로
	@GetMapping("/ajaxList")
	public String ajaxList(@RequestParam(value = "categoryId", required = false) Integer categoryId,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "sort", required = false, defaultValue = "recent") String sort,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "size", required = false, defaultValue = "20") int size, Model model) {

		if (categoryId != null && categoryId == 0) {
			categoryId = null;
		}

		if (keyword != null) {
			String trimmedKeyword = keyword.trim();
			if (trimmedKeyword.isEmpty() || trimmedKeyword.equalsIgnoreCase("false")
					|| trimmedKeyword.equalsIgnoreCase("null")) {
				keyword = null;
			} else {
				keyword = trimmedKeyword; // 공백 제거 후 다시 할당
			}
		}

		List<BoardVO> list = service.listPage(categoryId, keyword, sort, page, size);
		int totalCount = service.count(categoryId, keyword);
		boolean hasMore = (page * size) < totalCount;
		int totalPages = (int) Math.ceil((double) totalCount / size);

		int pageBlock = 10; // 한 번에 보여줄 페이지 수
		int startPage = ((page - 1) / pageBlock) * pageBlock + 1;
		int endPage = Math.min(startPage + pageBlock - 1, totalPages);
		int nextPage = hasMore ? page + 1 : page;

		model.addAttribute("list", list);
		model.addAttribute("hasMore", hasMore);
		model.addAttribute("nextPage", nextPage);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("categoryId", categoryId); // fragment에서 param 대신 사용
		model.addAttribute("sort", sort); // fragment에서 param 대신 사용
		return "board/boardlistFragment";
	}

	// ✅ 전체 인기글
	@GetMapping("/popular")
	public String getPopularBoards(Model model) {
		List<BoardVO> boardList = service.getPopularBoards();
		model.addAttribute("boardList", boardList);
		model.addAttribute("popular", true);
		return "board/boardlist";
	}

	// 게시글 조회
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detail(@RequestParam(value = "boardno", required = false) Integer boardno,
			@RequestParam(value = "categoryId", required = false) Integer categoryId, Model model, HttpSession session,
			RedirectAttributes rttr) {

		if (boardno == null || boardno <= 0) {
			rttr.addFlashAttribute("msg", "유효하지 않거나 누락된 게시글 번호입니다.");
			if (categoryId != null) {
				return "redirect:listcategory?category=" + categoryId;
			} else {
				System.err.println("오류");
				return "redirect:listmain";
			}
		}
		// 1. 조회수 증가
		service.updateReadCnt(boardno);

		// 2. 게시글 상세 정보 및 댓글 조회
		BoardVO boardVO = service.getDetail(boardno);
		Object loginNo = session.getAttribute("loginNo");
		if (loginNo != null) {
			model.addAttribute("loginNo", loginNo);
		}
		model.addAttribute("board", boardVO);
		model.addAttribute("categoryId", categoryId); // 뷰에서도 categoryId 쓸 수 있게 전달
		model.addAttribute("comments", rService.getComments(boardno));

		if (boardVO == null) {
			rttr.addFlashAttribute("msg", "존재하지 않거나 삭제된 게시글입니다.");
			if (categoryId != null) {
				return "redirect:listcategory?category=" + categoryId;
			} else {
				return "redirect:list";
			}
		}
		return "/board/boarddetail";
	}

	// 글쓰기 페이지 이동
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(@RequestParam(value = "category", required = false) Integer categoryId,
			@RequestParam(value = "sort", required = false) String sort, Model model) {
		// 드롭다운용 전체 카테고리 불러오기
		List<CategoryVO> mainCategories = cService.getMainCategories();
		CategoryVO cVO = null;
		if (categoryId != null) {
			cVO = cService.getMainCategoryById(categoryId);
		}
		model.addAttribute("mainCategories", mainCategories);
		// 카테고리별 게시판에서 왔을 경우 hidden으로 넘길 categoryId 세팅
		model.addAttribute("categoryId", categoryId);
		model.addAttribute("categoryVO", cVO);
		model.addAttribute("sort", sort);
		return "board/boardregister";
	}

/*	// 카테고리 소분류
	@RequestMapping(value = "/selectcategory/sub", method = RequestMethod.GET)
	@ResponseBody
	public List<CategoryVO> getSubCategories(@RequestParam("parentId") int parentId) {
		System.out.println("받은 parentId = " + parentId);
		return cService.getSubCategories(parentId);
	}
*/ 
	// 글쓰기
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(BoardVO boardVO, RedirectAttributes rttr, HttpSession session) throws Exception {
		Integer loginNo = (Integer) session.getAttribute("loginNo");

		if (loginNo != null) {
			boardVO.setLoginLoginNo(loginNo);
		} else {
			return "redirect:/login"; // 예시: 로그인이 안 되어 있으면 로그인 페이지로 리다이렉트
		}
		boardVO.setLoginLoginNo(loginNo);
		int r = service.register(boardVO);

		if (r > 0) {
			rttr.addFlashAttribute("msg", "추가에 성공하였습니다.");
		}
		return "redirect:/listmain?category=" + boardVO.getCategoryId();
	}

	// 수정 페이지 이동
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String detail(@RequestParam("boardno") int boardno, Model model, HttpSession session,
			RedirectAttributes rttr) {
		BoardVO boardVO = service.getDetail(boardno);

		model.addAttribute("board", boardVO);
		Object loginNo = session.getAttribute("loginNo");

		if (loginNo == null) {
			rttr.addFlashAttribute("msg", "로그인 후 이용 가능합니다.");
			return "redirect:/login";
		}

		if (!boardVO.getLoginLoginNo().equals(loginNo)) {
			rttr.addFlashAttribute("msg", "작성자만 수정할 수 있습니다.");
			return "redirect:/board/detail?boardno=" + boardno;
		}

		List<CategoryVO> mainCategories = cService.getMainCategories();
		model.addAttribute("mainCategories", mainCategories);
		model.addAttribute("categoryId", boardVO.getCategoryId());

		return "/board/boardupdate";
	}

	// 글수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(BoardVO boardVO, RedirectAttributes attr, HttpSession session, HttpServletRequest request)
			throws Exception {
		Integer loginNo = (Integer) session.getAttribute("loginNo");
		if (loginNo == null) {
			// 세션 만료 등으로 loginNo가 없을 경우
			attr.addFlashAttribute("msg", "로그인 세션이 만료되어 수정할 수 없습니다.");
			return "redirect:/login";
		}
		boardVO.setLoginLoginNo(loginNo);
		int r = service.update(boardVO);
		if (r > 0) {
			attr.addFlashAttribute("msg", "수정에 성공 하였습니다.");
			return "redirect:detail?boardno=" + boardVO.getBoardno();
		}else {
		 attr.addFlashAttribute("msg", "수정 권한이 없거나 수정에 실패했습니다.");
		 }
		return "redirect:detail?boardno=" + boardVO.getBoardno();
	}

	// 게시글 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(@RequestParam("boardno") int boardno,
			@RequestParam(value = "categoryId", required = false) Integer categoryId, HttpSession session,
			RedirectAttributes rttr) {
		Object loginNoObj = session.getAttribute("loginNo");
		if (loginNoObj == null) {
		    // ... (로그인 필요 처리)
		}
		Integer loginNo = (Integer) loginNoObj; 
		BoardVO board = service.getDetail(boardno);

		if (!board.getLoginLoginNo().equals(loginNo)) { 
		    rttr.addFlashAttribute("msg", "작성자만 삭제할 수 있습니다.");
		    return "redirect:/detail?boardno=" + boardno;
		}


		int result = service.delete(boardno);

		if (result > 0) {
			rttr.addFlashAttribute("msg", "글과 댓글이 모두 삭제되었습니다.");
			if (categoryId != null) {
				return "redirect:/listmain?categoryId=" + categoryId;
			}
			return "redirect:/listmain";
		}

		rttr.addFlashAttribute("msg", "글삭제에 실패하였습니다.");
		if (categoryId != null) {
			return "redirect:/detail?boardno=" + boardno;
		}
		return "redirect:/detail?boardno=" + boardno;
	}
}// controllerend