package com.infohub.project.hearts;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infohub.project.commentarticle.CommentarticleDAOImpl;

@Repository
public class HeartsDAOImpl implements HeartsDAO {
	
	@Autowired
	SqlSession session;
	
	private final static String nameSpace = "com.infohub.project.heartsMapper";
	
	
	
	@Override
	public int heartsCount(int article_articleId) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(nameSpace+".heartsCount", article_articleId);
	}


	@Override
	public int heartsCheck(HeartsVO heartsVO) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(nameSpace+".heartsCheck", heartsVO);
	}


	@Override
	public int heartsInsert(HeartsVO heartsVO) throws Exception {
		// TODO Auto-generated method stub
		return session.insert(nameSpace+".heartsInsert", heartsVO);
	}


	@Override
	public int heartsDelete(HeartsVO heartsVO) throws Exception {
		// TODO Auto-generated method stub
		return session.delete(nameSpace+".heartsDelete", heartsVO);
	}


	@Override
	public int articleHearts(int article_article_id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(nameSpace+".articleHearts", article_article_id);
	}

}
