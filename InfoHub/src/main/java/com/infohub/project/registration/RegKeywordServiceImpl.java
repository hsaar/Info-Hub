package com.infohub.project.registration;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RegKeywordServiceImpl implements RegKeywordService{
	
	@Autowired
	RegKeywordDAO dao;

	@Override
	public int countKeyword(int regsearchId) throws Exception {
		// TODO Auto-generated method stub
		return dao.countKeyword(regsearchId);
	}

	@Override
	public int insertKeyword(RegKeywordDTO regKeywordDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.insertKeyword(regKeywordDTO);
	}
	
	@Override
    public void logAndCountKeyword(String regkeyword) throws Exception {
        // 1. 키워드가 존재하면 카운트 증가를 시도합니다. (updateCountBySkeyword 실행)
        // 이 DAO 호출은 updated_date 오류가 수정된 XML 쿼리를 사용합니다.
        int updateCount = dao.updateKeywordCountBySkeyword(regkeyword);

        // 2. 업데이트된 행이 0개라면 (키워드가 처음 검색됨) 새로 삽입합니다.
        if (updateCount == 0) {
        	RegKeywordDTO dto = new RegKeywordDTO();
            dto.setRegkeyword(regkeyword);
            // 새 키워드이므로 count를 1로 설정하여 insert 쿼리를 실행합니다.
            dto.setRegcount(1);
            dao.insertKeyword(dto);
        }
    }
	@Override
	public List<RegKeywordDTO> findTop7() throws Exception {
	    return dao.findTop7();
	 }

}
