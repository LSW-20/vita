package com.br.vita.issue.model.dao;

import java.io.FileInputStream;


import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;
import static com.br.vita.common.template.JDBCTemplate.*;



public class IssueDao {

	private Properties prop = new Properties();

	public IssueDao() {

		String filePath = IssueDao.class.getResource("/db/mappers/issue-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(filePath));

		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	public int certificateApplicationInsert(Connection conn, String userNo, String type ,String Date,String purpose) {
		
		
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("certificateApplicationInsert");
		/* System.out.println(sql); */
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1,userNo);
			pstmt.setString(2,userNo);
			pstmt.setString(3,Date);
			pstmt.setString(4,type );
			pstmt.setString(5,purpose);
			
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
		
		
	}
	
	public int certificateApplicationSelect(Connection conn, String userNo,String type, String date) {
		
		int count = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("certificateApplicationSelect");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, userNo);
			pstmt.setString(2, date);
			pstmt.setString(3, type);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
		
		
		
	}
	
	
	
	
	
	
	
	

}
