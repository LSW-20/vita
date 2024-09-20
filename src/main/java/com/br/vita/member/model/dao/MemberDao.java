package com.br.vita.member.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.br.vita.member.model.vo.Member;
import static com.br.vita.common.template.JDBCTemplate.*;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	
	public MemberDao() {

		String filePath = MemberDao.class.getResource("/db/mappers/member-mapper.xml").getPath();

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
	
	
	public Member memberLogin(Connection conn, String userId, String userPwd) {
		
		
			Member m = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("memberLogin");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, userId);
				pstmt.setString(2, userPwd);
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					m = new Member (rset.getString("USER_NO")
								   ,rset.getString("USER_ID")
								   ,rset.getString("USER_PWD")
								   ,rset.getString("USER_NAME")
								   ,rset.getString("PHONE")
								   ,rset.getString("EMAIL")
								   ,rset.getString("ADDRESS")
								   ,rset.getDate("ENROLL_DATE")
								   ,rset.getString("USER_TYPE")
								   ,rset.getString("USER_SSN")
								   ,rset.getString("CALLBACK_YN")
								   ,rset.getString("RESIGN_YN")
								   ,rset.getString("USER_DATE")
								   ,rset.getString("USER_GENDER")
								   ,rset.getString("REPRESENTATIVE"));
					
				}
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			
			return m;
		
		
	}
	
	
	public String adminDoctorSelect(Connection conn, String addocId) {
		
		

		String m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("adminDoctorSelect");
		
		try {
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1, addocId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = rset.getString("USER_TYPE");
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
		
		
	}
	

}
