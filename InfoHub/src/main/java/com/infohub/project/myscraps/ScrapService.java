package com.infohub.project.myscraps;

import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service   // 서비스 계층 등록
public class ScrapService {

    @Autowired
    private ScrapDAO dao;

    // 정책 스크랩 추가
    public void addPolicyScrap(int loginId, int policyId) throws SQLException {
        dao.addPolicyScrap(loginId, policyId);
    }

    // 내가 스크랩한 정책 목록
    public List<ScrapDTO> getPolicyScrapsByUser(int loginId) throws SQLException {
        return dao.getPolicyScrapsByUser(loginId);
    }

    // 스크랩 삭제
    public void deleteScrap(int scrapId) throws SQLException {
        dao.deleteScrap(scrapId);
    }
}
