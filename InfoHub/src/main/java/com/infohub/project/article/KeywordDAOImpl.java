package com.infohub.project.article;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class KeywordDAOImpl implements KeywordDAO{
	
	@Autowired
	SqlSession session;

	private final static String nameSpace = "com.infohub.project.keywordMapper";

	
	@Override
	public int countKeyword(int searchId) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(nameSpace + ".updateCount", searchId);
	}

	@Override
	public int insertKeyword(KeywordDTO KeywordDTO) throws Exception {
		// 최종 확인: nameSpace와 매퍼 ID 사이에 마침표(.)가 정확하게 들어가 있습니다.
		return session.insert(nameSpace + ".insertKeyword", KeywordDTO);
	}
	
	@Override
	public int updateKeywordCountBySkeyword(String skeyword) throws Exception {
		// updateCountBySkeyword 쿼리를 호출합니다.
		return session.update(nameSpace + ".updateCountBySkeyword", skeyword);
	}
	
	@Override
	public List<KeywordDTO> findTop7() throws Exception {
		// keywordMapper.xml의 findTop7을 호출합니다.
		return session.selectList(nameSpace + ".findTop7"); 
	}
}
