package com.infohub.project.scraps;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infohub.project.comment.CommentDAOImpl;

@Repository
public class ScrapsDAOImpl implements ScrapsDAO {
	
	@Autowired
	SqlSession session;
	
	private final static String nameSpace = "com.infohub.project.scrapsMapper";
	
	
	@Override
	public int scrapsCount() throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(nameSpace+".scrapsCount");
	}


	@Override
	public int scrapsCheck(int article_article_id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(nameSpace+".scrapsCheck", article_article_id);
	}


	@Override
	public int scrapsInsert(int article_article_id) throws Exception {
		// TODO Auto-generated method stub
		return session.insert(nameSpace+".scrapsInsert", article_article_id);
	}


	@Override
	public int scrapsDelete(int article_article_id) throws Exception {
		// TODO Auto-generated method stub
		return session.delete(nameSpace+".scrapsDelete", article_article_id);
	}

}
