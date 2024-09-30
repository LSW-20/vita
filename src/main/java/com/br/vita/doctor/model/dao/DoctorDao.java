package com.br.vita.doctor.model.dao;

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

import com.br.vita.common.model.vo.PageInfo;
import com.br.vita.doctor.model.vo.Doctor;
import com.br.vita.doctor.model.vo.DoctorSchedule;
import com.br.vita.issue.model.vo.Mrecords;
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
	
	
	
	
	
	public int doctorScheduleUpdate(Connection conn, List<DoctorSchedule> list) {
		
		
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("doctorScheduleUpdate");
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			for(int i=0; i< list.size(); i++) {
				
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
	
	
	public List<DoctorSchedule> schedulePageSelect(Connection conn, String docNo) {
		
		

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<DoctorSchedule> list = new ArrayList<>();

		String sql = prop.getProperty("schedulePageSelect");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, docNo);
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

	
	
	/**
	 * 의사 계정 추가 (3/3) 스케쥴 테이블 추가
	 * author : 임상우
	 * @param conn
	 * @param d
	 * @return 처리된 행 수
	 */
	public int insertToSchedule(Connection conn, Doctor d) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertToSchedule");
		

		String[] day = {"월", "화", "수", "목", "금"};
		String[] time = {"A", "P"};
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			for(int i=0; i<day.length; i++) { // 한 의사당 10개의 데이터가 schedule 테이블에 들어간다.
				
				pstmt.setString(1, d.getLicenceNo());
				pstmt.setString(3, day[i]);
				
				for(int j=0; j<time.length; j++) {
					pstmt.setString(2, time[j]);

					result += pstmt.executeUpdate();
				}
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	
	
	/**
	 * 의사 계정 수정 (1/2) doctor 테이블 수정
	 * author : 임상우
	 * @param conn
	 * @param d
	 * @return 처리된 행 수
	 */
	public int updateDoctor(Connection conn, Doctor d, String uqLicenceNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateDoctor");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
		
			pstmt.setString(1, d.getDoctorName());
			pstmt.setString(2, d.getLicenceNo());
			pstmt.setString(3, d.getDeptName());
			pstmt.setDate(4, d.getHireDate());	
			pstmt.setString(5, uqLicenceNo);

			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	
	
	/**
	 * 의사 계정 수정 (2/2) member 테이블 수정
	 * author : 임상우
	 * @param conn
	 * @param d
	 * @return 처리된 행 수
	 */
	public int updateMember(Connection conn, Member m, String uqDoctorSsn) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateMember");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
		
			pstmt.setString(1, m.getUserName());
			pstmt.setString(2, m.getUserSSN());
			pstmt.setString(3, m.getAddress());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, uqDoctorSsn);
			
			//System.out.println(sql);

			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	
	
	/**
	 * 의사 계정 삭제 (1/2) doctor 테이블
	 * author : 임상우
	 * @param conn
	 * @param ssnArray
	 * @return 처리된 행 수
	 */
	public int deleteDoctor1(Connection conn, String[] ssnArray) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteDoctor1"); 
		// "DELETE FROM DOCTOR WHERE USER_NO IN (SELECT USER_NO 
		//  FROM MEMBER WHERE USER_SSN IN ("
		
		
		for(int i=0; i<ssnArray.length; i++) {
			
			sql += "?";
			
			if(i != (ssnArray.length-1) ) { // 마지막엔 컴마 x
				sql += ", ";
			}
		}
		
		sql += "))";
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			for(int i=0; i<ssnArray.length; i++) {
				
				pstmt.setString(i+1, ssnArray[i]);
				
			}
				
			//System.out.println(sql);

			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	
	
	
	/**
	 * 의사 계정 삭제 (2/2) member 테이블
	 * author : 임상우
	 * @param conn
	 * @param ssnArray
	 * @return 처리된 행 수
	 */
	public int deleteDoctor2(Connection conn, String[] ssnArray) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteDoctor2"); 
		// "DELETE FROM	MEMBER WHERE USER_SSN IN ("
		 
		
		for(int i=0; i<ssnArray.length; i++) {
			
			sql += "?";
			
			if(i != (ssnArray.length-1) ) { // 마지막엔 컴마 x
				sql += ", ";
			}
		}
		
		sql += ")";
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			for(int i=0; i<ssnArray.length; i++) {
				
				pstmt.setString(i+1, ssnArray[i]);
				
			}
				
			//System.out.println(sql);

			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	
	
	// 진단서신청목록 조회
	public List<Member> documentSelect(Connection conn, String docNo, String type,PageInfo pi) {
		
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		/* Map<String, Object> doculist = new HashMap<>(); */
		List<Member> list = new ArrayList<>();
		
		
		String sql = prop.getProperty("documentSelect");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, docNo);
			pstmt.setString(2, type);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(3, startRow);
			pstmt.setInt(4,endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				/*
				 * 다른 컬럼들이 많아 담아 놓을 vo 객체가 마땅치 않을때 map 활용!
				 * 하지만 다른 컬럼이 1~2개정도 적을 경우 vo 객체에 매개변수 생성하는게 더 편한다. 
				 * 
				 * doculist.put("USER_NO",rset.getString("USER_NO"));
				 * doculist.put("USER_NAME",rset.getString("USER_NAME"));
				 * doculist.put("USER_SSN",rset.getString("USER_SSN"));
				 * doculist.put("DEPT_NAME",rset.getString("DEPT_NAME"));
				 * doculist.put("PHONE",rset.getString("PHONE"));
				 */
//				
//				docuMem = new Member(rset.getString("USER_NO")
//									,rset.getString("USER_NAME")
//									,rset.getString("USER_SSN")
//									,rset.getString("DEPT_NAME")
//									,rset.getString("PHONE"));
//				
				Member docuMem = new Member();
				docuMem.setUserNo(rset.getString("USER_NO"));
				docuMem.setUserName(rset.getString("USER_NAME"));
				docuMem.setPhone(rset.getString("PHONE"));
				docuMem.setDeptName(rset.getString("DEPT_NAME"));
				docuMem.setUserSSN(rset.getString("USER_SSN"));
				docuMem.setCareNo(rset.getString("CARE_NO"));
				
				
									
				list.add(docuMem);
				
			}

			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
		
		
		
	}

	
	// 증명서신청 리스트 총 갯수 조회
	public int selectDocumentListCount(Connection conn, String docNo, String type) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String sql = prop.getProperty("selectDocumentListCount");
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, docNo);
			pstmt.setString(2, type);			
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				
				listCount = rset.getInt("COUNT");
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
		
		
		
	}

	/**
	 * 현재 전체 의사 이름, 진료과 조회
	 * author : 임상우
	 * @param conn
	 * @return List<Doctor>
	 */
	public List<Doctor> selectDoctorList(Connection conn) {
		
		List<Doctor> list = new ArrayList<Doctor>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectDoctorList");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Doctor d = new Doctor();
				d.setDoctorName(rset.getString("DOCTOR_NAME"));
				d.setDeptName(rset.getString("DEPT_NAME"));
				
				list.add(d);
			}
		 	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}
	
	
	
//    진료기록(진단서) 조회용
	public Map<String,Object> diagnosisSelectFile(Connection conn,String userNo,String careNo,String type) {
		
		Map<String,Object> careMap = new HashMap<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("diagnosisSelectFile");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, userNo);
			pstmt.setString(2, careNo);
			pstmt.setString(3, type);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				
				Member mem = new Member();
				Mrecords mrc = new Mrecords();
				Doctor doc = new Doctor();
				
				mem.setUserName(rset.getString("USER_NAME"));
				mem.setUserSSN(rset.getString("USER_SSN"));
				mem.setAddress(rset.getString("ADDRESS"));
				
				mrc.setSymptoms(rset.getString("SYMPTOMS"));
				mrc.setOpinion(rset.getString("OPINION"));
				mrc.setDiagnosisName(rset.getString("DIAGNOSIS_NAME"));
				mrc.setTreatmentContent(rset.getString("TREATMENT_CONTENT"));
				
				
				mrc.setTreatmentDate(rset.getDate("TREATMENT_DATE"));
				
				
				
				doc.setLicenceNo(rset.getString("LICENCE_NO"));
				doc.setDoctorName(rset.getString("DOCTOR_NAME"));
			
				
				
				careMap.put("Member", mem);
				careMap.put("Mrecords", mrc);
				careMap.put("Doctor", doc);
				
			}
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return careMap;
		
		
		
		
	}
	
	
	
//	증명서 승인|거절 업데이트
	public int yesNoUpdateByDiagnosis(Connection conn, String yes, String careNo, String type) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("yesNoUpdateByDiagnosis");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, yes);
			pstmt.setString(2, careNo);
			pstmt.setString(3, type);
			
		
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
			
		
	
	}
	
//  진료실 예약조회 리스트 조회
	public List<Map<String,Object>> selectRes(Connection conn, String docNo) {
		
		List<Map<String,Object>> relist = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRes");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, docNo);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				Map<String,Object> reMap = new HashMap<>();
				
				reMap.put("userName", rset.getString("USER_NAME"));
				reMap.put("userDate", rset.getString("USER_DATE"));
				reMap.put("userNo", rset.getString("USER_NO"));
				reMap.put("appointment", rset.getString("APP_NO"));
				reMap.put("count", rset.getString("COUNT"));
				reMap.put("userSSN", rset.getString("USER_SSN"));
				
				reMap.put("phone", rset.getString("PHONE"));
				reMap.put("address", rset.getString("ADDRESS"));
				
				
				
				relist.add(reMap);
				
				
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return relist;
		
		
		
	}
	
//	의료진 해당 진료실 이동 관련 조회문
	public Member teatmentRoomGo(Connection conn, String userNo){
		
		Member mem = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("teatmentRoomGo");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, userNo);
			
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				mem = new Member(rset.getString("USER_NAME")
								,rset.getString("DEPT_NAME"));
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return mem;
		
		
	}
	
//	진료기록 insert
	public int treatRoomInsert(Connection conn, Map<String,Object> mrMap) {
		
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("treatRoomInsert");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			
			pstmt.setString(1,(String)mrMap.get("resNo"));
			pstmt.setString(2,(String)mrMap.get("userNo"));
			pstmt.setString(3,(String)mrMap.get("docNo"));
			pstmt.setString(4,(String)mrMap.get("userName"));
			
			pstmt.setString(5,(String)mrMap.get("userNo"));
			
			pstmt.setString(6,(String)mrMap.get("symptoms"));
			pstmt.setString(7,(String)mrMap.get("opinion"));
			pstmt.setString(8,(String)mrMap.get("treatment"));
			pstmt.setString(9,(String)mrMap.get("diagnosis"));
			pstmt.setString(10,(String)mrMap.get("deptName"));
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
		
		
	}
	
//	진료 후 해당 환자예약 업데이트
	public int resUpdate(Connection conn, Map<String,Object> mrMap) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("resUpdate");
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1,(String)mrMap.get("resNo"));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
		
	}
	
	
	// 진료기록페이지 진료기록 전체 조회
	public List<Map<String, Object>> selectAllmrecords(Connection conn, String userName, String deptName, String date1, String date2, PageInfo pi) {
	    
		
		List<Map<String, Object>> mrcList = new ArrayList<>();
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;

	    
	    String sql = prop.getProperty("selectAllmrecords");

	    try {
	        pstmt = conn.prepareStatement(sql);

	        
	        pstmt.setString(1, userName);
	        pstmt.setString(2, deptName);
	        pstmt.setString(3, date1);
	        pstmt.setString(4, date2);

	        int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1; // 시작 행
	        int endRow = startRow + pi.getBoardLimit() - 1; // 종료 행

	        pstmt.setInt(5, startRow);
	        pstmt.setInt(6, endRow);

	        rset = pstmt.executeQuery();

	        while (rset.next()) {
	            Map<String, Object> mrMap = new HashMap<>();
	            mrMap.put("userNo", rset.getString("USER_NO"));
	            mrMap.put("userName", rset.getString("USER_NAME"));
	            mrMap.put("userSSN", rset.getString("USER_SSN"));
	            mrMap.put("deptName", rset.getString("DEPT_NAME"));
	            mrMap.put("treatment", rset.getString("TREATMENT"));
	            mrMap.put("careNo", rset.getString("CARE_NO"));
	            
	            mrcList.add(mrMap);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rset);
	        close(pstmt);
	    }

	    return mrcList;
	}
	
	
	
	
	
	
	
	// 진료기록 검색 총 갯수
	public int selectAllmrecordsCount(Connection conn, String userName,String deptName,String date1,String date2) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		
		String sql = prop.getProperty("selectAllmrecordsCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, userName);
			pstmt.setString(2, deptName);			
			pstmt.setString(3, date1);			
			pstmt.setString(4, date2);	
			
			
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return listCount;
		
	}
	
	
	// 진료기록 검색 후 기록보기 진단서/진료확인서 내용 전체 조회 
	public Map<String,Object> selectMrecordsAllListSelect(Connection conn, String userNo, String careNo){
		
		
		Map<String,Object> mrAllMap = new HashMap<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMrecordsAllListSelect");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, userNo);
			pstmt.setString(2, careNo);
			
			rset=pstmt.executeQuery();
			
			
			while(rset.next()) {
				
				mrAllMap.put("userName", rset.getString("USER_NAME"));
				mrAllMap.put("userSSN", rset.getString("USER_SSN"));
				mrAllMap.put("treatDate", rset.getDate("TREATMENT_DATE"));
				mrAllMap.put("symptoms", rset.getString("SYMPTOMS"));
				mrAllMap.put("opinion", rset.getString("OPINION"));
				mrAllMap.put("treatment", rset.getString("TREATMENT_CON"));
				mrAllMap.put("diagnosis", rset.getString("DIAGNOSIS_NAME"));
				mrAllMap.put("address", rset.getString("ADDRESS"));
				mrAllMap.put("licence", rset.getString("LICENCE_NO"));
				mrAllMap.put("docName", rset.getString("DOCTOR_NAME"));
				
				
				System.out.println("날짜:" + mrAllMap.get("treatDate"));
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return mrAllMap;
		
		
		
	}
	
	

	/**
	 * 의사 계정 검색(이름, 사번, 진료과)
	 * author : 임상우
	 * @param conn
	 * @param doctorName
	 * @param doctorNo
	 * @param dept
	 * @return
	 */
	public List<Map<String, Object>> selectDoctor2(Connection conn, String doctorName, String doctorNo, String dept) {
		
		//select문 => 여러 행 => 조인했으므로 vo 객체 두 개를 담는다. Map<String, Object>
		//그런데 그냥 Map<String, Object>에 담으면 key값이 같아서 덮어쓰여진다. List<Map<String, Object>>을 써야 한다.
		List<Map<String, Object>> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "";
		

		// 텍스트 상자와 달리 radio 버튼과 checkbox는 선택하지 않으면 빈문자열이 아닌 null이 넘어와서 null pointer exception 발생한다. => (수정) checked 줘서 NULL인 경우는 없다.
		if(dept.equals("전체")) {
			sql = prop.getProperty("selectDoctor2");
		} else {
			sql = prop.getProperty("selectDoctor2");
			sql += "where dept_name LIKE ?";
		}
			
		
		if( !doctorName.equals("") ) { // 의사명을 입력했다면
			if(dept.equals("전체")) {
				sql += "WHERE DOCTOR_NAME LIKE ?";
			} else {
				sql += "AND DOCTOR_NAME LIKE ?";
			}
		}
		
		if( !doctorNo.equals("") ) { // 의사 사번을 입력했다면
			if(dept.equals("전체")) {
				sql += "WHERE DOCTOR_NO LIKE ?";
			} else {
				sql += "AND DOCTOR_NO LIKE ?";
			}
		}		
		
		
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			int num=1; // 동적으로 물음표가 늘어나는 경우, 물음표들의 번호는 밖에 int형 변수를 선언해 놓고 후위증감연산자를 사용.
			
			
			if(!dept.equals("전체")) { // 특정 진료과를 선택한 경우
				pstmt.setString(num++, dept);
			}
			
			
			if( !doctorName.equals("") ) { // 의사명을 입력했다면
				pstmt.setString(num++, "%" + doctorName + "%");
			}
			
			if( !doctorNo.equals("") ) { // 의사 사번을 입력했다면
				pstmt.setString(num++, "%" + doctorNo + "%");
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
	
	
	
	
	public List<String> selectDoctorBYDept(Connection conn, String dept) {

		List<String> docList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectDoctorBYDept");
		

		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dept);

			rset=pstmt.executeQuery();
			
			
			while(rset.next()) {
				
				docList.add(rset.getString("DOCTOR_NAME"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return docList;
	}
	
	
	
	
}
