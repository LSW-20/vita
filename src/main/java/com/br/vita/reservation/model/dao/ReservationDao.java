package com.br.vita.reservation.model.dao;

import static com.br.vita.common.template.JDBCTemplate.close;

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
import java.util.Map;
import java.util.Properties;

import com.br.vita.member.model.vo.Member;
import com.br.vita.reservation.model.vo.CheckList;
import com.br.vita.reservation.model.vo.Consultation;



public class ReservationDao {

   private Properties prop = new Properties();
   
   public ReservationDao() {
      
      String filePath = ReservationDao.class.getResource("/db/mappers/reservation-mapper.xml").getPath();

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
   
   /**
	 * 첫방문 안내 예약 정보 기존 회원정보와 일치하는지 조회
	 * select
	 * @author 정준수
	 * @param conn
	 * @param phone, userName, userSSN
	 * @return m
	 */
   public Member ComparisonMember(Connection conn, String userId,  String phone, String userName, String userSSN) {
      
       Member m = null;
       PreparedStatement pstmt = null;
       ResultSet rset = null;

       String sql = prop.getProperty("ComparisonMember");

       
           try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, phone);
         pstmt.setString(2, userName);
         pstmt.setString(3, userSSN);
         
         rset = pstmt.executeQuery();
         
            if (rset.next()) {
                   m = new Member (rset.getString("USER_ID")
                              ,   rset.getString("USER_TYPE")
                              ,   rset.getString("PHONE")
                              ,   rset.getString("USER_NAME")
                              ,   rset.getString("USER_SSN"));
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
	 * 진료예약 첫번째페이지 주민번호 뒷자리 기존 정보와 비교
	 * select
	 * @author 정준수
	 * @param conn
	 * @param userSSN
	 * @return m
	 */
   public Member SSNBackNum (Connection conn, String userId,  String userSSN) {
	   
	   Member m = null;
       PreparedStatement pstmt = null;
       ResultSet rset = null;

       String sql = prop.getProperty("SSNBackNum");

       
           try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, userSSN);
      
         
         rset = pstmt.executeQuery();
         
            if (rset.next()) {
                   m = new Member (rset.getString("USER_ID"));
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
	 * 진료예약 회원 추가
	 * insert
	 * @author 정준수
	 * @param conn
	 * @param UserNo, DoctorNo, AppointmentTime 
	 * @return result
	 */
	public int Consultation(Connection conn, Consultation c) {
		
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("InsertCareApp");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getUserNo());
			pstmt.setString(2, c.getDoctorNo());
			pstmt.setString(3, c.getAppointmentTime());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	/**
	 * 예약 내역 조회 Dao
	 * select - rset
	 * @author 최보겸
	 * @param conn
	 * @param userNo
	 * @return consultations
	 */
	public List<Consultation> selectCareAppList(Connection conn, String userNo) {
		List<Consultation> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCareAppList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Consultation(rset.getString("APPOINTMENT_NO")
										, rset.getDate("APPOINTMENT_DATE")
										, rset.getString("APPOINTMENT_TIME")
										, rset.getString("USER_NAME")
										, rset.getString("DOCTOR_NAME")
										, rset.getString("DEPT_NAME")			
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
	 * 하루에 오전 오후 한번씩만 예약가능하도록 정보가 있는지 비교
	 * select
	 * @author 정준수
	 * @param conn
	 * @param userNo, appointmentTime
	 * @return hasAppointment
	 */
	public boolean SelectConsultation(Connection conn, String userNo, String appointmentTime) {
		
		boolean hasAppointment = false;
		PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    
	    String sql = prop.getProperty("SelectConsultation");
	    
	    try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userNo);
			pstmt.setString(2, appointmentTime);
			
			 rset = pstmt.executeQuery();
	         
			 if (rset.next()) {
		            hasAppointment = true; 
		        }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
	
		
	    return hasAppointment; 
	
		
	}

	/**
	 * 예약 취소 처리
	 * delete
	 * @author 최보겸
	 * @param conn
	 * @param appointmentNo
	 * @return result
	 */
	public int deleteCareApp(Connection conn, String appointmentNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteCareApp");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, appointmentNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	/**
	 * 예약완료페이지 예약내역 동적으로 수정
	 * select
	 * @author 정준수
	 * @param conn
	 * @param userNo, appointmentTime
	 * @return m
	 */
	public List<Consultation> selectSuccess(Connection conn, String userNo, String appointmentTime) {
		List<Consultation> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSuccess");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userNo);
			pstmt.setString(2, appointmentTime);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Consultation(rset.getString("DEPT_NAME")
										, rset.getString("USER_NO")
										, rset.getString("DOCTOR_NAME")
										, rset.getString("APPOINTMENT_TIME")
										, rset.getDate("APPOINTMENT_DATE")		
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
	 * 일반 검진 회원 입력값과 기존 정보 비교
	 * select
	 * @author 정준수
	 * @param conn
	 * @param userName, userSSN, phone, email
	 * @return m
	 */
	public Member NormalMember(Connection conn, String userId, String userName, String userSSN, String phone,
			String email) {
		
		   Member m = null;
	       PreparedStatement pstmt = null;
	       ResultSet rset = null;

	       String sql = prop.getProperty("NormalMember");
	       // SELECT USER_ID, USER_NAME, USER_SSN, PHONE, EMAIL
	       // FROM MEMBER WHERE USER_NAME = ? AND USER_SSN =  ? AND PHONE = ?
	   	
	       if( !email.equals("@") ) {
	    	   sql += "AND EMAIL = ?";
	       }
	       
	       
	       
	           try {
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, userName);
	         pstmt.setString(2, userSSN);
	         pstmt.setString(3, phone);
	         
	         if( !email.equals("@") ) {
	        	 pstmt.setString(4, email);
	         }
	         
	         rset = pstmt.executeQuery();
	         
	            if (rset.next()) {
	                   m = new Member (rset.getString("USER_ID")
	                              ,   rset.getString("USER_NAME")
	                              ,   rset.getString("USER_SSN")
	                              ,   rset.getString("PHONE")
	                              ,   rset.getString("EMAIL"));   
	                   
	               }
	            
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
	           
	        return m;
	        
	}

	public List<Map<String, Object>> selectCareApp(Connection conn, String deptName, String docName, String appDate1, String appDate2) {
		
		List<Map<String, Object>> resultList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCareApp");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, deptName);
			pstmt.setString(2, docName);
			pstmt.setString(3, appDate1);
			pstmt.setString(4, appDate2);
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		
		return resultList;
	}

	public void insertHealthCheckList(Connection conn, CheckList ck) {
		
	
	}
		
		
		
		
	
   
   
}
