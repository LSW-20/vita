package com.br.vita.payment.model.vo;

import java.sql.Date;

public class Payment {
	private String payNo;
	private String userNo;
	private int docNum;
	private String appointmentNo;
	private Date payDate;
	private String payType;
	private String payId;
	private String price;
	private String pg;
	
	public Payment() {}
	
	public Payment(String payNo, String userNo, int docNum, String appointmentNo, Date payDate, String payType,
			String payId, String price, String pg) {
		super();
		this.payNo = payNo;
		this.userNo = userNo;
		this.docNum = docNum;
		this.appointmentNo = appointmentNo;
		this.payDate = payDate;
		this.payType = payType;
		this.payId = payId;
		this.price = price;
		this.pg = pg;
	}

	public String getPayNo() {
		return payNo;
	}

	public void setPayNo(String payNo) {
		this.payNo = payNo;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public int getDocNum() {
		return docNum;
	}

	public void setDocNum(int docNum) {
		this.docNum = docNum;
	}

	public String getAppointmentNo() {
		return appointmentNo;
	}

	public void setAppointmentNo(String appointmentNo) {
		this.appointmentNo = appointmentNo;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public String getPayId() {
		return payId;
	}

	public void setPayId(String payId) {
		this.payId = payId;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getPg() {
		return pg;
	}

	public void setPg(String pg) {
		this.pg = pg;
	}

	@Override
	public String toString() {
		return "Payment [payNo=" + payNo + ", userNo=" + userNo + ", docNum=" + docNum + ", appointmentNo="
				+ appointmentNo + ", payDate=" + payDate + ", payType=" + payType + ", payId=" + payId + ", price="
				+ price + ", pg=" + pg + "]";
	}
	
	
}
