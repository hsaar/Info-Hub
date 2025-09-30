package com.infohub.project.registration;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RegistrationServiceImpl implements RegistrationService {

	@Autowired
	RegistrationDAO dao;
	
	
	@Override
	public List<RegistrationDTO> registrationlistAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.registrationlistAll();
	}


	@Override
	public List<RegistrationDTO> timelineListAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.timelineListAll();
	}


	@Override
	public List<RegistrationDTO> registrationContent(int registrationNo) throws Exception {
		// TODO Auto-generated method stub
		return dao.registrationContent(registrationNo);
	}


	@Override
	public List<RegistrationDTO> noRegistrationContent(int registrationNo) throws Exception {
		// TODO Auto-generated method stub
		return dao.registrationContent(registrationNo);
	}


	@Override
	public List<RegistrationDTO> myBenifit() throws Exception {
		// TODO Auto-generated method stub
		return dao.myBenifit();
	}

}

