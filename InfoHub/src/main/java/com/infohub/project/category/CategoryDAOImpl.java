package com.infohub.project.category;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDAOImpl implements CategoryDAO{
	@Inject
	private SqlSession sqlsession;
	private static final String nameSpace="com.infohub.project.CategoryMapper";
	@Override
	public List<CategoryVO> selectMainCategories() {
		// TODO Auto-generated method stub
		return sqlsession.selectList(nameSpace+ ".selectMainCategories");
	}
	
	@Override
	public List<CategoryVO> selectSubCategories(int parentId) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(nameSpace+ ".selectSubCategories",parentId);
	}
	
	

}
