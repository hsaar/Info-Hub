package com.infohub.project.registration;

import java.util.List;

public interface RegistrationService {
	List<RegistrationDTO> registrationlistAll() throws Exception;
	List<RegistrationDTO> timelineListAll() throws Exception;
}


