package com.infohub.project.scraps;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ScrapsServiceImpl implements ScrapsService {
	
	@Autowired
	ScrapsDAO dao;
	

	@Override
	public int scrapsCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.scrapsCount();
	}

	@Override
	public int scrapsCheck(ScrapsVO scrapsVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.scrapsCheck(scrapsVO);
	}

	@Override
	public int scrapsInsert(ScrapsVO scrapsVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.scrapsInsert(scrapsVO);
	}

	@Override
	public int scrapsDelete(ScrapsVO scrapsVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.scrapsDelete(scrapsVO);
	}

	@Override
	public List<ScrapsVO> myscraps(int loginNo) throws Exception {
		// TODO Auto-generated method stub
		return dao.myscraps(loginNo);
	}

	@Override
	public List<ScrapsVO> getMyScraps(int loginNo) throws Exception {
		// TODO Auto-generated method stub
		return dao.getMyScraps(loginNo);
	}

}
