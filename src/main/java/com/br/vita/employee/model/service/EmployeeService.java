package com.br.vita.employee.model.service;

import static com.br.vita.common.template.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.br.vita.employee.model.dao.EmployeeDao;


public class EmployeeService {

	EmployeeDao eDao = new EmployeeDao();
	
	
	public List<Map<String, Object>> selectEmployee(String selectCom) {
		Connection conn = getConnection();
		List<Map<String, Object>> empList = eDao.selectEmployee(conn, selectCom);
		close(conn);
		return empList;
	}
	
	
	
	
}
