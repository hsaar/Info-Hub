package com.infohub.project.scraps;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infohub.project.commentarticle.CommentarticleDAOImpl;

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
	public int scrapsCheck(ScrapsVO scrapsVO) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(nameSpace+".scrapsCheck", scrapsVO);
	}


	@Override
	public int scrapsInsert(ScrapsVO scrapsVO) throws Exception {
		// TODO Auto-generated method stub
		return session.insert(nameSpace+".scrapsInsert", scrapsVO);
	}


	@Override
	public int scrapsDelete(ScrapsVO scrapsVO) throws Exception {
		// TODO Auto-generated method stub
		return session.delete(nameSpace+".scrapsDelete", scrapsVO);
	}


	@Override
	public List<ScrapsVO> myscraps(int loginNo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(nameSpace+".myscraps", loginNo);
	}


	@Override
	public List<ScrapsVO> getMyScraps(int loginNo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(nameSpace+".getMyScraps", loginNo);
	}

}
