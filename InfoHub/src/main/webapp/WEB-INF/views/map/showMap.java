package map;

import java.security.Policy;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;

public class ShowMap {
    public static void main(String[] args) {
        PolicyDAO dao = new PolicyDAO();
        try {
            dao.findPolicies(1, new int[]{1, 2, 3});
        } catch (SQLException e) {
             e.printStackTrace();
        }
    }
}