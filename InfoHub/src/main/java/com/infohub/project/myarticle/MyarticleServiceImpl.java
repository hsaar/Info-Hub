package com.infohub.project.myarticle;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyarticleServiceImpl implements MyarticleService{

	@Autowired
	MyarticleDAO dao;
	
	@Override
	public List<MyarticleDTO> listAll(String tags) {
		// TODO Auto-generated method stub
		return dao.listAll(tags);
	}

	@Override
	public int count(String tags) {
		// TODO Auto-generated method stub
		return dao.count(tags);
	}

}
