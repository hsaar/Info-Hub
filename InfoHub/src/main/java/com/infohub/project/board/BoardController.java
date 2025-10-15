package com.infohub.project.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.infohub.project.boardcategory.CategoryService;
import com.infohub.project.boardcategory.CategoryVO;
import com.infohub.project.boardcomment.CommentBoardService;
import com.infohub.project.login.LoginDTO;
import com.infohub.project.login.LoginService;

@Controller
@RequestMapping
public class BoardController {

    @Autowired
    private BoardService service;

    @Autowired
    private CategoryService cService;

    @Autowired
    private CommentBoardService rService;
    @Autowired
    private LoginService loginService; // 작성자 이름 조회용


    // ==============================
    // 공통 모델 세팅 메서드
    // ==============================
    private void prepareCommonModel(Model model, HttpSession session, Integer categoryId, String sort) {
    	 // 로그인 정보
        Integer loginNo = (Integer) session.getAttribute("loginNo");
        model.addAttribute("loginNo", loginNo);

        // 전체 카테고리
        List<CategoryVO> mainCategories = cService.getMainCategories();
        model.addAttribute("mainCategories", mainCategories);

        // 선택된 카테고리
        if (categoryId != null) {
            CategoryVO category = cService.getMainCategoryById(categoryId);
            model.addAttribute("categoryVO", category);
            model.addAttribute("categoryId", categoryId);
        }

        if (sort != null) {
            model.addAttribute("sort", sort);
        }
    }

    // ==============================
    // 1️⃣ 전체 게시판 (메인)
    // ==============================
    @GetMapping("/listmain")
    public String listBoardMain(@RequestParam(value = "categoryId", required = false) Integer categoryId,
                                @RequestParam(value = "keyword", required = false) String keyword,
                                @RequestParam(value = "sort", defaultValue = "recent") String sort,
                                @RequestParam(value = "page", defaultValue = "1") int page,
                                @RequestParam(value = "size", defaultValue = "10") int size,
                                Model model, HttpSession session) {

        if (page < 1) page = 1;

        List<BoardVO> list = service.listPage(categoryId, keyword, sort, page, size);
        int totalCount = service.count(categoryId, keyword);
        int totalPages = Math.max(1, (int) Math.ceil((double) totalCount / size));
        int startPage = Math.max(1, page - 2);
        int endPage = Math.min(totalPages, page + 2);

        model.addAttribute("list", list);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("hasMore", page * size < totalCount);
        model.addAttribute("nextPage", page + 1);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("pageSize", size);
        model.addAttribute("keyword", keyword);
        model.addAttribute("sort", sort);

        prepareCommonModel(model, session, categoryId, sort);

        return "board/boardlistmain";
    }

    // ==============================
    // 2️⃣ 카테고리 게시판
    // ==============================
    @GetMapping("/list")
    public String boardList(@RequestParam(value = "categoryId", required = false) Integer categoryId,
                            @RequestParam(value = "keyword", required = false) String keyword,
                            @RequestParam(value = "sort", defaultValue = "recent") String sort,
                            @RequestParam(value = "page", defaultValue = "1") int page,
                            @RequestParam(value = "size", defaultValue = "20") int size,
                            Model model, HttpSession session) {

        List<BoardVO> list = service.listPage(categoryId, keyword, sort, page, size);
        int totalCount = service.count(categoryId, keyword);

        boolean hasMore = page * size < totalCount;

        model.addAttribute("list", list);
        model.addAttribute("currentPage", page);
        model.addAttribute("keyword", keyword);
        model.addAttribute("sort", sort);
        model.addAttribute("hasMore", hasMore);
        model.addAttribute("nextPage", page + 1);

        prepareCommonModel(model, session, categoryId, sort);

        return "board/boardlist";
    }

    // ==============================
    // 3️⃣ AJAX fragment 게시판
    // ==============================
    @GetMapping("/ajaxList")
    public String ajaxList(@RequestParam(value = "categoryId", required = false) Integer categoryId,
                           @RequestParam(value = "keyword", required = false) String keyword,
                           @RequestParam(value = "sort", defaultValue = "recent") String sort,
                           @RequestParam(value = "page", defaultValue = "1") int page,
                           @RequestParam(value = "size", defaultValue = "20") int size,
                           Model model, HttpSession session) {

        if (categoryId != null && categoryId == 0) {
        	categoryId = null;
        }
        if (keyword != null) {
            String trimmed = keyword.trim();
            if (trimmed.isEmpty() || trimmed.equalsIgnoreCase("false") || trimmed.equalsIgnoreCase("null")) {
                keyword = null;
            } else {
                keyword = trimmed;
            }
        }

        List<BoardVO> list = service.listPage(categoryId, keyword, sort, page, size);
        int totalCount = service.count(categoryId, keyword);
        boolean hasMore = page * size < totalCount;
        int totalPages = Math.max(1, (int) Math.ceil((double) totalCount / size));

        int pageBlock = 10;
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
        
        prepareCommonModel(model, session, categoryId, sort);

        return "board/boardlistFragment";
    }

    // ==============================
    // 4️⃣ 인기글
    // ==============================
    @GetMapping("/popular")
    public String getPopularBoards(Model model, HttpSession session) {
        List<BoardVO> boardList = service.getPopularBoards();
        model.addAttribute("boardList", boardList);
        model.addAttribute("popular", true);

        prepareCommonModel(model, session, null, null);

        return "board/boardlist";
    }

    // ==============================
    // 5️⃣ 게시글 상세
    // ==============================
    @GetMapping("/detail")
    public String detail(@RequestParam(value = "boardno") Integer boardno,
                         @RequestParam(value = "categoryId", required = false) Integer categoryId,
                         Model model, HttpSession session,
                         RedirectAttributes rttr) {

        if (boardno == null || boardno <= 0) {
            rttr.addFlashAttribute("msg", "유효하지 않거나 누락된 게시글 번호입니다.");
            return (categoryId != null) ? "redirect:/board/listmain?category=" + categoryId : "redirect:/board/listmain";
        }

        service.updateReadCnt(boardno);
        BoardVO boardVO = service.getDetail(boardno);
        if (boardVO == null) {
            rttr.addFlashAttribute("msg", "존재하지 않거나 삭제된 게시글입니다.");
            return (categoryId != null) ? "redirect:/board/listmain?category=" + categoryId : "redirect:/board/listmain";
        }

        prepareCommonModel(model, session, categoryId, null);
        model.addAttribute("board", boardVO);
        model.addAttribute("comments", rService.getComments(boardno));

        return "/board/boarddetail";
    }


    // ==============================
    // 6️⃣ 글쓰기 페이지 이동
    // ==============================
    @GetMapping("/register")
    public String showRegisterPage(@RequestParam(value = "category", required = false) Integer categoryId,
                                   @RequestParam(value = "sort", required = false) String sort,
                                   HttpSession session, Model model,
                                   RedirectAttributes rttr) {

        Integer loginNo = (Integer) session.getAttribute("loginNo");
        String userId = (String) session.getAttribute("userId");
        if (loginNo == null || userId == null) {
            rttr.addFlashAttribute("msg", "로그인 후 이용 가능합니다.");
            return "redirect:/login";
        }

        // userId로 이름 조회
        LoginDTO dto = loginService.getUserById(userId);
        String name = (dto != null) ? dto.getName() : "unknown";

        BoardVO board = new BoardVO();
        board.setLoginLoginNo(loginNo);
        board.setRegiId(name);  // 작성자 이름 세팅

        model.addAttribute("board", board);

        prepareCommonModel(model, session, categoryId, sort);
        return "/board/boardregister";
    }
    
    // ==============================
    // 7️⃣ 글쓰기 처리
    // ==============================
    @PostMapping("/register")
    public String register(BoardVO boardVO, RedirectAttributes rttr, HttpSession session)throws Exception {

        Integer loginNo = (Integer) session.getAttribute("loginNo");
        String userId = (String) session.getAttribute("userId");
        if (loginNo == null || userId == null) {
            rttr.addFlashAttribute("msg", "로그인 후 이용 가능합니다.");
            return "redirect:/login";
        }

        // userId로 이름 조회
        LoginDTO dto = loginService.getUserById(userId);
        String name = (dto != null) ? dto.getName() : "unknown";

        boardVO.setLoginLoginNo(loginNo);
        boardVO.setRegiId(name);
        
        int r = service.register(boardVO);
        if (r > 0) {
            rttr.addFlashAttribute("msg", "게시글이 성공적으로 등록되었습니다.");
        } else {
            rttr.addFlashAttribute("msg", "게시글 등록에 실패했습니다.");
        }

        return "/board/boardlistmain";
    }


    // ==============================
    // 8️⃣ 글 수정 페이지
    // ==============================
    @GetMapping("/update")
    public String showUpdatePage(@RequestParam("boardno") int boardno,
                                 Model model, HttpSession session,
                                 RedirectAttributes rttr) {

        Integer loginNo = (Integer) session.getAttribute("loginNo");
        String userId = (String) session.getAttribute("userId");

        if (loginNo == null || userId == null) {
            rttr.addFlashAttribute("msg", "로그인 후 이용 가능합니다.");
            return "redirect:/login";
        }

        BoardVO boardVO = service.getDetail(boardno);
        if (boardVO == null) {
            rttr.addFlashAttribute("msg", "존재하지 않거나 삭제된 게시글입니다.");
            return "redirect:/listmain";
        }

        // 작성자 확인
        if (!boardVO.getLoginLoginNo().equals(loginNo)) {
            rttr.addFlashAttribute("msg", "작성자만 수정할 수 있습니다.");
            return "redirect:/detail?boardno=" + boardno;
        }

        prepareCommonModel(model, session, boardVO.getCategoryId(), null);
        model.addAttribute("board", boardVO);
        return "/board/boardupdate";
    }

    // ==============================
    // 9️⃣ 글 수정 처리
    // ==============================
    @PostMapping("/update")
    public String update(BoardVO boardVO, RedirectAttributes rttr, HttpSession session) {

        Integer loginNo = (Integer) session.getAttribute("loginNo");
        String userId = (String) session.getAttribute("userId");

        if (loginNo == null || userId == null) {
            rttr.addFlashAttribute("msg", "로그인 세션이 만료되어 수정할 수 없습니다.");
            return "redirect:/login";
        }

        // 작성자 번호 세팅 후 수정
        boardVO.setLoginLoginNo(loginNo);
        int r = service.update(boardVO);

        if (r > 0) {
            rttr.addFlashAttribute("msg", "수정에 성공하였습니다.");
        } else {
            rttr.addFlashAttribute("msg", "수정 권한이 없거나 수정에 실패했습니다.");
        }

        return "redirect:/detail?boardno=" + boardVO.getBoardno();
    }

    // ==============================
    // 10️⃣ 글 삭제
    // ==============================
    @PostMapping("/delete")
    public String delete(@RequestParam("boardno") int boardno,
                         @RequestParam(value = "categoryId", required = false) Integer categoryId,
                         HttpSession session, RedirectAttributes rttr) {

        Integer loginNo = (Integer) session.getAttribute("loginNo");
        String userId = (String) session.getAttribute("userId");

        if (loginNo == null || userId == null) {
            rttr.addFlashAttribute("msg", "로그인 후 이용 가능합니다.");
            return "redirect:/login";
        }

        BoardVO board = service.getDetail(boardno);
        if (board == null) {
            rttr.addFlashAttribute("msg", "존재하지 않는 게시글입니다.");
            return "redirect:/listmain";
        }

        // 작성자 확인
        if (!board.getLoginLoginNo().equals(loginNo)) {
            rttr.addFlashAttribute("msg", "작성자만 삭제할 수 있습니다.");
            return "redirect:/detail?boardno=" + boardno;
        }

        int result = service.delete(boardno);
        if (result > 0) {
            rttr.addFlashAttribute("msg", "글과 댓글이 모두 삭제되었습니다.");
            return (categoryId != null) ? "redirect:/listmain?category=" + categoryId : "redirect:/listmain";
        }

        rttr.addFlashAttribute("msg", "글 삭제에 실패했습니다.");
        return "redirect:/detail?boardno=" + boardno;
    }
}//controllerend
