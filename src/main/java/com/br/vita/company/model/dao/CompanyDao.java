package com.br.vita.company.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

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
	
}
