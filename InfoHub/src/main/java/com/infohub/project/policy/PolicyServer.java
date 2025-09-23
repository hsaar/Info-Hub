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
@WebServlet("/policies")	// 클라이언트 요청 경로
public class PolicyServer extends HttpServlet {
	// DAO 호출 → DB 접근
    private PolicyDAO dao = new PolicyDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)	// Get 요청(요청 정보, 요청 응답)
            throws ServletException, IOException {
    	
    	// 파라미터 읽기
        String regionIdStr = req.getParameter("regionId");
        String categoryStr = req.getParameter("category");

        resp.setContentType("application/json; charset=UTF-8");		// 응답 = JSON 형식
        try (PrintWriter out = resp.getWriter()) {
            if (regionIdStr == null || categoryStr == null) {
                resp.setStatus(400);	// error
                out.print("{\"error\":\"필수 파라미터(regionId, category)가 누락되었습니다.\"}");
                return;
            }

            int regionId = Integer.parseInt(regionIdStr);
            int categoryId = Integer.parseInt(categoryStr);

            List<PolicyDTO> results = dao.findPolicies(regionId, categoryId);
            out.print(new Gson().toJson(results));	// Gson → 자바 객체 JSON 문자열로 변환
        } catch (SQLException e) {
            resp.setStatus(500);
            resp.getWriter().print("{\"error\":\"DB 오류 발생\"}");
        }
    }
}
