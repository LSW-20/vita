package com.br.vita.company.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.br.vita.company.model.vo.Company;
import static com.br.vita.common.template.JDBCTemplate.*;


public class CompanyDao {

	private Properties prop = new Properties();
	
	public CompanyDao() {
		
		String filePath = CompanyDao.class.getResource("/db/mappers/company-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	/**
	 * 모든 연계기업 목록 조회
	 * author : 임상우
	 * @param conn
	 * @return List<Company>
	 */
	public List<Company> companySelect(Connection conn) {
		
		List<Company> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("companySelect");
		System.out.println(sql);
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add( new Company(rset.getString("COMP_NO"), rset.getString("COMP_NAME")) );
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset); // JDBCTemplate.java에서 rset.close를 한다. (null이 아니고 이미 닫혀있지 않으면)
			close(pstmt);
		}
		
		
		
		return list;
	}
	
	
	/**
	 * 연계기업 추가
	 * author : 임상우
	 * @param conn
	 * @param compNo
	 * @param compName
	 * @param adminNo
	 * @return 추가된 행 수
	 */
	public int companyInsert(Connection conn, String compNo, String compName, String adminNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("companyInsert");

		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, compNo);
			pstmt.setString(2, compName);
			pstmt.setString(3, adminNo);
			
			System.out.println(sql);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}
	
	
	public int companyUpdate(Connection conn, String compNo, String compName, String originCompNo, String adminNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("companyUpdate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, compNo);
			pstmt.setString(2, compName);
			pstmt.setString(3, adminNo);
			pstmt.setString(4, originCompNo);
			
			System.out.println(sql);
			result = pstmt.executeUpdate();
			System.out.println(result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
}
