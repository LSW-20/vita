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

import com.br.vita.common.model.vo.PageInfo;
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

	/**
	 * 회원번호, 이름으로 userNo 찾기 (1/3) 일반건강검진 예약 추가
	 * author : 임상우
	 * @param conn
	 * @param userId
	 * @param userName
	 * @return 회원번호
	 */
	public String findUserNo2(Connection conn, String userId, String userName) {
		
		String userNo = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("findUserNo2");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userName);
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

	/**
	 * 이름, 주민등록번호로 userNo 찾기 (2/4) 기업건강검진 예약 추가
	 * author : 임상우
	 * @param conn
	 * @param name
	 * @param ssn
	 * @return 회원번호
	 */
	public String findUserNo3(Connection conn, String name, String ssn) {

		String userNo = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("findUserNo3");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, ssn);
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

	public int signUpChildrenMember(Connection conn, Member m) {
		int result = 0;
	    PreparedStatement pstmt = null;
	    String sql = prop.getProperty("signUpChildrenMember");
	    
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
	        pstmt.setString(11, m.getRepresentative());

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
	 * 회원 아이디와 이름으로 회원 정보 검색 (페이징 처리)
	 * author : 임상우
	 * @param conn
	 * @param userId
	 * @param userName
	 * @param pi 
	 * @return 조회된 데이터들 
	 */
	public List<Member> selectMember(Connection conn, String userId, String userName, PageInfo pi) {
		
		//select문 => 여러 행 => List<Member>
		List<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		
		
		if( !userId.equals("") && !userName.equals("") ) { // 둘 다 값을 입력한 경우
			sql += "AND USER_ID LIKE ? AND USER_NAME LIKE ?";
		}
		else if( !userId.equals("") ) { // 아이디만 입력한 경우
			sql += "AND USER_ID LIKE ?";
		}
		else if( !userName.equals("") ) { // 이름만 입력한 경우
			sql += "AND USER_NAME LIKE ?";
		}
		// 둘 다 값을 입력하지 않으면 전체 회원검색이 실행된다.
		
		sql += ") WHERE RNUM BETWEEN ? AND ?";		
		
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			int paramIndex = 1; // 파라미터 인덱스를 동적으로 설정
			 
			
			
			if( !userId.equals("") && !userName.equals("") ) { // 둘 다 값을 입력한 경우
				pstmt.setString(paramIndex++, "%" + userId + "%");
				pstmt.setString(paramIndex++, "%" + userName + "%");
			}
			else if( !userId.equals("") ) { // 아이디만 입력한 경우
				pstmt.setString(paramIndex++, "%" + userId + "%");
			}
			else if( !userName.equals("") ) { // 이름만 입력한 경우
				pstmt.setString(paramIndex++, "%" + userName + "%");
			}
			
			
			// 페이징 처리를 위한 시작값, 끝값 계산. 
            int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
            int endRow = startRow + pi.getBoardLimit() - 1;
           
            pstmt.setInt(paramIndex++, startRow);
            pstmt.setInt(paramIndex++, endRow);
				
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
	 * userid와 username으로 회원 수 조회 (일반회원만)
	 * author : 임상우
	 * @param conn
	 * @param userName 
	 * @param userId 
	 * @return userid와 username으로 조회된 회원 수
	 */
	public int selectMemberListCount(Connection conn, String userId, String userName) {
		 
        // select => ResultSet(게시글갯수, 숫자한개) => int
        int listCount = 0;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectMemberListCount");
        
        
		if( !userId.equals("") && !userName.equals("") ) { // 둘 다 값을 입력한 경우
			sql += "AND USER_ID LIKE ? AND USER_NAME LIKE ?";
		}
		else if( !userId.equals("") ) { // 아이디만 입력한 경우
			sql += "AND USER_ID LIKE ?";
		}
		else if( !userName.equals("") ) { // 이름만 입력한 경우
			sql += "AND USER_NAME LIKE ?";
		}
		// 둘 다 값을 입력하지 않으면 전체 회원검색이 실행된다.
		
		
		
        try {
            pstmt = conn.prepareStatement(sql);
            
            
            int paramIndex = 1; // 파라미터 인덱스를 동적으로 설정
            
			if( !userId.equals("") && !userName.equals("") ) { // 둘 다 값을 입력한 경우
				pstmt.setString(paramIndex++, "%" + userId + "%");
				pstmt.setString(paramIndex++, "%" + userName + "%");
			}
			else if( !userId.equals("") ) { // 아이디만 입력한 경우
				pstmt.setString(paramIndex++, "%" + userId + "%");
			}
			else if( !userName.equals("") ) { // 이름만 입력한 경우
				pstmt.setString(paramIndex++, "%" + userName + "%");
			}
            
			
            rset = pstmt.executeQuery();
           
            if(rset.next()) {
                listCount = rset.getInt("count");
            }
           
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
       
        return listCount;
	}
	
	
	

}
