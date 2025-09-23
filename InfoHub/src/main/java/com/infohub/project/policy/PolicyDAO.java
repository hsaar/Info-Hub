package com.infohub.project.policy;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PolicyDAO {
    private static final String url = "jdbc:mysql://192.168.0.14:3306/policy?serverTimezone=UTC";
    private static final String user = "avangers5";
    private static final String pass = "12345";

    public PolicyDAO() {}

    public List<PolicyDTO> findPolicies(int regionId, int categoryId) throws SQLException {
        List<PolicyDTO> results = new ArrayList<>();

        String sql = "SELECT title, content FROM policy WHERE region_id = ? AND category_id = ?";

        
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, regionId);
            pstmt.setInt(2, categoryId);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    PolicyDTO dto = new PolicyDTO();
                    dto.setTitle(rs.getString("title"));
                    dto.setContent(rs.getString("content"));
                    results.add(dto);
                }
            }
        }
        return results;
    }
}
