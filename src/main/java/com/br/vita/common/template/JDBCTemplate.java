package com.br.vita.common.template;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {
	
	// Connection 생성해서 반환
	public static Connection getConnection() {
		
		Properties prop = new Properties();
		
		// 읽어들이고자 하는 파일 : driver.properties (src/main/java 안 x, src/main/webapp/WEB-INF/classes 안 o)
		//							해당 파일의 물리적인 경로
		String filePath = JDBCTemplate.class.getResource("/db/config/driver.properties").getPath();
		// "C:\workspaces\05_jspServlet-workspace\webApp\src\main\webapp\WEB-INF\classes\db\config\driver.properties
		
		try {
			prop.load(new FileInputStream(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		String driver = prop.getProperty("driver");
		String url = prop.getProperty("url");
		String username = prop.getProperty("username");
		String password = prop.getProperty("password");
		
		Connection conn = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, username, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	// ResultSet 객체를 반납(close) 처리
	public static void close(ResultSet rset) {
		try {
			if(rset != null && !rset.isClosed()) {
				rset.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// Statement 관련 객체를 반납 처리 
	public static void close(Statement stmt) {
		try {
			if(stmt != null && !stmt.isClosed()) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// Connection 객체를 반납 처리
	public static void close(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// commit 처리 
	public static void commit(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.commit();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// rollback 처리
	public static void rollback(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
