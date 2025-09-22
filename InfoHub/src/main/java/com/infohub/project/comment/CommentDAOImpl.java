package com.infohub.project.comment;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

@Repository
public class CommentDAOImpl implements CommentDAO{
	
	@Autowired
	SqlSession sqlSession;
	
	private final static String nameSpace = "com.infohub.project.commentMapper";
	
 // class end

//	public int commentInsert(CommentVO comment) {
//	    return sqlSession.insert(nameSpace+".insert", comment);
//	} // commentInsert() end
//	

	@Override
	public List<CommentVO> commentListAll(int article_article_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace+".listAll", article_article_id);
	}

	@Override
	public int commentInsert(CommentVO commentVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(nameSpace+".insert", commentVO);
	}

}