package com.br.vita.doctor.model.service;

import static com.br.vita.common.template.JDBCTemplate.close;
import static com.br.vita.common.template.JDBCTemplate.commit;
import static com.br.vita.common.template.JDBCTemplate.getConnection;
import static com.br.vita.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.br.vita.common.model.vo.PageInfo;
import com.br.vita.doctor.model.dao.DoctorDao;
import com.br.vita.doctor.model.vo.Doctor;
import com.br.vita.doctor.model.vo.DoctorSchedule;
import com.br.vita.issue.model.vo.Mrecords;
import com.br.vita.member.model.vo.Member;

public class DoctorService {
	
	private DoctorDao dDao = new DoctorDao();
	
	
	public Map<String,Object> selectSchedule(String dept) {
		
		Connection conn = getConnection();
//		System.out.println(no);
		Map<String,Object> map = new HashMap<>();
		
		// 1) 넘겨받은 진료과에 해당하는 의사객체 조회
		Doctor doc = dDao.selectDoctor(conn,dept);
		
		// 2) 해당 의사의 근무일정 List조회 
		
		// 1번결과와 2번결과 Map 에 담아 반환
		
		
		List<DoctorSchedule> list = dDao.selectSchedule(conn,dept);
		
		map.put("doc",doc);
		map.put("list",list);
		
		
		close(conn);
		
		return map;
		
		
		
	}
	
	
	/**
	 * 의사 이름으로 의료진 계정 검색
	 * author : 임상우
	 * @param doctorName
	 * @return 검색된 의료진 계정 정보(DOCTOR, MEMBER 객체)
	 */
	public List<Map<String, Object>> selectByName(String doctorName) {
		
		Connection conn = getConnection();
		List<Map<String, Object>> list = dDao.selectByName(conn, doctorName);
		close(conn);
		return list;

	}
	
	
	
	/**
	 * 의사 사번으로 의료진 계정 검색
	 * author : 임상우
	 * @param doctorNo
	 * @return 검색된 의료진 계정 정보(DOCTOR, MEMBER 객체)
	 */
	public List<Map<String, Object>> selectByDNO(String doctorNo) {
		
		Connection conn = getConnection();
		List<Map<String, Object>> list = dDao.selectByDNO(conn, doctorNo);
		close(conn);
		return list;

	}
	
	
	
	/**
	 * 의사 진료과로 의료진 계정 검색
	 * author : 임상우
	 * @param dept
	 * @return 검색된 의료진 계정 정보(DOCTOR, MEMBER 객체)
	 */
	public List<Map<String, Object>> selectByDept(String dept) {
		
		Connection conn = getConnection();
		List<Map<String, Object>> list = dDao.selectByDept(conn, dept);
		close(conn);
		return list;
		
	}
	

	
	/**
	 * 의사 계정 추가 (1/3) 회원 테이블 추가
	 * author : 임상우
	 * @param m
	 * @return 추가된 행 수
	 */
	public int insertToMember(Member m) {
		
		Connection conn = getConnection();
		int result = dDao.insertToMember(conn, m);
		
		if(result > 0) {
		   commit(conn);
		}else {
		   rollback(conn);
		}
	      		  
	    close(conn);  
		return result;
		
	}
	
	
	
	/**
	 * 의사 계정 추가 (2/3) 의사 테이블 추가
	 * author : 임상우
	 * @param d
	 * @param m
	 * @return 추가된 행 수
	 */
	public int insertToDoctor(Doctor d, Member m) {
		
		Connection conn = getConnection();
		int result = dDao.insertToDoctor(conn, d, m);
		
		if(result > 0) {
		   commit(conn);
		}else {
		   rollback(conn);
		}
	      		  
	    close(conn);  
		return result;
		
	}


	
	/**
	 * 의사 계정 추가 (3/3) 스케쥴 테이블 추가
	 * author : 임상우
	 * @param d
	 * @return 추가된 행 수
	 */
	public int insertToSchedule(Doctor d) {
		
		Connection conn = getConnection();
		int result = dDao.insertToSchedule(conn, d);
		
		if(result > 0) {
		   commit(conn);
		}else {
		   rollback(conn);
		}
	      		  
	    close(conn);  
		return result;
		
	}

	
	// 의료진페이지 일정 업데이트
	public int doctorScheduleUpdate(List<DoctorSchedule> list) {

		Connection conn = getConnection();

		int result = dDao.doctorScheduleUpdate(conn, list);

		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);

		return result;
		

	}
	
	// 의료진 일정조회
	public List<DoctorSchedule> schedulePageSelect(String docNo) {
		
		Connection conn = getConnection();

		List<DoctorSchedule> schedule = dDao.schedulePageSelect(conn, docNo);

		close(conn);

		return schedule;
		
		
	}
	
	
	
	
	/**
	 * 의사 계정 수정 (1/2) doctor 테이블 update
	 * author : 임상우
	 * @param d
	 * @param uqLicenceNo
	 * @return 처리된 행 수
	 */
	public int updateDoctor(Doctor d, String uqLicenceNo) {
		
		Connection conn = getConnection();
		int result = dDao.updateDoctor(conn, d, uqLicenceNo);
		
		if(result > 0) {
		   commit(conn);
		}else {
		   rollback(conn);
		}
	      		  
	    close(conn);  
		return result;
		
	}
	
	
	
	/**
	 * 의사 계정 수정 (2/2) member 테이블 update
	 * author : 임상우
	 * @param d
	 * @param uqDoctorSsn
	 * @return 처리된 행 수
	 */
	public int updateMember(Member m, String uqDoctorSsn) {
		
		Connection conn = getConnection();
		int result = dDao.updateMember(conn, m, uqDoctorSsn);
		
		if(result > 0) {
		   commit(conn);
		}else {
		   rollback(conn);
		}
	      		  
	    close(conn);  
		return result;
		
	}
	
	
	
	/**
	 * 의사 계정 삭제 (doctor, member 테이블)
	 * author : 임상우
	 * @param ssnArray
	 * @return 처리된 행 수
	 */
	public int deleteDoctor(String[] ssnArray) {
		
		Connection conn = getConnection();
		int result = dDao.deleteDoctor1(conn, ssnArray);
		int result2 = dDao.deleteDoctor2(conn, ssnArray);
		
		if(result > 0 && result2 > 0) {
		   commit(conn);
		}else {
		   rollback(conn);
		}
	      		  
	    close(conn);  
		return result2;
		
	}
	
	
	// 의료진페이지 페이징 진단서 신청목록 조회
	public List<Member> documentSelect(String docNo, String type,PageInfo pi) {
		
		Connection conn = getConnection();
		
		List<Member> doculist = dDao.documentSelect(conn,docNo,type,pi);
		
		close(conn);
		
		return doculist;
		
		
		
	}
	
	public int selectDocumentListCount(String docNo, String type) {
		
		Connection conn = getConnection();
		
		int listCount = dDao.selectDocumentListCount(conn,docNo,type);
		
		close(conn);
		
		return listCount;
		
	}


	/**
	 * 현재 전체 의사 이름, 진료과 조회
	 * author : 임상우
	 * @return List<Doctor>
	 */
	public List<Doctor> selectDoctorList() {
		
		Connection conn = getConnection();
		
		List<Doctor> list = dDao.selectDoctorList(conn);
		
		close(conn);
		
		return list;
	}
	
	
	// 진료기록(진단서용) 조회
	public Map<String,Object> diagnosisSelectFile(String userNo,String careNo,String type) {
		
		Connection conn = getConnection();

		Map<String,Object> careMap = dDao.diagnosisSelectFile(conn,userNo,careNo,type);

		close(conn);

		return careMap;
		
	}
	
	
	public int yesNoUpdateByDiagnosis(String yes, String careNo, String type) {
		
		Connection conn = getConnection();
		
		int result = dDao.yesNoUpdateByDiagnosis(conn, yes,careNo,type);
		
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		
		close(conn);
		
		return result;
		
		
	}
	
	public void selectRes() {
		Connection conn = getConnection();
		 dDao.selectRes(conn);
		 
		 close(conn);
		 
		 
		
	}
	
	
	
	
	
	
	
	
	
}
