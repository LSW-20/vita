package com.br.vita.payment.model.dao;
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
public class PaymentDao {
	private Properties prop = new Properties();
	
	public PaymentDao() {
		String filePath = PaymentDao.class.getResource("/db/mappers/payment-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}//PaymentDao

	/**
	 * 증명서 발급 결제
	 * @author 최보겸
	 * @param conn
	 * @param payNo - merchant_uid
	 * @param userNo 
	 * @param docNum - 발급받을 문서번호
	 * @param payId - imp_id
	 * @return payResult
	 */
	public int insertPayDocument(Connection conn, String payNo, String userNo, String docNum, String payId) {
		int payResult = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPayDocument");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, payNo);
			pstmt.setString(2, userNo);
			pstmt.setString(3, docNum);
			pstmt.setString(4, payId);
			
			payResult = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return payResult;
	}//payDocument
	
	

}
