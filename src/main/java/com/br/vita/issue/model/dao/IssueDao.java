package com.br.vita.issue.model.dao;

import static com.br.vita.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.List;
import java.util.Properties;

import com.br.vita.issue.model.vo.Mrecords;



public class IssueDao {

	private Properties prop = new Properties();

	public IssueDao() {

		String filePath = IssueDao.class.getResource("/db/mappers/issue-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(filePath));

		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	public int certificateApplicationInsert(Connection conn, String userNo, String type ,String Date,String purpose) {
		
		
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("certificateApplicationInsert");
		/* System.out.println(sql); */
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1,userNo);
			pstmt.setString(2,userNo);
			pstmt.setString(3,Date);
			pstmt.setString(4,type );
			pstmt.setString(5,purpose);
			
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
		
		
	}
	
	public int certificateApplicationSelect(Connection conn, String userNo,String type, String date) {
		
		int count = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("certificateApplicationSelect");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, userNo);
			pstmt.setString(2, date);
			pstmt.setString(3, type);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
		
		
		
	}

	/**
	 * 진료기록 조회 Dao
	 * @author 최보겸
	 * @param conn
	 * @param userNo
	 * @return records
	 */
	public List<Mrecords> selectMrecords(Connection conn, String userNo, String startDate, String endDate) {
		List<Mrecords> records = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMrecords");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userNo);
			pstmt.setString(2, startDate);
			pstmt.setString(3, endDate);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Mrecords r = new Mrecords();
				r.setTreatmentDate(rset.getDate("TREATMENT_DATE"));
				r.setDiagnosisName(rset.getString("DIAGNOSIS_NAME"));
				records.add(r);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return records;
	}
	
	
	

}
