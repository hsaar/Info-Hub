package com.infohub.project.commentarticle;

import java.util.List;

public interface CommentarticleDAO {
	
	List<CommentarticleVO> commentarticleListAll(int article_articleId) throws Exception;
	
	public int commentarticleInsert(CommentarticleVO commentarticleVO) throws Exception;
}
