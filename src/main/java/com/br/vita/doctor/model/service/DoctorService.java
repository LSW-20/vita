package com.br.vita.doctor.model.service;

import static com.br.vita.common.template.JDBCTemplate.close;
import static com.br.vita.common.template.JDBCTemplate.getConnection;

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
	
	
	
	public List<Map<String, Object>> selectByName(String doctorName) {
		
		Connection conn = getConnection();
		List<Map<String, Object>> list = dDao.selectByName(conn, doctorName);
		close(conn);
		return list;

	}
	

}
