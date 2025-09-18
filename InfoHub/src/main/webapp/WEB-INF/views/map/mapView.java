import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;

public class showMap() {
    public static void main(String[] args) {
        String url = "jdbc:mysql://192.168.0.44:3306/policy?serverTimezone=UTC";
        String user = "avangers5";
        String password = "12345";

        try {
            Connection conn = DriverManager.getConnection(url, user, password)
            System.out.println("DB 연결 성공")

            String sql = "SELECT title, content FROM policy WHERE region_name = ?"
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();

            

        }
    }
}