package com.br.vita.reservation.model.service;

import static com.br.vita.common.template.JDBCTemplate.close;
import static com.br.vita.common.template.JDBCTemplate.commit;
import static com.br.vita.common.template.JDBCTemplate.getConnection;
import static com.br.vita.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.br.vita.member.model.vo.Member;
import com.br.vita.reservation.model.dao.ReservationDao;
import com.br.vita.reservation.model.vo.CheckList;
import com.br.vita.reservation.model.vo.Consultation;

public class ReservationService {

	private ReservationDao rdao = new ReservationDao();
	
	
	/**
	 * 첫방문예약 멤버정보 비교
	 * @author 정준수
	 * @param  userId 회원 식별할 핸드폰번호, 회원이름, 주민번호
	 * @return firstVisit 멤버정보 가져올 객체
	 */
	public Member ComparisonMember(String userId, String phone, String userName, String userSSN) {
		
		Connection conn = getConnection();
		Member firstVisit = rdao.ComparisonMember(conn,  userId,  phone, userName, userSSN);
		close(conn);
		
		return firstVisit;
	
	}
	
	/**
	 * 진료예약 멤버정보 비교
	 * @author 정준수
	 * @param  userId 회원 식별할 주민번호뒷자리
	 * @return backNum 멤버정보 가져올 객체
	 */
	public Member SSNBackNum (String userId, String userSSN){
		
		Connection conn = getConnection();
		Member backNum = rdao.SSNBackNum(conn,  userId, userSSN);
		close(conn);
		
		return backNum;
	
	}

	/**
	 * 진료예약 회원 정보 추가
	 * @author 정준수
	 * @param  userNo 회원이 입력한 doctorName, appointmentTime
	 * @return result 값 가져올 객체
	 */
	
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

	/**
	 * 당일 진료 신청 유무
	 * @author 정준수
	 * @param  userNo 회원 식별할 진료시간
	 * @return hasAppointment 진료예약 기록 가져올 객체
	 */
	public boolean SelectConsultation(String userNo , String appointmentTime) {
		
		Connection conn = getConnection();
		boolean hasAppointment = rdao.SelectConsultation(conn,  userNo, appointmentTime);
		close(conn);
		return hasAppointment;
	}
	
	
	/**
	 * 진료예약 성공페이지 동적으로 정보 가져오기
	 * @author 정준수
	 * @param  userNo 회원 식별할 진료시간
	 * @return Success 멤버정보 가져올 객체
	 */
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

	
	/**
	 * 일반 검진 예약 멤버정보 비교
	 * @author 정준수
	 * @param  userId 회원 식별할 회원명, 주민번호, 핸드폰번호, 이메일
	 * @return normal 멤버정보 가져올 객체
	 */
	public Member NormalMember(String userId, String userName, String userSSN, String phone, String email) {
		
		Connection conn = getConnection();
		Member normal = rdao.NormalMember(conn,  userId, userName, userSSN, phone, email);
		close(conn);
		
		return normal;
		
	}

	public List<Map<String, Object>> selectCareApp(String deptName, String docName, String appDate) {
		
		Connection conn = getConnection();
		List<Map<String, Object>> resultList = rdao.selectCareApp(conn, deptName, docName, appDate);
		close(conn);
		
		return resultList;
		
	}
		
	public void insertHealthCheckList(CheckList ck) {

	
		
		
	}

	
	
	
	
	
}
