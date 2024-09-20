package com.br.vita.member.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.InvalidPropertiesFormatException;
import java.util.Map;
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
	


	/**
	 * author : 최보겸
	 * update - 처리 행 수 생성
	 * @param conn
	 * @param m 마이페이지의 멤버 객체
	 * @return result 처리 행 수 반환
	 */
	public int updateMember(Connection conn, Member m) {
		
//		System.out.println(m);
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUserName());
			pstmt.setString(2, m.getUserDate());
			pstmt.setString(3, m.getGender());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getUserId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}//updateMember

	/**
	 * 아이디로 불러와 갱신 데이터 조회
	 * author : 최보겸
	 * @param conn
	 * @param userId 로그인유저 식별할 id
	 * @return m 갱신된 멤버 객체 반환
	 */
	public Member selectMemberById(Connection conn, String userId) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMemberById");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getString("USER_NO")
						 	 , rset.getString("USER_ID")
						 	 , rset.getString("USER_PWD")
						 	 , rset.getString("USER_NAME")
						 	 , rset.getString("PHONE")
						 	 , rset.getString("EMAIL")
						 	 , rset.getString("ADDRESS")
						 	 , rset.getDate("ENROLL_DATE")
						 	 , rset.getString("USER_TYPE")
						 	 , rset.getString("USER_SSN")
						 	 , rset.getString("CALLBACK_YN")
						 	 , rset.getString("RESIGN_YN")
						 	 , rset.getString("USER_DATE")
						 	 , rset.getString("USER_GENDER")
						 	 , rset.getString("REPRESENTATIVE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}

	/**
	 * 비번 업데이트 
	 * author : 최보겸
	 * @param conn
	 * @param map
	 * @return result  처리행수 반환
	 */
	public int updateMemberPwd(Connection conn, Map<String, String> map) {
		int result = 0;
		System.out.println(map);
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMemberPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, map.get("updatePwd"));
			pstmt.setString(2, map.get("userId"));
			pstmt.setString(3, map.get("userPwd"));
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}//updatePwd

	/**
	 * 회원 탈퇴
	 * author : 최보겸
	 * @param conn
	 * @param userId
	 * @param userPwd 마지막 확인 위한 비번
	 * @return result 처리 행수 반환
	 */
	public int deleteMember(Connection conn, String userId, String userPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}//deleteMember
	
	public int memberSignUp(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("memberSignUp");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUserName());
			pstmt.setString(2, m.getUserSSN());
			pstmt.setString(3, m.getUserId());
			pstmt.setString(4, m.getUserPwd());
			pstmt.setString(5, m.getPhone());
			pstmt.setString(6, m.getEmail());

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

}
