package com.br.vita.reservation.model.service;

import static com.br.vita.common.template.JDBCTemplate.close;
import static com.br.vita.common.template.JDBCTemplate.commit;
import static com.br.vita.common.template.JDBCTemplate.getConnection;
import static com.br.vita.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

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

	/**
	 * 예약 내역 조회
	 * @author 최보겸
	 * @param userNo 회원 식별할 회원번호
	 * @return consultations 예약정보 가져올 객체
	 */
	public List<Consultation> selectCareAppList(String userNo) {
		Connection conn = getConnection();
		List<Consultation> consultations = rdao.selectCareAppList(conn, userNo);
		close(conn);
		return consultations;
	}

	public boolean SelectConsultation(String userNo , String appointmentTime) {
		
		Connection conn = getConnection();
		boolean hasAppointment = rdao.SelectConsultation(conn,  userNo, appointmentTime);
		
		close(conn);
		return hasAppointment;
	}
	
	public List<Consultation> selectSuccess(String userNo, String appointmentTime) {
		Connection conn = getConnection();
		List<Consultation> Success = rdao.selectSuccess(conn, userNo, appointmentTime);
		close(conn);
		return Success;
	}
	
	

	/**
	 * 예약 취소 요청
	 * @author 최보겸
	 * @param appointmentNo 식별할 예약번호
	 * @return result 처리 행수
	 */
	public int deleteCareApp(String appointmentNo) {
		Connection conn = getConnection();
		int result = rdao.deleteCareApp(conn, appointmentNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}


	
	
	
}
