package com.br.vita.issue.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;



public class IssueDao {

	private Properties prop = new Properties();

	public IssueDao() {

		String filePath = IssueDao.class.getResource("/db/mappers/doctor-mapper.xml").getPath();

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
		
		
		
		
		
		
		
		
	}
	
	
	
	
	
	
	
	

}
