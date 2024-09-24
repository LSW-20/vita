package com.br.vita.company.model.vo;

import java.sql.Date;

public class Company {
	
	private String compNo;
	private String compName;
	private Date registDate;
	private String adminNo;
	private Date updateDate;
	
	
	
	public Company() {
		super();
	}
	
	


	public Company(String compNo, String compName) {
		super();
		this.compNo = compNo;
		this.compName = compName;
	}




	public Company(String compNo, String compName, Date registDate, String adminNo, Date updateDate) {
		super();
		this.compNo = compNo;
		this.compName = compName;
		this.registDate = registDate;
		this.adminNo = adminNo;
		this.updateDate = updateDate;
	}


	public String getCompNo() {
		return compNo;
	}


	public void setCompNo(String compNo) {
		this.compNo = compNo;
	}


	public String getCompName() {
		return compName;
	}


	public void setCompName(String compName) {
		this.compName = compName;
	}


	public Date getRegistDate() {
		return registDate;
	}


	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}


	public String getAdminNo() {
		return adminNo;
	}


	public void setAdminNo(String adminNo) {
		this.adminNo = adminNo;
	}


	public Date getUpdateDate() {
		return updateDate;
	}


	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}


	@Override
	public String toString() {
		return "Company [compNo=" + compNo + ", compName=" + compName + ", registDate=" + registDate + ", adminNo="
				+ adminNo + ", updateDate=" + updateDate + "]";
	}

	
	
	
	
}
