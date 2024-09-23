package com.br.vita.reservation.model.service;

import static com.br.vita.common.template.JDBCTemplate.close;
import static com.br.vita.common.template.JDBCTemplate.commit;
import static com.br.vita.common.template.JDBCTemplate.getConnection;
import static com.br.vita.common.template.JDBCTemplate.rollback;

import java.sql.Connection;

import com.br.vita.member.model.vo.Member;
import com.br.vita.reservation.model.dao.ReservationDao;

public class ReservationService {

	private ReservationDao rdao = new ReservationDao();
	
	public Member ComparisonMember(String userId, String phone, String userName, String userSSN) {
		
		Connection conn = getConnection();
		Member firstVisit = rdao.ComparisonMember(conn,  userId,  phone, userName, userSSN);
		close(conn);
		
		return firstVisit;
	
	}
	
	
}
