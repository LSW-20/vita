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
import java.util.HashMap;
import java.util.InvalidPropertiesFormatException;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import com.br.vita.doctor.model.vo.Doctor;
import com.br.vita.employee.model.vo.Employee;
import com.br.vita.member.model.vo.Member;
import com.br.vita.reservation.model.vo.CheckList;
import com.br.vita.reservation.model.vo.Consultation;
import com.br.vita.reservation.model.vo.HealthCheck;



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
	public Map<String, List<?>> selectCareAppList(Connection conn, String userNo) {
		List<Consultation> cList = new ArrayList<>();
		List<HealthCheck> hList = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCareAndCheckupAppList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userNo);
			pstmt.setString(2, userNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				String sourceType = rset.getString("SOURCE_TYPE");
				
				if("CARE".equals(sourceType)) {
					//CARE_APP에서 온 데이터는 Consultation리스트에 추가
					cList.add(new Consultation(rset.getString("APPOINTMENT_NO")
											 , rset.getDate("APPOINTMENT_DATE")
											 , rset.getString("APPOINTMENT_TIME")
											 , rset.getString("USER_NAME")
											 , rset.getString("DOCTOR_NAME")
											 , rset.getString("DEPT_NAME")			
							));
				}else if("CHECKUP".equals(sourceType)) {
					//CHECKUP_APP에서 온 데이터는 HealthCheck리스트에 추가
					hList.add(new HealthCheck(rset.getString("APPOINTMENT_NO")
											, rset.getString("COMPANY_NO")
											, rset.getDate("APPOINTMENT_DATE")
										    , rset.getString("APPOINTMENT_TIME")
										    , rset.getString("COMP_NAME")
										    , rset.getString("USER_NAME")
							
							));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		//두 리스트를 Map에 담아 리턴
		Map<String, List<?>> resultMap = new HashMap<>();
		resultMap.put("cList", cList);
		resultMap.put("hList", hList);
		return resultMap;
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

	
	/**
	 * 관리자 진료 예약 관리 조회
	 * author : 임상우
	 * @param conn
	 * @param deptName
	 * @param docName
	 * @param appDate1
	 * @param appDate2
	 * @return 조회된 list
	 */
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
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Map<String, Object> map = new HashMap<>();
				
				Consultation c = new Consultation();
				c.setAppointmentNo(rset.getString("APPOINTMENT_NO"));
				c.setAppointmentDate(rset.getDate("APPOINTMENT_DATE"));
				c.setAppointmentTime(rset.getString("APPOINTMENT_TIME"));
				
				
				c.setCareStatus(rset.getString("CARE_STATUS").equals("Y") ? "진료 완료" : "진료 전");
				
				
				Member m = new Member();
				m.setUserNo(rset.getString("USER_NO"));
				m.setUserName(rset.getString("USER_NAME"));
				m.setPhone(rset.getString("PHONE"));
				
				Doctor d = new Doctor();
				d.setDeptName(rset.getString("DEPT_NAME"));
				d.setDoctorName(rset.getString("DOCTOR_NAME"));
				
				map.put("c", c);
				map.put("m", m);
				map.put("d", d);
				
				resultList.add(map);
				
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return resultList;
	}


	/**
	 * 진료예약 추가(2/2)
	 * @param conn
	 * @param userNo
	 * @param docName
	 * @param deptName
	 * @param appointmentTime
	 * @return 추가된 행 수
	 */
	public int insertCareApp(Connection conn, String userNo, String docName, String deptName, String appointmentTime) {

		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertCareApp");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userNo);
			pstmt.setString(2, docName);
			pstmt.setString(3, deptName);
			pstmt.setString(4, appointmentTime);
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	/**
	 * 일반건강검진 조회
	 * author : 임상우
	 * @param conn
	 * @param startDate
	 * @param endDate
	 * @return 조회된 list
	 */
	public List<Map<String, Object>> selectCheckupAppN(Connection conn, String startDate, String endDate) {

		List<Map<String, Object>> listN = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCheckupAppN");
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, startDate);
			pstmt.setString(2, endDate); 
			rset=pstmt.executeQuery();
			
			
			while(rset.next()) {
				
				Map<String, Object> map = new HashMap<>();
				
				HealthCheck h = new HealthCheck();
				h.setAppointmentNo(rset.getString("APPOINTMENT_NO"));
				h.setCheckUpDate(rset.getDate("CHECKUP_DATE"));
				h.setAppointmentTime(rset.getString("APPOINTMENT_TIME"));
				h.setTotalPrice(rset.getString("TOTAL_PRICE"));
				
				Member m = new Member();
				m.setUserId(rset.getString("USER_ID"));
				m.setUserName(rset.getString("USER_NAME"));
				
				CheckList c = new CheckList();
				c.setMediList(rset.getString("MEDI_LIST"));
				c.setSurgeryYN(rset.getString("SURGERY_YN"));
				c.setSurgeryName(rset.getString("SURGERY_NAME"));
				c.setFlyYN(rset.getString("FLY_YN"));
				
				
				map.put("h", h);
 				map.put("m", m);
				map.put("c", c);
			
				listN.add(map);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listN;
		
		
	}

	
	/**
	 * 기업건강검진 조회
	 * author : 임상우
	 * @param conn
	 * @param com
	 * @param startDate
	 * @param endDate
	 * @return 조회된 list
	 */
	public List<Map<String, Object>> selectCheckupAppC(Connection conn, String com, String startDate, String endDate) {
		
		List<Map<String, Object>> listC = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCheckupAppC");
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, startDate);
			pstmt.setString(2, endDate); 
			pstmt.setString(3, com);
			rset=pstmt.executeQuery();
			
			
			while(rset.next()) {
				
				Map<String, Object> map = new HashMap<>();
				
				HealthCheck h = new HealthCheck();
				h.setAppointmentNo(rset.getString("APPOINTMENT_NO"));
				h.setCheckUpDate(rset.getDate("CHECKUP_DATE"));
				h.setAppointmentTime(rset.getString("APPOINTMENT_TIME"));
				h.setTotalPrice(rset.getString("TOTAL_PRICE"));
				
				Employee e = new Employee();
				e.setEmpName(rset.getString("EMP_NAME"));
				e.setEmpNo(rset.getString("EMP_NO"));
				
				CheckList c = new CheckList();
				c.setMediList(rset.getString("MEDI_LIST"));
				c.setSurgeryYN(rset.getString("SURGERY_YN"));
				c.setSurgeryName(rset.getString("SURGERY_NAME"));
				c.setFlyYN(rset.getString("FLY_YN"));
				
				
				map.put("h", h);
 				map.put("e", e);
				map.put("c", c);
				map.put("com", com);
			
				listC.add(map);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listC;
		
	}
	

	public int deleteCheckupApp(Connection conn, String appNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteCheckupApp");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, appNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertHealthCheckList(Connection conn, CheckList ck) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertCheckList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ck.userNo);
			pstmt.setString(2, ck.mediList);
			pstmt.setString(3, ck.surgeryName);
			pstmt.setString(4, ck.surgeryYN);
			pstmt.setString(5, ck.flyYN);
			pstmt.setString(6, ck.careNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertHealtchCareList(Connection conn, String userNo, String time, String date) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertNormalCheckUp");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userNo);
			pstmt.setString(2, time);
			pstmt.setString(3, date);
		
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	/**
	 * 일반건강검진 예약 추가 (2/3)
	 * author : 임상우
	 * @param conn
	 * @param userNo
	 * @param time
	 * @param date
	 * @param price
	 * @return 삽입된 행 수
	 */
	public int insertCheckupAppN(Connection conn, String userNo, String time, String date, String price) {

		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertCheckupAppN");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userNo);
			pstmt.setString(2, time);
			pstmt.setString(3, date);
			pstmt.setString(4, price);
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
		
		
	}

	/**
	 * 일반건강검진 예약 추가 (3/3), 기업건강검진 예약 추가(4/4)
	 * author : 임상우
	 * @param conn
	 * @param userNo
	 * @param mediList
	 * @param surgeryYN
	 * @param surgeryName
	 * @param flightYN
	 * @param time
	 * @param date
	 * @param price
	 * @return 삽입된 행 수
	 */
	public int insertChecklist(Connection conn, String userNo, String mediList, String surgeryYN, String surgeryName,
			String flightYN, String time, String date, String price) {

		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertChecklist");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userNo);
			pstmt.setString(2, mediList);
			pstmt.setString(3, surgeryName);
			pstmt.setString(4, surgeryYN);
			pstmt.setString(5, flightYN);
			pstmt.setString(6, userNo);
			pstmt.setString(7, date);
			pstmt.setString(8, time);
			pstmt.setString(9, price);
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	/**
	 * 기업건강검진 예약 추가 (3/4)
	 * author : 임상우
	 * @param conn
	 * @param com
	 * @param time
	 * @param date
	 * @param price
	 * @return 삽입된 행 수
	 */
	public int insertCheckupAppC(Connection conn, String userNo, String com, String time, String date, String price) {

		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertCheckupAppC");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userNo);
			pstmt.setString(2, com);
			pstmt.setString(3, time);
			pstmt.setString(4, date);
			pstmt.setString(5, price);
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertCheckListt(Connection conn, String userNo, String mediList, String surgeryName,
			String surgeryYN, String flyYN) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertCheckList1");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userNo);
			pstmt.setString(2, mediList);
			pstmt.setString(3, surgeryName);
			pstmt.setString(4, surgeryYN);
			pstmt.setString(5, flyYN);
			pstmt.setString(6, userNo);
		
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
		
		
	}

	public List<HealthCheck> selectSuccessNormal(Connection conn, String userNo, String appointmentNo,
			String checkupDate, String appointmentDate) {


		List<HealthCheck> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNormalSuccess");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userNo);
			pstmt.setString(2, appointmentNo);
			pstmt.setString(3, checkupDate);
			pstmt.setString(4, appointmentDate);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new HealthCheck(rset.getString("APPOINTMENT_NO")
										, rset.getString("USER_NO")
										, rset.getDate("APPOINTMENT_DATE")
										, rset.getString("APPOINTMENT_TYPE")
										, rset.getDate("CHECKUP_DATE")	
										, rset.getString("TOTAL_PRICE")
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

	public List<Employee> selectCompany(Connection conn, String companyName, String name, String name1) {
		
		
		List<Employee> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCompany11");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, companyName);
			pstmt.setString(2, name);
			pstmt.setString(3, name1);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Employee(rset.getString("COMP_NAME")
										, rset.getString("EMP_NAME")
										, rset.getString("EMP_NO")
								
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


		
		
		
		
	
   
   
}

