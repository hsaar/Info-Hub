package com.infohub.project.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	CommentDAO dao;
	

	@Override
	public List<CommentVO> commentListAll(int article_article_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.commentListAll(article_article_id);
	}

	@Override
	public int commentInsert(CommentVO commentVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.commentInsert(commentVO);
	}

}
