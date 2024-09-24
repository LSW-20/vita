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
	
}
