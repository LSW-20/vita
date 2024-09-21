package com.br.vita.employee.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class EmployeeDao {

	private Properties prop = new Properties();
	
	public EmployeeDao() {
		
		String filePath = EmployeeDao.class.getResource("/db/mappers/company-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
}
