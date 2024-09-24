package com.br.vita.reservation.model.vo;

import java.sql.Date;

public class Consultation {
	private String appointmentNo;
	private String userNo;
	private String doctorNo;
	private Date appointmentDate;
	private String appointmentTime;
	private String careStatus;
	
	//아래는 DOCTOR, MEMBER테이블과 조인할 때 필요
	private String userName;
	private String doctorName;
	private String deptName;
	
	public Consultation() {}


	public Consultation(String appointmentNo, String userNo, String doctorNo, Date appointmentDate,
			String appointmentTime, String careStatus, String userName, String doctorName, String deptName) {
		super();
		this.appointmentNo = appointmentNo;
		this.userNo = userNo;
		this.doctorNo = doctorNo;
		this.appointmentDate = appointmentDate;
		this.appointmentTime = appointmentTime;
		this.careStatus = careStatus;
		this.userName = userName;
		this.doctorName = doctorName;
		this.deptName = deptName;
	}

	public Consultation(String userNo, String doctorNo, String appointmentTime) {
		super();
		this.userNo = userNo;
		this.doctorNo = doctorNo;
		this.appointmentTime = appointmentTime;
	}
	
	//예약 조회용 생성자_보겸
	public Consultation(String appointmentNo, Date appointmentDate, String appointmentTime, String userName,
			String doctorName, String deptName) {
		super();
		this.appointmentNo = appointmentNo;
		this.appointmentDate = appointmentDate;
		this.appointmentTime = appointmentTime;
		this.userName = userName;
		this.doctorName = doctorName;
		this.deptName = deptName;
	}
	
	// 성공페이지 데이터 생성자
	public Consultation(String deptName, String userNo, String doctorName, String appointmentTime,
			Date appointmentDate) {
		super();
		this.deptName = deptName;
		this.userNo = userNo;
		this.doctorName = doctorName;
		this.appointmentTime = appointmentTime;
		this.appointmentDate = appointmentDate;
	}


	public String getAppointmentNo() {
		return appointmentNo;
	}

	public void setAppointmentNo(String appointmentNo) {
		this.appointmentNo = appointmentNo;
	}


	public String getUserNo() {
		return userNo;
	}


	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}


	public String getDoctorNo() {
		return doctorNo;
	}


	public void setDoctorNo(String doctorNo) {
		this.doctorNo = doctorNo;
	}


	public Date getAppointmentDate() {
		return appointmentDate;
	}


	public void setAppointmentDate(Date appointmentDate) {
		this.appointmentDate = appointmentDate;
	}


	public String getAppointmentTime() {
		return appointmentTime;
	}


	public void setAppointmentTime(String appointmentTime) {
		this.appointmentTime = appointmentTime;
	}


	public String getCareStatus() {
		return careStatus;
	}


	public void setCareStatus(String careStatus) {
		this.careStatus = careStatus;
	}


	
	
	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getDoctorName() {
		return doctorName;
	}


	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}


	public String getDeptName() {
		return deptName;
	}


	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}


	@Override
	public String toString() {
		return "Consultation [appointmentNo=" + appointmentNo + ", userNo=" + userNo + ", doctorNo=" + doctorNo
				+ ", appointmentDate=" + appointmentDate + ", appointmentTime=" + appointmentTime + ", careStatus="
				+ careStatus + ", userName=" + userName + ", doctorName=" + doctorName + ", deptName=" + deptName + "]";
	}




	

	
	
	
}


