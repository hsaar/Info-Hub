package com.infohub.project.commentarticle;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import com.infohub.project.login.LoginService;
import com.infohub.project.login.LoginServiceImpl;

@RestController
@RequestMapping("comment/")
public class CommentarticleControl {

	@Autowired
	CommentarticleService service;
	
	@Autowired
	LoginServiceImpl ls;
	
	public CommentarticleControl() {
		System.out.println("-----CommentCont() 객체 생성됨");
	} // end
	
	
	@ResponseBody
	@PostMapping("insert")
	private int mCommentServiceInsert(CommentarticleVO commentarticleVO) throws Exception {
		System.out.println("insert");
		
	    return service.commentarticleInsert(commentarticleVO);

	} // mCommentServiceInsert() end
	
	@ResponseBody
	@PostMapping("listAll")
	public List<CommentarticleVO> mCommentServiceListAll(int article_articleId) throws Exception {
		System.out.println("listAll");
		
		
	    return service.commentarticleListAll(article_articleId);

	}
	
} // class end
