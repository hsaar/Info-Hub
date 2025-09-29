package com.infohub.project.myscraps;

import java.sql.SQLException;
import java.util.List;

public interface ScrapService {

    // 정책 스크랩 추가
    void addPolicyScrap(int loginId, int policyId) throws SQLException;

    // 내가 스크랩한 정책 목록
    List<ScrapDTO> getPolicyScrapsByUser(int loginId) throws SQLException;

    // 스크랩 삭제
    void deleteScrap(int scrapId) throws SQLException;
}
