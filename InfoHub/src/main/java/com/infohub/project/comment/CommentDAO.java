package com.infohub.project.comment;

import java.util.List;

public interface CommentDAO {
	
	List<CommentVO> commentListAll(int article_article_id) throws Exception;
	
	public int commentInsert(CommentVO commentVO) throws Exception;
}
