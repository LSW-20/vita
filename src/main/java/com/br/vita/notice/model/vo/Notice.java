package com.br.vita.notice.model.vo;

import java.sql.Date;

public class Notice {
	private int notice_no;
	private	String notice_title;
	private String notice_content;
	private String user_no;
	private	Date resist_date;
	private String status;
	private int notice_count;
	
	public Notice() {}
	
	public Notice(int notice_no, String notice_title, String notice_content, String user_no, Date resist_date,
			String status, int notice_count) {
		super();
		this.notice_no = notice_no;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.user_no = user_no;
		this.resist_date = resist_date;
		this.status = status;
		this.notice_count = notice_count;
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getUser_no() {
		return user_no;
	}

	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}

	public Date getResist_date() {
		return resist_date;
	}

	public void setResist_date(Date resist_date) {
		this.resist_date = resist_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getNotice_count() {
		return notice_count;
	}

	public void setNotice_count(int notice_count) {
		this.notice_count = notice_count;
	}

	@Override
	public String toString() {
		return "Notice [notice_no=" + notice_no + ", notice_title=" + notice_title + ", notice_content="
				+ notice_content + ", user_no=" + user_no + ", resist_date=" + resist_date + ", status=" + status
				+ ", notice_count=" + notice_count + "]";
	}
	
	
}
