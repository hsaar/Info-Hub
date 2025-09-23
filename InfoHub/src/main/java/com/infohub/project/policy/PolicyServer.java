package com.infohub.project.policy;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;

@SuppressWarnings("serial")
@WebServlet("/policies")
public class PolicyServer extends HttpServlet {
    private PolicyService service = new PolicyService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("application/json; charset=UTF-8");

        try (PrintWriter out = resp.getWriter()) {
            // 상세 조회 → policyId
            String policyIdStr = req.getParameter("policyId");
            if (policyIdStr != null && !policyIdStr.isEmpty()) {
                int policyId = Integer.parseInt(policyIdStr);
                PolicyDTO detail = service.getPolicyDetail(policyId);
                out.print(new Gson().toJson(detail));
                return;
            }

            // 목록 조회 → regionId, categoryId, keyword
            String regionIdStr = req.getParameter("regionId");
            String categoryStr = req.getParameter("category");
            String keyword = req.getParameter("keyword"); // ✅ 검색 키워드 추가

            Integer regionId = (regionIdStr != null && !regionIdStr.isEmpty()) ? Integer.parseInt(regionIdStr) : null;
            Integer categoryId = (categoryStr != null && !categoryStr.isEmpty()) ? Integer.parseInt(categoryStr) : null;

            List<PolicyDTO> results = service.getPolicies(regionId, categoryId, keyword); // ✅ keyword까지 전달
            out.print(new Gson().toJson(results));

        } catch (SQLException e) {
            resp.setStatus(500);
            resp.getWriter().print("{\"error\":\"DB 오류 발생\"}");
        }
    }
    

    // 정책 추가 (관리자용) + 좋아요 증가
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String action = req.getParameter("action");

        try {
            if ("like".equals(action)) {   // 좋아요 증가
                int policyId = Integer.parseInt(req.getParameter("policyId"));
                service.addLike(policyId);
                resp.getWriter().print("{\"result\":\"like_success\"}");
                return;
            }

            // 정책 추가
            PolicyDTO dto = new PolicyDTO();
            dto.setTitle(req.getParameter("title"));
            dto.setContent(req.getParameter("content"));
            dto.setApplicationLink(req.getParameter("applicationLink"));
            dto.setApplicationStart(req.getParameter("applicationStart"));
            dto.setApplicationEnd(req.getParameter("applicationEnd"));
            dto.setRegionId(Integer.parseInt(req.getParameter("regionId")));
            dto.setCategoryId(Integer.parseInt(req.getParameter("categoryId")));
            dto.setKeyword(req.getParameter("keyword"));
            // createdAt은 DB에서 NOW()로 자동 입력

            service.addPolicy(dto);
            resp.getWriter().print("{\"result\":\"insert_success\"}");

        } catch (SQLException e) {
            resp.setStatus(500);
            resp.getWriter().print("{\"error\":\"DB 오류\"}");
        } catch (Exception e) {
            resp.setStatus(400);
            resp.getWriter().print("{\"error\":\"잘못된 요청\"}");
        }
    }
}
