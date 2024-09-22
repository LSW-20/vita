package com.br.vita.reservation.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class ReservationDao {
	
	private Properties prop = new Properties();
	
	public ReservationDao() {
		
		String filePath = ReservationDao.class.getResource("/db/mappers/reservation-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	// dao 클래스에 전역변수랑 기본생성자 내가 만들어놨어 준수양 by. 상우
}
