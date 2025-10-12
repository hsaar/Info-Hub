package com.infohub.project.boardcategory;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.infohub.project.boardcategory.CategoryVO;

@Repository
public class CategoryDAOImpl implements CategoryDAO{
	@Inject
	private SqlSession sqlsession;
	private static final String nameSpace="com.infohub.project.boardCategoryMapper";
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

	@Override
	public CategoryVO selectMainCategoryById(int categoryId) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(nameSpace+".selectMainCategoryById", categoryId);
	}
	
	

}
