package com.infohub.project.customizedservice;

import java.util.List;

public interface CustomizedService {
	List<CustomizedDTO> getDeadlineAlerts(String userId) throws Exception;
}