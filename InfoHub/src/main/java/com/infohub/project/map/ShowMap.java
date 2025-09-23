package com.infohub.project.map;

import java.sql.SQLException;
import java.util.List;
import com.infohub.project.policy.*;

public class ShowMap {
    public static void main(String[] args) {
        PolicyDAO dao = new PolicyDAO();
        try {
            List<PolicyDTO> policies = dao.findPolicies(1, 2);
            for (PolicyDTO p : policies) {
                System.out.println(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
