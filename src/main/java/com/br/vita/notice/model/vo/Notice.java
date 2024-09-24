package com.br.vita.notice.model.vo;

import java.sql.Date;

public class Notice {

	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private Date registDate;
	private String userNo;
	private int noticeCount;
	private String status;
	
	private String userId;
	private String registDateStr;
	
	public Notice() {}
	
	

	public Notice(int noticeNo) {
		super();
		this.noticeNo = noticeNo;
	}

	public Notice(int noticeNo, String noticeTitle, String noticeContent, Date registDate, String registDateStr, String userNo, int noticeCount, String status, String userId) {
        this.noticeNo = noticeNo;
        this.noticeTitle = noticeTitle;
        this.noticeContent = noticeContent;
        this.registDate = registDate;
        this.registDateStr = registDateStr; // Initialize new field
        this.userNo = userNo;
        this.noticeCount = noticeCount;
        this.status = status;
        this.userId = userId;
    }
	
	
	public Notice(int noticeNo, String noticeTitle, String noticeContent, Date registDate, String userNo, int noticeCount, String status,
			String userId) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.registDate = registDate;
		this.userNo = userNo;
		this.noticeCount = noticeCount;
		this.status = status;
		this.userId = userId;
	}



	public Notice(int noticeNo, String noticeTitle, String userId, Date registDate, int noticeCount) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.userId = userId;
		this.registDate = registDate;
		this.noticeCount = noticeCount;
	}
	
	public Notice(int noticeNo, String noticeTitle, String noticeContent, Date registDate, String userNo, int noticeCount,
			String status) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.registDate = registDate;
		this.userNo = userNo;
		this.noticeCount = noticeCount;
		this.status = status;
	}

	
	
	public String getRegistDateStr() {
		return registDateStr;
	}



	public void setRegistDateStr(String registDateStr) {
		this.registDateStr = registDateStr;
	}



	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getRegistDate() {
		return registDate;
	}

	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public int getNoticeCount() {
		return noticeCount;
	}

	public void setNoticeCount(int noticeCount) {
		this.noticeCount = noticeCount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent + ", registDate="
				+ registDate + ", userNo=" + userNo + ", noticeCount=" + noticeCount + ", status=" + status + ", userId="
				+ userId + "]";
	}

	
	
	
}
