package com.br.vita.doctor.model.service;

import static com.br.vita.common.template.JDBCTemplate.close;
import static com.br.vita.common.template.JDBCTemplate.commit;
import static com.br.vita.common.template.JDBCTemplate.getConnection;
import static com.br.vita.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.br.vita.doctor.model.dao.DoctorDao;
import com.br.vita.doctor.model.vo.Doctor;
import com.br.vita.doctor.model.vo.DoctorSchedule;
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
	public int doctorInsert(Member m) {
		
		Connection conn = getConnection();
		int result = dDao.doctorInsert(conn, m);
		
		if(result > 0) {
		   commit(conn);
		}else {
		   rollback(conn);
		}
	      		  
	    close(conn);  
		return result;
		
	}
	

	public int doctorScheduleUpdate(List<DoctorSchedule> list) {

		Connection conn = getConnection();

		int result = dDao.doctorScheduleUpdate(conn, list);

		close(conn);

		return result;
		

	}
	
	public List<DoctorSchedule> shcedulePageSelect(String doctor) {
		
		Connection conn = getConnection();

		List<DoctorSchedule> schedule = dDao.shcedulePageSelect(conn, doctor);

		close(conn);

		return schedule;
		
		
	}

}
