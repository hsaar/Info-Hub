package com.infohub.project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.infohub.project.searchlistAll.SearchListAllDAO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/*.xml"})
public class DataSourceTest {
	@Autowired  //spring 전용, @Inject : 자바/spring, @Resource : 이름으로 연결
	private DataSource dataSource;
	
	@Autowired
	SearchListAllDAO dao;
		
//	@Test
//	public void testConn() {
//		try {
//			Connection conn = dataSource.getConnection();
//			System.out.println(conn);
//			System.out.println("연결성공!");
//			
//			PreparedStatement pstmt = null;
//			ResultSet rs = null;
//			
//			String sql = "select * from article_categories";
//			
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			
//			while(rs.next()) {
//				System.out.println(rs.getString(1));
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//	}
//	
	@Test
	public void testconn2() {
		try {
	
			dao.searchCount();
			System.out.println(dao.searchCount());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}

