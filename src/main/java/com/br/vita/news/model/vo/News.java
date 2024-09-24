package com.br.vita.news.model.vo;

import java.util.Date;

public class News {

	private int newsNo;
	private String newsTitle;
	private String newsContent;
	private Date registDate;
	private String userNo;
	private int newsCount;
	private String status;
	
	private String userId;
	private String registDateStr;
	
	public News() {}
	
	

	public News(int newsNo) {
		super();
		this.newsNo = newsNo;
	}

	public News(int newsNo, String newsTitle, String newsContent, Date registDate, String registDateStr, String userNo, int newsCount, String status, String userId) {
        this.newsNo = newsNo;
        this.newsTitle = newsTitle;
        this.newsContent = newsContent;
        this.registDate = registDate;
        this.registDateStr = registDateStr; // Initialize new field
        this.userNo = userNo;
        this.newsCount = newsCount;
        this.status = status;
        this.userId = userId;
    }
	

	public News(int newsNo, String newsTitle, String newsContent, Date registDate, String userNo, int newsCount, String status,
			String userId) {
		super();
		this.newsNo = newsNo;
		this.newsTitle = newsTitle;
		this.newsContent = newsContent;
		this.registDate = registDate;
		this.userNo = userNo;
		this.newsCount = newsCount;
		this.status = status;
		this.userId = userId;
	}



	public News(int newsNo, String newsTitle, String userId, Date registDate, int newsCount) {
		super();
		this.newsNo = newsNo;
		this.newsTitle = newsTitle;
		this.userId = userId;
		this.registDate = registDate;
		this.newsCount = newsCount;
	}
	
	public News(int newsNo, String newsTitle, String newsContent, Date registDate, String userNo, int newsCount,
			String status) {
		super();
		this.newsNo = newsNo;
		this.newsTitle = newsTitle;
		this.newsContent = newsContent;
		this.registDate = registDate;
		this.userNo = userNo;
		this.newsCount = newsCount;
		this.status = status;
	}

	
	
	public int getNewsNo() {
		return newsNo;
	}

	public void setNewsNo(int newsNo) {
		this.newsNo = newsNo;
	}

	public String getNewsTitle() {
		return newsTitle;
	}

	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}

	public String getNewsContent() {
		return newsContent;
	}

	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
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

	public int getNewsCount() {
		return newsCount;
	}

	public void setNewsCount(int newsCount) {
		this.newsCount = newsCount;
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
		return "News [newsNo=" + newsNo + ", newsTitle=" + newsTitle + ", newsContent=" + newsContent + ", registDate="
				+ registDate + ", userNo=" + userNo + ", newsCount=" + newsCount + ", status=" + status + ", userId="
				+ userId + "]";
	}

	
	
	
}
