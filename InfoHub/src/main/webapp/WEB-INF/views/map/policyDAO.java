package map;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PolicyDAO {
    private String url = "jdbc:mysql://192.168.0.44:3306/policy?serverTimezone=UTC";
    private String user = "avangers5";
    private String password = "12345";

    public List<Policy> findPolicies(int regionId, int[] categories) throws SQLException {
        List<Policy> results = new ArrayList<>();

        String placeholders = String.join(",", java.util.Collections.nCopies(categories.length, "?"));
        String sql = "SELECT title, content FROM policy WHERE region_id = ? AND category_id IN (" + placeholders + ")";

        try (Connection conn = DriverManager.getConnection(url, user, password);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, regionId);
            for (int i = 0; i < categories.length; i++) {
                pstmt.setInt(i + 2, categories[i]);
           }

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    results.add(new Policy(
                        rs.getString("title"),
                        rs.getString("content")
                    ));
                }
            }
        }
        return results;
    }
}
