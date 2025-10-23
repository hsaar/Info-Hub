package com.infohub.project.customizedservice;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;



@Repository
public interface CustomizedDAO {
	List<CustomizedDTO> selectDeadlineImminentBenefits(int loginNo) throws Exception;
}
