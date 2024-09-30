package com.br.vita.reservation.model.service;

import static com.br.vita.common.template.JDBCTemplate.close;
import static com.br.vita.common.template.JDBCTemplate.commit;
import static com.br.vita.common.template.JDBCTemplate.getConnection;
import static com.br.vita.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.br.vita.employee.model.vo.Employee;
import com.br.vita.member.model.vo.Member;
import com.br.vita.reservation.model.dao.ReservationDao;
import com.br.vita.reservation.model.vo.CheckList;
import com.br.vita.reservation.model.vo.Consultation;
import com.br.vita.reservation.model.vo.HealthCheck;

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
	public Map<String, List<?>> selectCareAppList(String userNo) {
		Connection conn = getConnection();
		Map<String, List<?>> reservationsMap = rdao.selectCareAppList(conn, userNo);
		close(conn);
		return reservationsMap;
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

	/**
	 * 관리자 진료 예약 관리 조회 기능
	 * author : 임상우
	 * @param deptName
	 * @param docName
	 * @param appDate1
	 * @param appDate2
	 * @return 조회된 list
	 */
	public List<Map<String, Object>> selectCareApp(String deptName, String docName, String appDate1, String appDate2) {
		
		Connection conn = getConnection();
		List<Map<String, Object>> resultList = rdao.selectCareApp(conn, deptName, docName, appDate1, appDate2);
		close(conn);
		
		return resultList;
	}	
		
		
	/**
	 * 진료예약 추가(2/2)
	 * author : 임상우
	 * @param userNo
	 * @param docName
	 * @param deptName
	 * @param appointmentTime
	 * @return 추가된 행 수 
	 */
	public int insertCareApp(String userNo, String docName, String deptName, String appointmentTime) {
		
		Connection conn = getConnection();
		int result = rdao.insertCareApp(conn, userNo, docName, deptName, appointmentTime);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		
		close(conn);
		
		return result;
	}

	
	/**
	 * 일반건강검진 조회
	 * author : 임상우
	 * @param startDate
	 * @param endDate
	 * @return 조회된 list
	 */
	public List<Map<String, Object>> selectCheckupAppN(String startDate, String endDate) {

		Connection conn = getConnection();
		List<Map<String, Object>> listN = rdao.selectCheckupAppN(conn, startDate, endDate);
		close(conn);
		return listN;
		
		
		
	}

	/**
	 * 기업건강검진 조회
	 * author : 임상우
	 * @param com
	 * @param startDate
	 * @param endDate
	 * @return 조회된 list
	 */
	public List<Map<String, Object>> selectCheckupAppC(String com, String startDate, String endDate) {
		
		Connection conn = getConnection();
		List<Map<String, Object>> listC = rdao.selectCheckupAppC(conn, com, startDate, endDate);
		close(conn);
		return listC;
		
	}

	public int deleteCheckupApp(String appNo) {
		
		Connection conn = getConnection();
		int result = rdao.deleteCheckupApp(conn, appNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
		
	}


	
	public int insertHealtchCareList(String userNo, String time, String date) {
		
		Connection conn = getConnection();
		int result = rdao.insertHealtchCareList(conn, userNo, time, date);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		
		close(conn);
		return result;
		
	}

	/**
	 * 일반건강검진 예약 추가 (2/3)
	 * author : 임상우
	 * @param userNo
	 * @param time
	 * @param date
	 * @param price
	 * @return 삽입된 행 수 
	 */
	public int insertCheckupAppN(String userNo, String time, String date, String price) {
		
		Connection conn = getConnection();
		int result = rdao.insertCheckupAppN(conn, userNo, time, date, price);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		
		close(conn);
		return result;
		
	}

	/**
	 * 일반건강검진 예약 추가 (3/3), 기업건강검진 예약 추가 (4/4)
	 * author : 임상우
	 * @param userNo
	 * @param mediList
	 * @param surgeryYN
	 * @param surgeryName
	 * @param flightYN
	 * @param time
	 * @param date
	 * @param price
	 * @return 삽입된 행 수
	 */
	public int insertChecklist(String userNo, String mediList, String surgeryYN, String surgeryName, String flightYN,
			String time, String date, String price) {
		
		Connection conn = getConnection();
		int result = rdao.insertChecklist(conn, userNo, mediList, surgeryYN, surgeryName, flightYN, time, date, price);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		
		close(conn);
		return result;
	}

	
	/**
	 * 기업건강검진 예약 추가 (3/4)
	 * author : 임상우
	 * @param userNo
	 * @param com
	 * @param time
	 * @param date
	 * @param price
	 * @return
	 */
	public int insertCheckupAppC(String userNo, String com, String time, String date, String price) {

		Connection conn = getConnection();
		int result = rdao.insertCheckupAppC(conn, userNo, com, time, date, price);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
		
	}

	public int insertCheckListt(String userNo, String mediList, String surgeryName, String surgeryYN, String flyYN) {
		
		Connection conn = getConnection();
		int result = rdao.insertCheckListt(conn, userNo, mediList, surgeryName, surgeryYN, flyYN);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		
		close(conn);
		return result;
	}

	public List<HealthCheck> selectSuccessNormal(String userNo, String date) {
		
		Connection conn = getConnection();
		List<HealthCheck> Success = rdao.selectSuccessNormal(conn, userNo, date);
		close(conn);
		return Success;
		
	}

	public List<Employee> selectCompany(String companyName, String name, String name1) {

		Connection conn = getConnection();
		List<Employee> Company = rdao.selectCompany(conn, companyName, name, name1);
		close(conn);
		return Company;
	}

	public int insertHealthCheckCompanyList(String userNo, String userName, String time, String date) {


		Connection conn = getConnection();
		int result = rdao.insertHealthCheckCompanyList(conn, userNo, userName, time, date);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		
		close(conn);
		return result;
		
		
	}

	public List<HealthCheck> selectSuccessCompany(String userNo, String date) {

		Connection conn = getConnection();
		List<HealthCheck> Success1 = rdao.selectSuccessCompany(conn, userNo, date);
		close(conn);
		return Success1;
	}

	

	

	
	
	
	
	
}

