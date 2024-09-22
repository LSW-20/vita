package com.br.vita.doctor.model.vo;

import java.sql.Date;

public class Doctor {
	
	private String doctorNo; 
	private String userNo;
	private Date hireDate;
	private String doctorName;
	private String licenceNo;
	private	String deptName;

	
	
	public Doctor() {}



	public Doctor(String doctorNo, String userNo, Date hireDate, String doctorName, String licenceNo, String deptName) {
		super();
		this.doctorNo = doctorNo;
		this.userNo = userNo;
		this.hireDate = hireDate;
		this.doctorName = doctorName;
		this.licenceNo = licenceNo;
		this.deptName = deptName;
	}
	
	
	


	// 의사 정보 조회용 생성자 - 상우
	public Doctor(String doctorNo, Date hireDate, String doctorName, String licenceNo, String deptName) {
		super();
		this.doctorNo = doctorNo;
		this.hireDate = hireDate;
		this.doctorName = doctorName;
		this.licenceNo = licenceNo;
		this.deptName = deptName;
	}



	public String getDoctorNo() {
		return doctorNo;
	}



	public void setDoctorNo(String doctorNo) {
		this.doctorNo = doctorNo;
	}



	public String getUserNo() {
		return userNo;
	}



	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}



	public Date getHireDate() {
		return hireDate;
	}



	public void setHireDate(Date hireDate) {
		this.hireDate = hireDate;
	}



	public String getDoctorName() {
		return doctorName;
	}



	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}



	public String getLicenceNo() {
		return licenceNo;
	}



	public void setLicenceNo(String licenceNo) {
		this.licenceNo = licenceNo;
	}



	public String getDeptName() {
		return deptName;
	}



	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}



	@Override
	public String toString() {
		return "Doctor [doctorNo=" + doctorNo + ", userNo=" + userNo + ", hireDate=" + hireDate + ", doctorName="
				+ doctorName + ", licenceNo=" + licenceNo + ", deptName=" + deptName + "]";
	}
	
	
}
