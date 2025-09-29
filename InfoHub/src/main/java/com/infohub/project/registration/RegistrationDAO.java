package com.infohub.project.registration;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface RegistrationDAO {
	List<RegistrationDTO> registrationlistAll() throws Exception;
	
	List<RegistrationDTO> timelineListAll() throws Exception;

}
