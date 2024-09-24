package com.br.vita.reservation.model.service;

import static com.br.vita.common.template.JDBCTemplate.close;
import static com.br.vita.common.template.JDBCTemplate.getConnection;
import static com.br.vita.common.template.JDBCTemplate.commit;
import static com.br.vita.common.template.JDBCTemplate.rollback;

import java.sql.Connection;

import com.br.vita.member.model.vo.Member;
import com.br.vita.reservation.model.dao.ReservationDao;
import com.br.vita.reservation.model.vo.Consultation;

public class ReservationService {

	private ReservationDao rdao = new ReservationDao();
	
	public Member ComparisonMember(String userId, String phone, String userName, String userSSN) {
		
		Connection conn = getConnection();
		Member firstVisit = rdao.ComparisonMember(conn,  userId,  phone, userName, userSSN);
		close(conn);
		
		return firstVisit;
	
	}
	
	public Member SSNBackNum (String userId, String userSSN){
		
		Connection conn = getConnection();
		Member backNum = rdao.SSNBackNum(conn,  userId, userSSN);
		close(conn);
		
		return backNum;
	
	}

	public int Consultation(Consultation c) {
		
		Connection conn = getConnection();
		int result =  rdao.Consultation(conn, c);
		
		if(result > 0) {
			commit(conn);
		} else  {
			rollback(conn);
		}
		
		close(conn);
		return result;
		
		
	}

	public boolean SelectConsultation(String userNo) {
		
		Connection conn = getConnection();
		boolean hasAppointment = rdao.SelectConsultation(conn,  userNo);
		
		close(conn);
		return hasAppointment;
	}


	
	
	
}
