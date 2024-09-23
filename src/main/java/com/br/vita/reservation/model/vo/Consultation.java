package com.br.vita.reservation.model.vo;

import java.sql.Date;

public class Consultation {
	private String appointmentNo;
	private String userNo;
	private String doctorNo;
	private Date appointmentDate;
	private String appointmentTime;
	private String careStatus;
	
	

	
	public Consultation() {}


	public Consultation(String appointmentNo, String userNo, String doctorNo, Date appointmentDate,
			String appointmentTime, String careStatus) {
		super();
		this.appointmentNo = appointmentNo;
		this.userNo = userNo;
		this.doctorNo = doctorNo;
		this.appointmentDate = appointmentDate;
		this.appointmentTime = appointmentTime;
		this.careStatus = careStatus;
	}

	

	public Consultation(String userNo, String doctorNo, String appointmentTime) {
		super();
		this.userNo = userNo;
		this.doctorNo = doctorNo;
		this.appointmentTime = appointmentTime;
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


	@Override
	public String toString() {
		return "Consultation [appointmentNo=" + appointmentNo + ", userNo=" + userNo + ", doctorNo=" + doctorNo
				+ ", appointmentDate=" + appointmentDate + ", appointmentTime=" + appointmentTime + ", careStatus="
				+ careStatus + "]";
	}

	

	
	
	
}


