package com.br.vita.member.model.vo;

import java.sql.Date;

public class Cs {
	private int boardNo;
	private String userNo;
	private String boardTitle;
	private String boardContent;
	private Date registDt;
	private int boardCount;
	private String status;
	private String category;
	private String cEmp;
	private String cDept;
	private String answerContent;
	
	public Cs() {}

	public Cs(int boardNo, String userNo, String boardTitle, String boardContent, Date registDt, int boardCount,
			String status, String category, String cEmp, String cDept, String answerContent) {
		super();
		this.boardNo = boardNo;
		this.userNo = userNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.registDt = registDt;
		this.boardCount = boardCount;
		this.status = status;
		this.category = category;
		this.cEmp = cEmp;
		this.cDept = cDept;
		this.answerContent = answerContent;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getRegistDt() {
		return registDt;
	}

	public void setRegistDt(Date registDt) {
		this.registDt = registDt;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getcEmp() {
		return cEmp;
	}

	public void setcEmp(String cEmp) {
		this.cEmp = cEmp;
	}

	public String getcDept() {
		return cDept;
	}

	public void setcDept(String cDept) {
		this.cDept = cDept;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	@Override
	public String toString() {
		return "Cs [boardNo=" + boardNo + ", userNo=" + userNo + ", boardTitle=" + boardTitle + ", boardContent="
				+ boardContent + ", registDt=" + registDt + ", boardCount=" + boardCount + ", status=" + status
				+ ", category=" + category + ", cEmp=" + cEmp + ", cDept=" + cDept + ", answerContent=" + answerContent
				+ "]";
	}
	
	
}
