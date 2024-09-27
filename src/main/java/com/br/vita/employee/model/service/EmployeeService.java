package com.br.vita.employee.model.service;

import static com.br.vita.common.template.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.br.vita.employee.model.dao.EmployeeDao;
import com.br.vita.employee.model.vo.Employee;


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



	/**
	 * 기업의 사원 추가
	 * author : 임상우
	 * @param compName
	 * @param empName
	 * @param empSSN
	 * @param empNo
	 * @return 추가된 행 수
	 */
	public int insertEmployee(String compName, String empName, String empSSN, String empNo) {
		Connection conn = getConnection();
		int result = eDao.insertEmployee(conn, compName, empName, empSSN, empNo);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		
		close(conn);
		return result;
	}


	/**
	 * 기업의 사원 수정
	 * author : 임상우
	 * @param e
	 * @param compName
	 * @param beforeSSN
	 * @return 업데이트된 행 수
	 */
	public int updateEmployee(Employee e, String compName, String beforeSSN) {
		
		Connection conn = getConnection();
		int result = eDao.updateEmployee(conn, e, compName, beforeSSN);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}


	/**
	 * 기업의 사원 삭제
	 * author : 임상우
	 * @param ssnList
	 * @return 삭제된 행 수
	 */
	public int deleteEmployee(String[] ssnList) {
		
		Connection conn = getConnection();
		int result = eDao.deleteEmployee(conn, ssnList);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}



	/**
	 * 사번 찾기 (이름과 주민등록번호로) (1/4) 기업건강검진 예약 추가
	 * author : 임상우
	 * @param name
	 * @param ssn
	 * @param com 
	 * @return empNo
	 */
	public String findEmpNo(String name, String ssn, String com) {
		Connection conn = getConnection();
		String empNo = eDao.findEmpNo(conn, name, ssn, com);
		close(conn);
		return empNo;
	}
	
	
	
	
}
