package com.infohub.project.registration;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RegKeywordDAOImpl implements RegKeywordDAO{
	
	@Autowired
	SqlSession session;

	private final static String nameSpace = "com.infohub.project.regkeywordMapper";

	
	@Override
	public int countKeyword(int regsearchId) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(nameSpace + ".updateCount", regsearchId);
	}

	@Override
	public int insertKeyword(RegKeywordDTO regKeywordDTO) throws Exception {
		// 최종 확인: nameSpace와 매퍼 ID 사이에 마침표(.)가 정확하게 들어가 있습니다.
		return session.insert(nameSpace + ".insertKeyword", regKeywordDTO);
	}
	
	@Override
	public int updateKeywordCountBySkeyword(String regkeyword) throws Exception {
		// updateCountBySkeyword 쿼리를 호출합니다.
		return session.update(nameSpace + ".updateCountBySkeyword", regkeyword);
	}
	
	@Override
	public List<RegKeywordDTO> findTop7() throws Exception {
		// keywordMapper.xml의 findTop7을 호출합니다.
		return session.selectList(nameSpace + ".findTop7"); 
	}
}
