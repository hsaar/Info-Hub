package com.infohub.project.map;

import java.sql.SQLException;
import com.infohub.project.policy.*;


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