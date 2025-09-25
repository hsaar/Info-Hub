package com.infohub.project.policy;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;

@SuppressWarnings("serial")
@WebServlet("/policies")  // URL 매핑
public class PolicyServer extends HttpServlet {
    private PolicyDAO dao = new PolicyDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int regionId = Integer.parseInt(req.getParameter("regionId"));
        int[] categories = Arrays.stream(req.getParameterValues("categories"))
                                 .mapToInt(Integer::parseInt)
                                 .toArray();

        resp.setContentType("application/json; charset=UTF-8");
        PrintWriter out = resp.getWriter();

        try {
            List<PolicyDTO> results = dao.findPolicies(regionId, categories);
            out.print(new Gson().toJson(results)); // 리스트 → JSON 변환
        } catch (SQLException e) {
            resp.setStatus(500);
            out.print("{\"error\":\"DB 오류 발생\"}");
        }
    }
}
