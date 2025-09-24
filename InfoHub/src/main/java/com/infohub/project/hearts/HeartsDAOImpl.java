package com.infohub.project.hearts;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infohub.project.comment.CommentDAOImpl;

@Repository
public class HeartsDAOImpl implements HeartsDAO {
	
	@Autowired
	SqlSession session;
	
	private final static String nameSpace = "com.infohub.project.heartsMapper";
	
	
	
	@Override
	public int heartsCount(int article_article_id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(nameSpace+".heartsCount", article_article_id);
	}


	@Override
	public int heartsCheck(int article_article_id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(nameSpace+".heartsCheck", article_article_id);
	}


	@Override
	public int heartsInsert(int article_article_id) throws Exception {
		// TODO Auto-generated method stub
		return session.insert(nameSpace+".heartsInsert", article_article_id);
	}


	@Override
	public int heartsDelete(int article_article_id) throws Exception {
		// TODO Auto-generated method stub
		return session.delete(nameSpace+".heartsDelete", article_article_id);
	}


	@Override
	public int articleHearts(int article_article_id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(nameSpace+".articleHearts", article_article_id);
	}

}
