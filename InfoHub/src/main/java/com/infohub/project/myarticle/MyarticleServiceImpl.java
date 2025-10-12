package com.infohub.project.myarticle;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyarticleServiceImpl implements MyarticleService{

	@Autowired
	MyarticleDAO dao;
	
	@Override
	public List<MyarticleDTO> listAll(String keyword) {
		// TODO Auto-generated method stub
		return dao.listAll(keyword);
	}

	@Override
	public int count(String keyword) {
		// TODO Auto-generated method stub
		return dao.count(keyword);
	}

}
