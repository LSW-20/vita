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
	private String upCheckYN;
	
	public HealthCheck() {}

	public HealthCheck(String appointmentNo, String userNo, String companyNo, Date appointmentDate,
			String appointmentType, String appointmentTime, Date checkUpDate, String totalPrice, String upCheckYN) {
		super();
		this.appointmentNo = appointmentNo;
		this.userNo = userNo;
		this.companyNo = companyNo;
		this.appointmentDate = appointmentDate;
		this.appointmentType = appointmentType;
		this.appointmentTime = appointmentTime;
		this.checkUpDate = checkUpDate;
		this.totalPrice = totalPrice;
		this.upCheckYN = upCheckYN;
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

	public String getUpCheckYN() {
		return upCheckYN;
	}

	public void setUpCheckYN(String upCheckYN) {
		this.upCheckYN = upCheckYN;
	}

	@Override
	public String toString() {
		return "HealthCheck [appointmentNo=" + appointmentNo + ", userNo=" + userNo + ", companyNo=" + companyNo
				+ ", appointmentDate=" + appointmentDate + ", appointmentType=" + appointmentType + ", appointmentTime="
				+ appointmentTime + ", checkUpDate=" + checkUpDate + ", totalPrice=" + totalPrice + ", upCheckYN="
				+ upCheckYN + "]";
	}

	
}
