package com.infohub.project.heartsboard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/heart")
public class HeartsBoardController {
	@Autowired
	HeartsBoardService hService;
	
	
	 // 좋아요 토글
    @PostMapping("/toggle")  // ← /heart/toggle 로 매핑됨
    @ResponseBody
    public String toggleHeart(@RequestBody HeartsBoardVO heart) {
        System.out.println("heart = " + heart);
        hService.toggleHeart(heart);
        int count = hService.getHeartCountByBoard(heart.getBoardno());
        return String.valueOf(count);
    }

    // 좋아요 수 조회
    @GetMapping("/count/{boardno}")
    @ResponseBody
    public int getHeartCount(@PathVariable int boardno) {
        return hService.getHeartCountByBoard(boardno);
    }
}
