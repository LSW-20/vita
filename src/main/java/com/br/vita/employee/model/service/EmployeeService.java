package com.br.vita.employee.model.service;

import static com.br.vita.common.template.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.br.vita.employee.model.dao.EmployeeDao;


public class EmployeeService {

	EmployeeDao eDao = new EmployeeDao();
	
	
	
	/**
	 * 기업의 사원 검색
	 * author : 임상우
	 * @param selectCom
	 * @return 조회된 값들
	 */
	public List<Map<String, Object>> selectEmployee(String selectCom) {
		Connection conn = getConnection();
		List<Map<String, Object>> empList = eDao.selectEmployee(conn, selectCom);
		close(conn);
		return empList;
	}



	public int insertEmployee(String compNo, String empName, String empSSN, String empNo) {
		Connection conn = getConnection();
		int result = eDao.insertEmployee(conn, compNo, empName, empSSN, empNo);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		
		close(conn);
		return result;
	}
	
	
	
	
}
