package com.infohub.project.scraps;

import java.util.List;

public interface ScrapsDAO {
	
	int scrapsCount() throws Exception;
	int scrapsCheck(ScrapsVO scrapsVO) throws Exception;
	int scrapsInsert(ScrapsVO scrapsVO) throws Exception;
	int scrapsDelete(ScrapsVO scrapsVO) throws Exception;
	
	List<ScrapsVO> myscraps(int loginNo) throws Exception;
	List<ScrapsVO> getMyScraps(int loginNo) throws Exception;

}
