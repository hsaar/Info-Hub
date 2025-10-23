package com.infohub.project.customizedservice;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class CustomizedDAOImpl implements CustomizedDAO{

	@Autowired
	SqlSession sqlSession;
	
	private static final String nameSpace="com.infohub.project.pushMapper"; 

	@Override
	public List<CustomizedDTO> selectDeadlineImminentBenefits(int loginNo) throws Exception {
        return sqlSession.selectList(nameSpace + ".selectDeadlineImminentBenefits", loginNo);
	}
	
}