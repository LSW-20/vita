package com.br.vita.issue.model.vo;

import java.sql.Date;

public class Mrecords {
	
	private String careNo; 
	private String appolntmentNo;
	private String userNo;
	private String doctorNo;
	private String userName;
	private String userSsn;
	private Date treatmentDate;
	private String symptoms;
	private String opinion;
	private String treatmentContent;
	private String diagnosisName;
	private String deptName;
	
	//document와 join시 필요한 docNum추가
	private String docNum;

	public Mrecords() {}


	public Mrecords(String careNo, String appolntmentNo, String userNo, String doctorNo, String userName,
			String userSsn, Date treatmentDate, String symptoms, String opinion, String treatmentContent,
			String diagnosisName, String deptName) {
		super();
		this.careNo = careNo;
		this.appolntmentNo = appolntmentNo;
		this.userNo = userNo;
		this.doctorNo = doctorNo;
		this.userName = userName;
		this.userSsn = userSsn;
		this.treatmentDate = treatmentDate;
		this.symptoms = symptoms;
		this.opinion = opinion;
		this.treatmentContent = treatmentContent;
		this.diagnosisName = diagnosisName;
		this.deptName = deptName;
	}
	
	


	public Mrecords(Date treatmentDate, String diagnosisName, String deptName, String careNo) {
		super();
		this.treatmentDate = treatmentDate;
		this.diagnosisName = diagnosisName;
		this.deptName = deptName;
		this.careNo=careNo;
	}
	
	


	public Mrecords(String symptoms, String opinion, String diagnosisName,
			String treatmentContent,String deptName) {
		super();
		this.symptoms = symptoms;
		this.opinion = opinion;
		this.treatmentContent = treatmentContent;
		this.diagnosisName = diagnosisName;
		this.deptName = deptName;
	}


	public String getCareNo() {
		return careNo;
	}


	public void setCareNo(String careNo) {
		this.careNo = careNo;
	}


	public String getAppolntmentNo() {
		return appolntmentNo;
	}


	public void setAppolntmentNo(String appolntmentNo) {
		this.appolntmentNo = appolntmentNo;
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


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getUserSsn() {
		return userSsn;
	}


	public void setUserSsn(String userSsn) {
		this.userSsn = userSsn;
	}


	public Date getTreatmentDate() {
		return treatmentDate;
	}


	public void setTreatmentDate(Date treatmentDate) {
		this.treatmentDate = treatmentDate;
	}


	public String getSymptoms() {
		return symptoms;
	}


	public void setSymptoms(String symptoms) {
		this.symptoms = symptoms;
	}


	public String getOpinion() {
		return opinion;
	}


	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}


	public String getTreatmentContent() {
		return treatmentContent;
	}


	public void setTreatmentContent(String treatmentContent) {
		this.treatmentContent = treatmentContent;
	}


	public String getDiagnosisName() {
		return diagnosisName;
	}


	public void setDiagnosisName(String diagnosisName) {
		this.diagnosisName = diagnosisName;
	}


	public String getDeptName() {
		return deptName;
	}


	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	
	public String getDocNum() {
		return docNum;
	}


	public void setDocNum(String docNum) {
		this.docNum = docNum;
	}



	@Override
	public String toString() {
		return "Mrecords [careNo=" + careNo + ", appolntmentNo=" + appolntmentNo + ", userNo=" + userNo + ", doctorNo="
				+ doctorNo + ", userName=" + userName + ", userSsn=" + userSsn + ", treatmentDate=" + treatmentDate
				+ ", symptoms=" + symptoms + ", opinion=" + opinion + ", treatmentContent=" + treatmentContent
				+ ", diagnosisName=" + diagnosisName + ", deptName=" + deptName + "]";
	}
	
	
	

}
