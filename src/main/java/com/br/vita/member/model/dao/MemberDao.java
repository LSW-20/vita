package com.br.vita.member.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.List;
import java.util.Properties;
import static com.br.vita.common.template.JDBCTemplate.*;

import java.util.Map;

import com.br.vita.member.model.vo.Member;

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
	
	/***
	 * author : 박시우
	 * @param conn
	 * @param userId
	 * @param userPwd
	 * @return 입력한 id,pwd 로 조회한 해당 user데이터 m 회원객체에 담아서 반환
	 */
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
								   ,rset.getString("REPRESENTATIVE")
								   ,rset.getString("DOCTOR_NO")
								   ,rset.getString("DEPT_NAME"));
					
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
	 * 마이페이지 개인정보수정
	 * update - 처리 행 수 생성
	 * @author 최보겸
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
	 * @author 최보겸
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
	 * @author 최보겸
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
	 * @author 최보겸
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
	
	
	public int signUpAdultMember(Connection conn, Member m) {
	    int result = 0;
	    PreparedStatement pstmt = null;
	    String sql = prop.getProperty("signUpAdultMember");
	    
	    try {
	        pstmt = conn.prepareStatement(sql);
	        
	        pstmt.setString(1, m.getUserId());
	        pstmt.setString(2, m.getUserPwd());
	        pstmt.setString(3, m.getUserName());
	        pstmt.setString(4, m.getPhone());
	        pstmt.setString(5, m.getEmail());
	        pstmt.setString(6, m.getAddress());
	        pstmt.setString(7, m.getUserSSN());
	        pstmt.setString(8, m.getCallbackYN());
	        
	        // 주민등록번호의 앞 6자리 추출
	        String userDate = m.getUserSSN().substring(0, 6);
	        pstmt.setString(9, userDate);
	        
	        pstmt.setString(10, m.getGender());

	        result = pstmt.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(pstmt);
	    }
	    System.out.println("다오도착 : " + result);
	    return result;
	}
	
	
	/**
	 * 회원 이름으로 회원 검색
	 * author : 임상우
	 * @param conn
	 * @param userName
	 * @return List<Member> 검색된 회원 데이터들
	 */
	public List<Member> selectByName(Connection conn, String userName) {
		
		//select문 => 여러행 => List<Member>
		List<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectByName");
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userName);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(rset.getString("USER_ID"),
									rset.getString("USER_NAME"),
									rset.getString("USER_SSN"),
									rset.getString("ADDRESS"),
									rset.getString("EMAIL"),
									rset.getString("CALLBACK_YN"),
									rset.getString("PHONE"),
									rset.getDate("ENROLL_DATE")
						));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
		
	}
	
	
	/**
	 * 회원 아이디로 회원 검색
	 * author : 임상우
	 * @param conn
	 * @param userId
	 * @return 검색된 회원 데이터(하나지만 List에 담아서 보냈음)
	 */
	public List<Member> selectById(Connection conn, String userId) {
		
		//select문 => 한 행 => 한 행이지만 화면구현을 list에서 뽑아오기 때문에 Member가 아닌 List<Member>
		List<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectById");
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(rset.getString("USER_ID"),
									rset.getString("USER_NAME"),
									rset.getString("USER_SSN"),
									rset.getString("ADDRESS"),
									rset.getString("EMAIL"),
									rset.getString("CALLBACK_YN"),
									rset.getString("PHONE"),
									rset.getDate("ENROLL_DATE")
						));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}

	public int idCheck(Connection conn, String checkId) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
	
		return count;
	}
	
	
	/**
	 * 이름, 핸드폰번호, 주민등록번호로 userNo 찾기 (1/2) 진료예약 추가
	 * author : 임상우
	 * @param conn
	 * @param name
	 * @param ssn
	 * @param phone
	 * @return userNo
	 */
	public String findUserNo(Connection conn, String name, String ssn, String phone) {
		
		String userNo = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("findUserNo");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			pstmt.setString(3, ssn);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				userNo = rset.getString("USER_NO");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return userNo;
	}

	public int hpCheck(Connection conn, String checkHp) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("hpCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkHp);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
	
		return count;
	}

	public int userSSNCheck(Connection conn, String checkUserSSN) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("userSSNCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkUserSSN);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
	
		return count;
	}
	
	
	

}
