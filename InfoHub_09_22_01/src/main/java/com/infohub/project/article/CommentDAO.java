package com.infohub.project.article;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

@Repository
@RequestMapping("/comment")
public class CommentDAO {

	public CommentDAO() {
		System.out.println("-----CommentDAO() 객체 생성됨");
	} // end
	
	@Autowired
	SqlSession sqlSession;
	
} // class end