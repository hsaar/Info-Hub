package com.infohub.project.myscraps;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.sql.SQLException;
import java.util.List;

@Service   // 서비스 계층 등록
public class ScrapImpl implements ScrapService {

    @Autowired
    private ScrapDAO dao;

    // 정책 스크랩 추가
    @Override
    public void addPolicyScrap(int loginNo, int policyId) throws SQLException {
        dao.addPolicyScrap(loginNo, policyId);
    }

    // 내가 스크랩한 정책 목록
    @Override
    public List<ScrapDTO> getPolicyScrapsByUser(int loginNo) throws SQLException {
        return dao.getPolicyScrapsByUser(loginNo);
    }

    // 스크랩 삭제
    @Override
    public void deleteScrap(int scrapNo) throws SQLException {
        dao.deleteScrap(scrapNo);
    }
}
