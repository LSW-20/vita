package com.br.vita.payment.model.service;
import java.sql.Connection;
import static com.br.vita.common.template.JDBCTemplate.*;
import com.br.vita.payment.model.dao.PaymentDao;

public class PaymentService {
	private PaymentDao pDao = new PaymentDao();

	
	
	public int insertPayDocument(String payNo, String userNo, String docNum, String payId) {
		Connection conn = getConnection();
		int payResult = pDao.insertPayDocument(conn, payNo, userNo, docNum, payId);
		
		if(payResult > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return payResult;
	}//payDocument
	
	

}
