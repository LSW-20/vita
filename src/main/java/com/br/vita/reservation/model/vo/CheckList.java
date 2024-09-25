package com.br.vita.reservation.model.vo;

public class CheckList {

	public String userNo;
	public String mediList;
	public String surgeryName;
	public String surgeryYN;
	public String flyYN;
	public String checkupNo;
	public String careNo;
	
	public CheckList () {}

	public CheckList(String userNo, String mediList, String surgeryName, String surgeryYN, String flyYN,
			String checkupNo, String careNo) {
		super();
		this.userNo = userNo;
		this.mediList = mediList;
		this.surgeryName = surgeryName;
		this.surgeryYN = surgeryYN;
		this.flyYN = flyYN;
		this.checkupNo = checkupNo;
		this.careNo = careNo;
	}
	
	public CheckList(String userNo, String mediList, String surgeryName, String surgeryYN, String flyYN) {
		super();
		this.userNo = userNo;
		this.mediList = mediList;
		this.surgeryName = surgeryName;
		this.surgeryYN = surgeryYN;
		this.flyYN = flyYN;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public String getMediList() {
		return mediList;
	}

	public void setMediList(String mediList) {
		this.mediList = mediList;
	}

	public String getSurgeryName() {
		return surgeryName;
	}

	public void setSurgeryName(String surgeryName) {
		this.surgeryName = surgeryName;
	}

	public String getSurgeryYN() {
		return surgeryYN;
	}

	public void setSurgeryYN(String surgeryYN) {
		this.surgeryYN = surgeryYN;
	}

	public String getFlyYN() {
		return flyYN;
	}

	public void setFlyYN(String flyYN) {
		this.flyYN = flyYN;
	}

	public String getCheckupNo() {
		return checkupNo;
	}

	public void setCheckupNo(String checkupNo) {
		this.checkupNo = checkupNo;
	}

	public String getCareNo() {
		return careNo;
	}

	public void setCareNo(String careNo) {
		this.careNo = careNo;
	}

	@Override
	public String toString() {
		return "CheckList [userNo=" + userNo + ", mediList=" + mediList + ", surgeryName=" + surgeryName
				+ ", surgeryYN=" + surgeryYN + ", flyYN=" + flyYN + ", checkupNo=" + checkupNo + ", careNo=" + careNo
				+ "]";
	}
	
	
}

