package com.br.vita.payment.model.service;
import java.sql.Connection;
import static com.br.vita.common.template.JDBCTemplate.*;
import com.br.vita.payment.model.dao.PaymentDao;

public class PaymentService {
	private PaymentDao pDao = new PaymentDao();

	
	/**
	 * 증명서 결제시 insert
	 * @author 최보겸
	 * @param payNo
	 * @param userNo
	 * @param docNum
	 * @param payId
	 * @return
	 */
	public int insertPayDocument(String payNo, String userNo, String payId, String pg) {
		Connection conn = getConnection();
		int payResult = pDao.insertPayDocument2(conn, payNo, userNo, payId, pg);
		
		if(payResult > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return payResult;
	}//payDocument


	public int insertPayHealthCheck(String payNo, String userNo, String pg) {
		
		Connection conn = getConnection();
		int payResult = pDao.insertPayHealthCheck(conn, payNo, userNo,  pg);
		
		if(payResult > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return payResult;
	
	}
	
	

}
