package com.br.vita.employee.model.vo;

public class Employee {

	
	private String ssn;
	private String empName;
	private String compNo;
	private String empNo;
	
	public Employee() {
		super();
	}

	public Employee(String ssn, String empName, String compNo, String empNo) {
		super();
		this.ssn = ssn;
		this.empName = empName;
		this.compNo = compNo;
		this.empNo = empNo;
	}

	public String getSsn() {
		return ssn;
	}

	public void setSsn(String ssn) {
		this.ssn = ssn;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getCompNo() {
		return compNo;
	}

	public void setCompNo(String compNo) {
		this.compNo = compNo;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	@Override
	public String toString() {
		return "Employee [ssn=" + ssn + ", empName=" + empName + ", compNo=" + compNo + ", empNo=" + empNo + "]";
	}
	
	
	
	
}
