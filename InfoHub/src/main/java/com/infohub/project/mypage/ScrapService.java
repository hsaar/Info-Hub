package com.infohub.project.mypage;

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

    // 기사 스크랩 추가
    public void addArticleScrap(int loginId, int articleId) throws SQLException {
        dao.addArticleScrap(loginId, articleId);
    }

    // 내가 스크랩한 정책 목록
    public List<ScrapDTO> getPolicyScrapsByUser(int loginId) throws SQLException {
        return dao.getPolicyScrapsByUser(loginId);
    }

    // 내가 스크랩한 기사 목록
    public List<ScrapDTO> getArticleScrapsByUser(int loginId) throws SQLException {
        return dao.getArticleScrapsByUser(loginId);
    }

    // 스크랩 삭제
    public void deleteScrap(int scrapId) throws SQLException {
        dao.deleteScrap(scrapId);
    }
}
