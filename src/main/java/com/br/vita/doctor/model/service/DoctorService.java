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
	
	// 증명서 신청 총 갯수 조회
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
	
	// 진단서 승인|거절 업데이트
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
	
//	진료실페이지 예약리스트 조회
	public List<Map<String,Object>> selectRes(String docNo) {
		Connection conn = getConnection();
		List<Map<String,Object>> relist = dDao.selectRes(conn,docNo);
		 
		 close(conn);
		 
		 return relist;
		 
		
	}
//	해당 과 진료실 분류용 조회 
	public Member teatmentRoomGo(String userNo){
		
		
		Connection conn = getConnection();
		
		Member mem = dDao.teatmentRoomGo(conn,userNo);
		
		close(conn);
		
		return mem;
		
	}
	
	
//	진료기록 insert 후 예약리스트 업데이트
	public int treatRoomInsertAndreUpdate(Map<String,Object> mrMap){
		
		Connection conn = getConnection();
		
		int mrresult = dDao.treatRoomInsert(conn,mrMap);
		
		if(mrresult > 0) {
			int result = dDao.resUpdate(conn, mrMap);
			
			if(result > 0) {
				commit(conn);
			}
			
		}else {
			rollback(conn);
		}
		
		
		
		
		close(conn);
		
		return mrresult;
		
		
		
	}
	
	
	// 진료기록페이지 검색 전체조회
	public List<Map<String,Object>> selectAllmrecords(String userName,String deptName,String date1,String date2,PageInfo pi){
		
		
		Connection conn = getConnection();
		
		List<Map<String,Object>> mrcList = dDao.selectAllmrecords(conn,userName,deptName,date1,date2,pi);
		
		close(conn);
		
		return mrcList;
		
		
		
	}
	
	// 진료기록 검색 총 갯수 조회
	public int selectAllmrecordsCount(String userName,String deptName,String date1,String date2) {
		
		Connection conn = getConnection();
		int result = dDao.selectAllmrecordsCount(conn,userName,deptName,date1,date2);
		
		close(conn);
		
		return result;
	}
	
	
	// 진료기록 검색 후 기록보기 진단서/진료확인서 내용 전체 조회
	public Map<String,Object> selectMrecordsAllListSelect(String userNo,String careNo){
		
		Connection conn = getConnection();
		
		Map<String,Object> mrallMap = dDao.selectMrecordsAllListSelect(conn,userNo,careNo);
		
		close(conn);
		
		return mrallMap;
		
		
		
		
	}


	/**
	 * 의사 계정 검색(이름, 사번, 진료과)
	 * author : 임상우
	 * @param doctorName
	 * @param doctorNo
	 * @param dept
	 * @return 조회된 데이터들
	 */
	public List<Map<String, Object>> selectDoctor(String doctorName, String doctorNo, String dept) {
		Connection conn = getConnection();
		List<Map<String, Object>> list = dDao.selectDoctor2(conn, doctorName, doctorNo, dept);
		close(conn);
		return list;
	}
	
	
	
	
	
	
	
	
	
}
