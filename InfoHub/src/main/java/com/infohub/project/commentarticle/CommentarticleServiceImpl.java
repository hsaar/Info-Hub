package com.infohub.project.commentarticle;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentarticleServiceImpl implements CommentarticleService{

	@Autowired
	CommentarticleDAO dao;
	

	@Override
	public List<CommentarticleVO> commentarticleListAll(int article_articleId) throws Exception {
		// TODO Auto-generated method stub
		return dao.commentarticleListAll(article_articleId);
	}

	@Override
	public int commentarticleInsert(CommentarticleVO commentarticleVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.commentarticleInsert(commentarticleVO);
	}

}
