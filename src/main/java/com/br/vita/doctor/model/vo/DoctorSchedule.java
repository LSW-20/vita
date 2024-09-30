package com.br.vita.doctor.model.vo;

public class DoctorSchedule {
	
	private String doctorNo;
	private String working;
	private String scheduleTime;
	private String scheduleWeek;
	private String doctorName;
	
	
	public DoctorSchedule() {}
	
	


	public String getDoctorName() {
		return doctorName;
	}




	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}




	public DoctorSchedule(String doctorNo, String working, String scheduleTime, String scheduleWeek,
			String doctorName) {
		super();
		this.doctorNo = doctorNo;
		this.working = working;
		this.scheduleTime = scheduleTime;
		this.scheduleWeek = scheduleWeek;
		this.doctorName = doctorName;
	}




	public DoctorSchedule(String doctorNo, String working, String scheduleTime, String scheduleWeek) {
		super();
		this.doctorNo = doctorNo;
		this.working = working;
		this.scheduleTime = scheduleTime;
		this.scheduleWeek = scheduleWeek;
	}
	


	public DoctorSchedule(String working, String scheduleTime, String scheduleWeek) {
		super();
		this.working = working;
		this.scheduleTime = scheduleTime;
		this.scheduleWeek = scheduleWeek;
	}


	public String getDoctorNo() {
		return doctorNo;
	}


	public void setDoctorNo(String doctorNo) {
		this.doctorNo = doctorNo;
	}


	public String getWorking() {
		return working;
	}


	public void setWorking(String working) {
		this.working = working;
	}


	public String getScheduleTime() {
		return scheduleTime;
	}


	public void setScheduleTime(String scheduleTime) {
		this.scheduleTime = scheduleTime;
	}


	public String getScheduleWeek() {
		return scheduleWeek;
	}


	public void setScheduleWeek(String scheduleWeek) {
		this.scheduleWeek = scheduleWeek;
	}


	@Override
	public String toString() {
		return "DoctorSchedule [doctorNo=" + doctorNo + ", working=" + working + ", scheduleTime=" + scheduleTime
				+ ", scheduleWeek=" + scheduleWeek + "]";
	}
	
	

}
