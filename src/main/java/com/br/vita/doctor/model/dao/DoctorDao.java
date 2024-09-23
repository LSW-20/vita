package com.br.vita.doctor.model.dao;

import static com.br.vita.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
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
import com.br.vita.doctor.model.vo.DoctorSchedule;
import com.br.vita.member.model.vo.Member;

public class DoctorDao {

	private Properties prop = new Properties();

	public DoctorDao() {

		String filePath = DoctorDao.class.getResource("/db/mappers/doctor-mapper.xml").getPath();

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

	public List<DoctorSchedule> selectSchedule(Connection conn, String dept) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<DoctorSchedule> list = new ArrayList<>();

		String sql = prop.getProperty("selectSchedule");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dept);
			rset = pstmt.executeQuery();

			while (rset.next()) {

				DoctorSchedule dShedule = new DoctorSchedule(rset.getString("WORKING")
															, rset.getString("SCHEDULE_TIME")
															,rset.getString("SCHEDULE_WEEK"));

				list.add(dShedule);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;

	}
	
	public Doctor selectDoctor(Connection conn, String dept) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Doctor doc = null;

		String sql = prop.getProperty("selectDoctor");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dept);
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				doc = new Doctor(rset.getString("DOCTOR_NO")
						        ,rset.getString("USER_NO")
						        ,rset.getDate("HIRE_DATE")
						        ,rset.getString("DOCTOR_NAME")
						        ,rset.getString("LICENCE_NO")
						        ,rset.getString("DEPT_NAME"));
			}
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return doc;
		
		
		
	}
	
	
	
	/**
	 * 의사 이름으로 의료진 계정 검색
	 * author : 임상우
	 * @param conn
	 * @param doctorName
	 * @return 검색된 의료진 계정 정보(DOCTOR, MEMBER 객체)
	 */
	public List<Map<String, Object>> selectByName(Connection conn, String doctorName) {
		
		//select문 => 여러 행 => 조인했으므로 vo 객체 두 개를 담는다. Map<String, Object>
		//그런데 그냥 Map만 쓰면 key값이 같아서 덮어쓰여진다. List<Map<String, Object>>을 써야 한다.
		
		List<Map<String, Object>> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectByName");
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, doctorName);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				
				Map<String, Object> docMap = new HashMap<>();
				
				docMap.put("doctor", new Doctor(rset.getString("DOCTOR_NO")
												, rset.getDate("HIRE_DATE")
												, rset.getString("DOCTOR_NAME")
												, rset.getString("LICENCE_NO")
												, rset.getString("DEPT_NAME")
												));
				docMap.put("member", new Member(rset.getString("PHONE")
												, rset.getString("ADDRESS")
												, rset.getString("USER_SSN")
												));
				
				list.add(docMap);
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
	 * 의사 사번으로 의료진 계정 검색
	 * author : 임상우
	 * @param conn
	 * @param doctorNo
	 * @return 검색된 의료진 계정 정보(DOCTOR, MEMBER 객체)
	 */
	public List<Map<String, Object>> selectByDNO(Connection conn, String doctorNo) {
		
		//select문 => 한 행 => 조인했으므로 vo 객체 두 개를 담는다. Map<String, Object>
		//그런데 그냥 Map만 쓰면 key값이 같아서 덮어쓰여진다. List<Map<String, Object>>을 써야 한다.
		List<Map<String, Object>> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectByDNO");
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, doctorNo);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				
				Map<String, Object> docMap = new HashMap<>();
				
				docMap.put("doctor", new Doctor(rset.getString("DOCTOR_NO")
												, rset.getDate("HIRE_DATE")
												, rset.getString("DOCTOR_NAME")
												, rset.getString("LICENCE_NO")
												, rset.getString("DEPT_NAME")
												));
				docMap.put("member", new Member(rset.getString("PHONE")
												, rset.getString("ADDRESS")
												, rset.getString("USER_SSN")
												));
				
				list.add(docMap);
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
	 * 의사 진료과로 의료진 계정 검색
	 * author : 임상우
	 * @param conn
	 * @param dept
	 * @return 검색된 의료진 계정 정보(DOCTOR, MEMBER 객체)
	 */
	public List<Map<String, Object>> selectByDept(Connection conn, String dept) {
		
		//select문 => 여러 행 => 조인했으므로 vo 객체 두 개를 담는다. Map<String, Object>
		//그런데 그냥 Map만 쓰면 key값이 같아서 덮어쓰여진다. List<Map<String, Object>>을 써야 한다.
		List<Map<String, Object>> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "";
		
		if(dept.equals("전체")) {
			sql = prop.getProperty("selectByDept");
		} else {
			sql = prop.getProperty("selectByDept");
			sql += "where dept_name = ?";
		}
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			if(!dept.equals("전체")) {
				pstmt.setString(1, dept);
			}
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				
				Map<String, Object> docMap = new HashMap<>();
				
				docMap.put("doctor", new Doctor(rset.getString("DOCTOR_NO")
												, rset.getDate("HIRE_DATE")
												, rset.getString("DOCTOR_NAME")
												, rset.getString("LICENCE_NO")
												, rset.getString("DEPT_NAME")
												));
				docMap.put("member", new Member(rset.getString("PHONE")
												, rset.getString("ADDRESS")
												, rset.getString("USER_SSN")
												));
				
				list.add(docMap);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public int doctorScheduleUpdate(Connection conn, List<DoctorSchedule> list) {
		
		
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("doctorScheduleUpdate");
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			for(int i=0; i<= list.size(); i++) {
				
				pstmt.setString(1,list.get(i).getWorking());
				pstmt.setString(2,list.get(i).getDoctorNo());
				pstmt.setString(3,list.get(i).getScheduleWeek());
				pstmt.setString(4,list.get(i).getScheduleTime());
				
				result += pstmt.executeUpdate();
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
		
	}
	
	
	/**
	 * 의사 계정 추가 (1/3) 회원 테이블 추가
	 * author : 임상우
	 * @param conn
	 * @param m
	 * @return 처리된 행 수
	 */
	public int insertToMember(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertToMember");
		

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getAddress());
			pstmt.setString(7, m.getUserSSN());
			pstmt.setString(8, m.getUserDate());
			pstmt.setString(9, m.getGender());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	
	
	
	/**
	 * 의사 계정 추가 (2/3) 의사 테이블 추가
	 * author : 임상우
	 * @param conn
	 * @param m
	 * @return 처리된 행 수
	 */
	public int insertToDoctor(Connection conn, Doctor d, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertToDoctor");
		

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUserSSN());
			pstmt.setString(2, d.getDoctorName());
			pstmt.setString(3, d.getLicenceNo());
			pstmt.setString(4, d.getDeptName());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

}
