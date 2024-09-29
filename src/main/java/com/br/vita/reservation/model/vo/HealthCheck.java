package com.br.vita.reservation.model.vo;

import java.sql.Date;

public class HealthCheck {
	private String appointmentNo;
	private String userNo;
	private String companyNo;
	private Date appointmentDate;
	private String appointmentType;
	private String appointmentTime;
	private Date checkUpDate;
	private String totalPrice;

	
	public HealthCheck() {}

	public HealthCheck(String appointmentNo, String userNo, String companyNo, Date appointmentDate,
			String appointmentType, String appointmentTime, Date checkUpDate, String totalPrice) {
		super();
		this.appointmentNo = appointmentNo;
		this.userNo = userNo;
		this.companyNo = companyNo;
		this.appointmentDate = appointmentDate;
		this.appointmentType = appointmentType;
		this.appointmentTime = appointmentTime;
		this.checkUpDate = checkUpDate;
		this.totalPrice = totalPrice;
		
	}

	 
	public HealthCheck(String appointmentNo, String userNo, String appointmentTime, Date checkUpDate) {
		super();
		this.appointmentNo = appointmentNo;
		this.userNo = userNo;
		this.appointmentTime = appointmentTime;
		this.checkUpDate = checkUpDate;
	}

	

	public HealthCheck(String appointmentNo, String userNo, Date appointmentDate, String appointmentType,
			Date checkUpDate, String totalPrice) {
		super();
		this.appointmentNo = appointmentNo;
		this.userNo = userNo;
		this.appointmentDate = appointmentDate;
		this.appointmentType = appointmentType;
		this.checkUpDate = checkUpDate;
		this.totalPrice = totalPrice;
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

	public String getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(String companyNo) {
		this.companyNo = companyNo;
	}

	public Date getAppointmentDate() {
		return appointmentDate;
	}

	public void setAppointmentDate(Date appointmentDate) {
		this.appointmentDate = appointmentDate;
	}

	public String getAppointmentType() {
		return appointmentType;
	}

	public void setAppointmentType(String appointmentType) {
		this.appointmentType = appointmentType;
	}

	public String getAppointmentTime() {
		return appointmentTime;
	}

	public void setAppointmentTime(String appointmentTime) {
		this.appointmentTime = appointmentTime;
	}

	public Date getCheckUpDate() {
		return checkUpDate;
	}

	public void setCheckUpDate(Date checkUpDate) {
		this.checkUpDate = checkUpDate;
	}

	public String getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}


	@Override
	public String toString() {
		return "HealthCheck [appointmentNo=" + appointmentNo + ", userNo=" + userNo + ", companyNo=" + companyNo
				+ ", appointmentDate=" + appointmentDate + ", appointmentType=" + appointmentType + ", appointmentTime="
				+ appointmentTime + ", checkUpDate=" + checkUpDate + ", totalPrice=" + totalPrice  + "]";
	}

	
}
