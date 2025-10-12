package com.infohub.project.registration;

import java.util.List;

import org.springframework.stereotype.Repository;



@Repository
public interface RegistrationDAO {
	List<RegistrationDTO> registrationlistAll(RegCriteria cri) throws Exception;
	
	List<RegistrationDTO> timelineListAll() throws Exception;
	
	
	List<RegistrationDTO> registrationContent(int registrationNo) throws Exception;
	List<RegistrationDTO> noRegistrationContent(int registrationNo) throws Exception;
	
	List<RegistrationDTO> myBenifit() throws Exception;
	
	public int getTotalCount(RegCriteria cri)throws Exception;
	
}
