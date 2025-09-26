package com.infohub.project.commentarticle;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

@Repository
public class CommentarticleDAOImpl implements CommentarticleDAO{
	
	@Autowired
	SqlSession sqlSession;
	
	private final static String nameSpace = "com.infohub.project.commentarticleMapper";
	
 // class end

//	public int commentInsert(CommentVO comment) {
//	    return sqlSession.insert(nameSpace+".insert", comment);
//	} // commentInsert() end
//	

	@Override
	public List<CommentarticleVO> commentarticleListAll(int article_articleId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".listAll", article_articleId);
	}

	@Override
	public int commentarticleInsert(CommentarticleVO commentarticleVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(nameSpace+".insert", commentarticleVO);
	}

	

}