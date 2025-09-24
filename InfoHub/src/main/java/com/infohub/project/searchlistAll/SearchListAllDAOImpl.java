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
	public List<SearchListAllDTO> slistPage(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList(nameSpace + ".slistPage",cri);
	}
	
	@Override
	public List<SearchListAllDTO> read(int articleId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".read",articleId);
	}
	
	@Override
	public int getTotalCount(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".gettotalcount", cri);
	}


//	@Override
//	public List<SearchListAllDTO> searchlistAll() throws Exception {
//		// TODO Auto-generated method stub
//		return sqlSession.selectList(nameSpace + ".searchlistAll");
//	}
//
//	@Override
//	public List<SearchListAllDTO> listCriteria(Criteria cri) throws Exception {
//		// TODO Auto-generated method stub
//		return sqlSession.selectList(nameSpace + ".listCriteria", cri);
//	}
//
//	@Override
//	public int countPaging(Criteria cri) throws Exception {
//		// TODO Auto-generated method stub
//		return sqlSession.selectOne(nameSpace + ".countPaging",cri);
//	}

}



