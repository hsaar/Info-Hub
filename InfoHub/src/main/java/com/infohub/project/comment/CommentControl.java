package com.infohub.project.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("comment/")
public class CommentControl {

	@Autowired
	CommentService service;
	
	public CommentControl() {
		System.out.println("-----CommentCont() 객체 생성됨");
	} // end
	
	
	@ResponseBody
	@PostMapping("insert")
	private int mCommentServiceInsert(CommentVO commentVO) throws Exception {
		System.out.println("insert");
		
	    // 로그인 기능을 구현했거나 따로 댓글 작성자를 입력받는 폼이 있다면 입력받아온 값을 사용하면 된다.
	    // 따로 구현하지 않았기 때문에 아이디는 임시로 "test"
	    return service.commentInsert(commentVO);

	} // mCommentServiceInsert() end
	
	@ResponseBody
	@PostMapping("listAll")
	public List<CommentVO> mCommentServiceListAll(int article_article_id) throws Exception {
		System.out.println("listAll");
		
		
	    return service.commentListAll(article_article_id);

	}
	
} // class end
