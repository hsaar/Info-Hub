package com.infohub.project.searchlistAll;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SearchListAllDAOImpl implements SearchListAllDAO{

	@Autowired
	SqlSession sqlSession;
	
	private static final String nameSpace="com.infohub.project.searchMapper";

	@Override
	public int searchCount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".searchCount");
	}
	
	@Override
	public List<SearchListAllDTO> searchlistAll() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".searchlistAll");
	}


}


