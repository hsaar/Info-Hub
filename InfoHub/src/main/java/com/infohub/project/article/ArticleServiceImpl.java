package com.infohub.project.article;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ArticleServiceImpl implements ArticleService{
	
	@Autowired
	ArticleDAO dao;

	@Override
	public List<ArticleVO> articlListAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.articlListAll();
	}
	
	@Override
	public List<ArticleVO> articlListAll1() throws Exception {
		// TODO Auto-generated method stub
		return dao.articlListAll1();
	}

	@Override
	public List<ArticleVO> articlListAll2() throws Exception {
		// TODO Auto-generated method stub
		return dao.articlListAll2();
	}

	@Override
	public List<ArticleVO> articlListAll3() throws Exception {
		// TODO Auto-generated method stub
		return dao.articlListAll3();
	}

	@Override
	public List<ArticleVO> articlListAll4() throws Exception {
		// TODO Auto-generated method stub
		return dao.articlListAll4();
	}

	@Override
	public List<ArticleVO> articlListAll5() throws Exception {
		// TODO Auto-generated method stub
		return dao.articlListAll5();
	}

	
	
	

}
