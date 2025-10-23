package com.infohub.project.openapi;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/news/elasticsearch")
public class ElasticsearchSearchServlet extends HttpServlet {

    private ElasticsearchService esService = new ElasticsearchService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        response.setContentType("application/json;charset=UTF-8");

        try {
            List<Map<String, Object>> results = esService.searchByKeyword("news_index", keyword);
            StringBuilder json = new StringBuilder("[");
            for (int i = 0; i < results.size(); i++) {
                Map<String, Object> map = results.get(i);
                json.append("{\"title\":\"").append(map.get("title")).append("\",");
                json.append("\"link\":\"").append(map.get("link")).append("\"}");
                if (i < results.size() - 1) json.append(",");
            }
            json.append("]");
            response.getWriter().write(json.toString());
        } catch (Exception e) {
            response.getWriter().write("{\"error\":\"검색 실패\"}");
        }
    }
}

