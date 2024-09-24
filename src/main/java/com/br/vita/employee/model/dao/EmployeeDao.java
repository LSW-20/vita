package com.br.vita.employee.model.dao;

import static com.br.vita.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import com.br.vita.company.model.vo.Company;
import com.br.vita.employee.model.vo.Employee;
import com.br.vita.member.model.vo.Member;


public class EmployeeDao {

	private Properties prop = new Properties();
	
	public EmployeeDao() {
		
		String filePath = EmployeeDao.class.getResource("/db/mappers/employee-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	/**
	 * 기업의 사원 검색
	 * author : 임상우
	 * @param conn
	 * @param selectCom
	 * @return 조회된 값들
	 */
	public List<Map<String, Object>> selectEmployee(Connection conn, String selectCom) {
		
		List<Map<String, Object>> empList = new ArrayList<Map<String,Object>>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectEmployee");
		
		if(!selectCom.equals("전체")) {
			sql += "WHERE COMP_NAME = ?" ;
		}
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			if(!selectCom.equals("전체")) {
				pstmt.setString(1, selectCom);
			}
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Map<String, Object> empMap = new HashMap<>();
				
				Company com = new Company();
				com.setCompNo(rset.getString("COMP_NO"));
				com.setCompName(rset.getString("COMP_NAME"));
				
				Employee emp = new Employee();
				emp.setEmpNo(rset.getString("EMP_NO"));
				emp.setEmpName(rset.getString("EMP_NAME"));
				
				Member mem = new Member();
				mem.setUserNo(rset.getString("USER_NO"));
				mem.setUserId(rset.getString("USER_ID"));
				
				empMap.put("com", com);
				empMap.put("emp", emp);
				empMap.put("mem", mem);

				empList.add(empMap);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return empList;
	}


	public int insertEmployee(Connection conn, String compNo, String empName, String empSSN, String empNo) {

		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertEmployee");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, empSSN);
			pstmt.setString(2, empName);
			pstmt.setString(3, compNo);
			pstmt.setString(4, empNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		
		return result;
	}
	
	
	
	
	
}
