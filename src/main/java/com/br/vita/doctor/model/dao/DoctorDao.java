package com.br.vita.doctor.model.dao;

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

import com.br.vita.doctor.model.vo.Doctor;
import com.br.vita.doctor.model.vo.DoctorSchedule;

public class DoctorDao {

	private Properties prop = new Properties();

	public DoctorDao() {

		String filePath = DoctorDao.class.getResource("/db/mappers/doctor-mapper.xml").getPath();

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

	public List<DoctorSchedule> selectSchedule(Connection conn, String dept) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<DoctorSchedule> d = new ArrayList<>();

		String sql = prop.getProperty("selectSchedule");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dept);
			rset = pstmt.executeQuery();

			while (rset.next()) {

				DoctorSchedule dShedule = new DoctorSchedule(rset.getString("WORKING")
															, rset.getString("SCHEDULE_TIME")
															,rset.getString("SCHEDULE_WEEK"));

				d.add(dShedule);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return d;

	}
	
	public Doctor selectDoctor(Connection conn, String dept) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Doctor doc = null;

		String sql = prop.getProperty("selectDoctor");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dept);
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				doc = new Doctor(rset.getString("DOCTOR_NO")
						        ,rset.getString("USER_NO")
						        ,rset.getDate("HIRE_DATE")
						        ,rset.getString("DOCTOR_NAME")
						        ,rset.getString("LICENCE_NO")
						        ,rset.getString("DEPT_NAME"));
			}
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return doc;
		
		
		
	}
	

}
