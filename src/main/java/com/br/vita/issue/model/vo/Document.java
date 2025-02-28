package com.br.vita.issue.model.vo;

import java.sql.Date;

public class Document {
	
	private int docNum;
	private String userNo;
	private String careNo;
	private String docType;
	private String docCheck;
	private String docPurpose;
	private int price;
	private Date applyDate;

//	DOCTOR 테이블과 조인해서 얻어와야하는 컬럼
	private String deptName;
	private String licenceNo;
	private String doctorName;
	
	

	public Document() {}

	
	
	public Document(int docNum, String userNo, String careNo, String docType, String docCheck, String docPurpose,
			int price, Date applyDate) {
		super();
		this.docNum = docNum;
		this.userNo = userNo;
		this.careNo = careNo;
		this.docType = docType;
		this.docCheck = docCheck;
		this.docPurpose = docPurpose;
		this.price = price;
		this.applyDate = applyDate;
	}



	public Document(int docNum, String userNo, String careNo, String docType, String docCheck, String docPurpose,
			int price, Date applyDate, String deptName, String licenceNo, String doctorName) {
		super();
		this.docNum = docNum;
		this.userNo = userNo;
		this.careNo = careNo;
		this.docType = docType;
		this.docCheck = docCheck;
		this.docPurpose = docPurpose;
		this.price = price;
		this.applyDate = applyDate;
		this.deptName = deptName;
		this.licenceNo = licenceNo;
		this.doctorName = doctorName;
	}


	//증명서 발급시 별도로 필요한 생성자
	public Document(int docNum, String docPurpose, Date applyDate, String deptName, String licenceNo,
			String doctorName, String careNo) {
		super();
		this.docNum = docNum;
		this.docPurpose = docPurpose;
		this.applyDate = applyDate;
		this.deptName = deptName;
		this.licenceNo = licenceNo;
		this.doctorName = doctorName;
		this.careNo = careNo;
	}

	public int getDocNum() {
		return docNum;
	}



	public void setDocNum(int docNum) {
		this.docNum = docNum;
	}



	public String getUserNo() {
		return userNo;
	}



	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}



	public String getCareNo() {
		return careNo;
	}



	public void setCareNo(String careNo) {
		this.careNo = careNo;
	}



	public String getDocType() {
		return docType;
	}



	public void setDocType(String docType) {
		this.docType = docType;
	}



	public String getDocCheck() {
		return docCheck;
	}



	public void setDocCheck(String docCheck) {
		this.docCheck = docCheck;
	}



	public String getDocPurpose() {
		return docPurpose;
	}



	public void setDocPurpose(String docPurpose) {
		this.docPurpose = docPurpose;
	}



	public int getPrice() {
		return price;
	}



	public void setPrice(int price) {
		this.price = price;
	}



	public Date getApplyDate() {
		return applyDate;
	}



	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getLicenceNo() {
		return licenceNo;
	}

	public void setLicenceNo(String licenceNo) {
		this.licenceNo = licenceNo;
	}

	public String getDoctorName() {
		return doctorName;
	}

	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}

	@Override
	public String toString() {
		return "Document [docNum=" + docNum + ", userNo=" + userNo + ", careNo=" + careNo + ", docType=" + docType
				+ ", docCheck=" + docCheck + ", docPurpose=" + docPurpose + ", price=" + price + ", applyDate="
				+ applyDate + ", deptName=" + deptName + ", licenceNo=" + licenceNo + ", doctorName=" + doctorName
				+ "]";
	}



	
}
