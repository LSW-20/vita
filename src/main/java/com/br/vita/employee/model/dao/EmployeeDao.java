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
				emp.setSsn(rset.getString("SSN"));
			
				
				empMap.put("com", com);
				empMap.put("emp", emp);

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


	/**
	 * 기업의 사원 추가
	 * author : 임상우
	 * @param conn
	 * @param compName
	 * @param empName
	 * @param empSSN
	 * @param empNo
	 * @return 추가된 행 수
	 */
	public int insertEmployee(Connection conn, String compName, String empName, String empSSN, String empNo) {

		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertEmployee");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, empSSN);
			pstmt.setString(2, empName);
			pstmt.setString(3, compName);
			pstmt.setString(4, empNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	
	/**
	 * 기업의 사원 수정
	 * author : 임상우
	 * @param conn
	 * @param e
	 * @param compName
	 * @param beforeSSN
	 * @return 업데이트된 행 수
	 */
	public int updateEmployee(Connection conn, Employee e, String compName, String beforeSSN) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateEmployee");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, e.getSsn());
			pstmt.setString(2, e.getEmpName());
			pstmt.setString(3, compName);
			pstmt.setString(4, e.getEmpNo());
			pstmt.setString(5, beforeSSN);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException ee) {
			ee.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}


	/**
	 * 기업의 사원 삭제
	 * @param conn
	 * @param ssnList
	 * @return 삭제된 행 수
	 */
	public int deleteEmployee(Connection conn, String[] ssnList) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteEmployee");
		// DELETE FROM EMPLOYEE WHERE SSN IN (   	
		
		for(int i=0; i<ssnList.length; i++) {
			sql += "?";
			
			if( i != (ssnList.length-1) ) {
				sql += ",";
			}
		}
		
		sql += ")";
		
		//System.out.println(sql);
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			for(int i=0; i<ssnList.length; i++) {
				pstmt.setString(i+1, ssnList[i]);
			}
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException ee) {
			ee.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}


	/**
	 * 사번 찾기 (이름과 주민등록번호로) (1/4) 기업건강검진 예약 추가
	 * author : 임상우
	 * @param conn
	 * @param name
	 * @param ssn
	 * @return empNo
	 */
	public String findEmpNo(Connection conn, String name, String ssn) {
		
		String empNo = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("findEmpNo");
		

		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, ssn);

			rset = pstmt.executeQuery();
			
			
			
			if(rset.next()) {
				empNo = rset.getString("EMP_NO");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return empNo;
	}
	
	
	
	
	
}
