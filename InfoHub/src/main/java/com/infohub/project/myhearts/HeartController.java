package com.infohub.project.myhearts;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;

@Controller
@RequestMapping("/hearts")   // HTTP 요청 처리
public class HeartController {

    @Autowired
    private HeartService service;

    // 내가 좋아요 누른 기사 목록
    @GetMapping
    public String getHearts(@RequestParam("loginNo") int loginNo, Model model) {
        try {
            List<HeartDTO> hearts = service.getHeartsByUser(loginNo);
            model.addAttribute("hearts", hearts);
            return "mypage/my_hearts";  // heartList.jsp
        } catch (SQLException e) {
            model.addAttribute("error", "DB 오류 발생");
            return "error";
        }
    }
    
    @GetMapping("/api")
    @ResponseBody
    public List<HeartDTO> getHeartsApi(HttpSession session) throws SQLException {
        Integer loginNo = (Integer) session.getAttribute("loginNo");
        if (loginNo == null) {
            return java.util.Collections.emptyList();
        }
        return service.getHeartsByUser(loginNo);
    }


    // 기사 좋아요 추가
    @PostMapping
    public String addHeart(@RequestParam("loginNo") int loginNo,
                           @RequestParam("articleId") int articleId,
                           Model model) {
        try {
            service.addHeart(loginNo, articleId);
            model.addAttribute("result", "heart_add_success");
            return "mypage/my_hearts"; // heartResult.jsp
        } catch (SQLException e) {
            model.addAttribute("error", "DB 오류 발생");
            return "error";
        }
    }

    // 기사 좋아요 취소
    @PostMapping("/delete")   // JSP에서는 DELETE 직접 호출 어렵기 때문에 POST로 처리
    public String deleteHeart(@RequestParam("heartNo") int heartNo, Model model) {
        try {
            service.deleteHeart(heartNo);
            model.addAttribute("result", "heart_delete_success");
            return "mypage/my_hearts"; // heartResult.jsp
        } catch (SQLException e) {
            model.addAttribute("error", "DB 오류 발생");
            return "error";
        }
    }
}
