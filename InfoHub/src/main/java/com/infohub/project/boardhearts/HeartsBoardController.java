package com.infohub.project.boardhearts;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.infohub.project.board.BoardService;

@Controller
@RequestMapping("/heart")
public class HeartsBoardController {
	
	
	@Autowired
	HeartsBoardService hService;
	@Autowired
	BoardService service;
	
	@PostMapping("/toggle")
	@ResponseBody
	public Map<String, Object> toggleHeart(@RequestBody HeartsBoardVO heart) {
	    System.out.println("heart = " + heart);

	    // 현재 좋아요 상태 확인
	    boolean likedBefore = hService.isHearted(heart);

	    // 토글 동작 수행
	    hService.toggleHeart(heart);

	    // 토글 후 상태
	    boolean likedAfter = !likedBefore;
	    int count = hService.getHeartCountByBoard(heart.getBoardno());

	    Map<String, Object> result = new HashMap<>();
	    result.put("liked", likedAfter);
	    result.put("count", count);
	    return result;
	}
}
