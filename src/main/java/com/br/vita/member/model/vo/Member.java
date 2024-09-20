package com.br.vita.member.model.vo;

import java.sql.Date;

public class Member {
	
	 private String userNo;
	 private String userId;
	 private String userPwd;
	 private String userName;
	 private String phone;
	 private String email;
	 private String address;
	 private Date enrollDate;
	 private String userType;
	 private String userSSN;
	 private String callbackYN;
	 private String resignYN;
	 private String userDate;
	 private String gender;
	 private String representative;
	
	
	 public Member() {}
	 


	public Member(String userType) {
		super();
		this.userType = userType;
	}



	public Member(String userNo, String userId, String userPwd, String userName, String phone, String email,
			String address, Date enrollDate, String userType, String userSSN, String callbackYN, String resignYN,
			String userDate, String gender, String representative) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.enrollDate = enrollDate;
		this.userType = userType;
		this.userSSN = userSSN;
		this.callbackYN = callbackYN;
		this.resignYN = resignYN;
		this.userDate = userDate;
		this.gender = gender;
		this.representative = representative;
	}

	//마이페이지 정보 수정 요청용 생성자 -보겸
	public Member(String userNo, String userId, String userName, String phone, String email,
			String userDate, String gender) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userName = userName;
		this.phone = phone;
		this.email = email;
		this.userDate = userDate;
		this.gender = gender;
	}
	
	

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserPwd() {
		return userPwd;
	}


	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public Date getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}


	public String getUserType() {
		return userType;
	}


	public void setUserType(String userType) {
		this.userType = userType;
	}


	public String getUserSSN() {
		return userSSN;
	}


	public void setUserSSN(String userSSN) {
		this.userSSN = userSSN;
	}


	public String getCallbackYN() {
		return callbackYN;
	}


	public void setCallbackYN(String callbackYN) {
		this.callbackYN = callbackYN;
	}


	public String getResignYN() {
		return resignYN;
	}


	public void setResignYN(String resignYN) {
		this.resignYN = resignYN;
	}


	public String getUserDate() {
		return userDate;
	}


	public void setUserDate(String userDate) {
		this.userDate = userDate;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getRepresentative() {
		return representative;
	}


	public void setRepresentative(String representative) {
		this.representative = representative;
	}


	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", phone=" + phone + ", email=" + email + ", address=" + address + ", enrollDate=" + enrollDate
				+ ", userType=" + userType + ", userSSN=" + userSSN + ", callbackYN=" + callbackYN + ", resignYN="
				+ resignYN + ", userDate=" + userDate + ", gender=" + gender + ", representative=" + representative
				+ "]";
	}
	 
	 
	
}
