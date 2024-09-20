package com.br.vita.news.model.vo;

import java.sql.Date;

public class News {

	private int news_no;
	private	String news_title;
	private String news_content;
	private	Date resist_date;
	private String user_no;
	private int news_count;
	private String status;

	public News() {}

	public News(int news_no, String news_title, String news_content, Date resist_date, String user_no, int news_count,
			String status) {
		super();
		this.news_no = news_no;
		this.news_title = news_title;
		this.news_content = news_content;
		this.resist_date = resist_date;
		this.user_no = user_no;
		this.news_count = news_count;
		this.status = status;
	}

	public int getNews_no() {
		return news_no;
	}

	public void setNews_no(int news_no) {
		this.news_no = news_no;
	}

	public String getNews_title() {
		return news_title;
	}

	public void setNews_title(String news_title) {
		this.news_title = news_title;
	}

	public String getNews_content() {
		return news_content;
	}

	public void setNews_content(String news_content) {
		this.news_content = news_content;
	}

	public Date getResist_date() {
		return resist_date;
	}

	public void setResist_date(Date resist_date) {
		this.resist_date = resist_date;
	}

	public String getUser_no() {
		return user_no;
	}

	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}

	public int getNews_count() {
		return news_count;
	}

	public void setNews_count(int news_count) {
		this.news_count = news_count;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "News [news_no=" + news_no + ", news_title=" + news_title + ", news_content=" + news_content
				+ ", resist_date=" + resist_date + ", user_no=" + user_no + ", news_count=" + news_count + ", status="
				+ status + "]";
	}
	
	
		
		
}
