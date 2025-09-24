package com.infohub.project.mypage;

import com.google.gson.Gson;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

@WebServlet("/scraps")	// HTTP 요청 처리
public class ScrapServer extends HttpServlet {
	private static final long serialVersionUID = 1L;	// 직렬화 버전 UID

    @Autowired
    private ScrapService service;

    // 스크랩 목록 조회
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("application/json; charset=UTF-8");

        try (PrintWriter out = resp.getWriter()) {
            int loginId = Integer.parseInt(req.getParameter("loginId"));
            String type = req.getParameter("type"); // 정책, 기사 구분(파라미터)

            if ("article".equals(type)) {   // 기사 스크랩 목록
                List<ScrapDTO> scraps = service.getArticleScrapsByUser(loginId);
                out.print(new Gson().toJson(scraps));
            } else {   // 정책 스크랩 목록
                List<ScrapDTO> scraps = service.getPolicyScrapsByUser(loginId);
                out.print(new Gson().toJson(scraps));
            }
        } catch (SQLException e) {
            resp.setStatus(500);
            resp.getWriter().print("{\"error\":\"DB 오류\"}");
        }
    }
    
    // 스크랩 추가
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            int loginId = Integer.parseInt(req.getParameter("loginId"));
            String type = req.getParameter("type"); // 정책, 기사 구분

            if ("article".equals(type)) {   // 기사 스크랩 추가
                int articleId = Integer.parseInt(req.getParameter("articleId"));
                service.addArticleScrap(loginId, articleId);
                resp.getWriter().print("{\"result\":\"article_scrap_success\"}");
            } else {   // 정책 스크랩 추가
                int policyId = Integer.parseInt(req.getParameter("policyId"));
                service.addPolicyScrap(loginId, policyId);
                resp.getWriter().print("{\"result\":\"policy_scrap_success\"}");
            }
        } catch (SQLException e) {
            resp.setStatus(500);
            resp.getWriter().print("{\"error\":\"DB 오류\"}");
        }
    }
    
    // 스크랩 삭제
    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            int scrapId = Integer.parseInt(req.getParameter("scrapId"));
            service.deleteScrap(scrapId);
            resp.getWriter().print("{\"result\":\"delete_success\"}");
        } catch (SQLException e) {
            resp.setStatus(500);
            resp.getWriter().print("{\"error\":\"DB 오류\"}");
        }
    }
}
