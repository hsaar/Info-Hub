package com.infohub.project.article_search;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infohub.project.article_search.article_searchDTO;

@Repository
public class article_searchDAOImpl implements article_searchDAO{

	@Autowired
	SqlSession sqlSession;
	
	private static final String nameSpace="com.infohub.project.searchMapper";
	
	
	@Override
	public List<article_searchDTO> slistPage(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList(nameSpace + ".slistPage",cri);
	}
	
	@Override
	public List<article_searchDTO> read(String title) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".read",title);
	}
	
	@Override
	public int getTotalCount(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".gettotalcount", cri);
	}


}
