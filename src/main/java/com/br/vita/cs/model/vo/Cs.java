package com.br.vita.cs.model.vo;

import java.sql.Date;

public class Cs {
	private int boardNo;
	private String userNo;
	private String boardTitle;
	private String boardContent;
	private String boardWriter;//MEMBER 테이블과 join해서 가져올 userId
	private Date registDt;
	private int boardCount;
	private String status;
	private String category;
	private String cEmp;
	private String cDept;
	private String answerContent;
	//여기부터 아래는 MEMBER 테이블과 조인해서 가져올 정보들
	private String phone;
	private String email;
	private String userName;
	private String userDate;
	private String userType;

	public Cs() {}

	public Cs(int boardNo, String userNo, String boardTitle, String boardContent, String boardWriter, Date registDt, int boardCount,
			String status, String category, String cEmp, String cDept, String answerContent) {
		super();
		this.boardNo = boardNo;
		this.userNo = userNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardWriter = boardWriter;
		this.registDt = registDt;
		this.boardCount = boardCount;
		this.status = status;
		this.category = category;
		this.cEmp = cEmp;
		this.cDept = cDept;
		this.answerContent = answerContent;
	}

	

	public Cs(int boardNo, String boardTitle, String boardWriter, Date registDt, int boardCount, String category) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardWriter = boardWriter;
		this.registDt = registDt;
		this.boardCount = boardCount;
		this.category = category;
	}

	//번호에 맞는 게시글상세 불러오기
	public Cs(int boardNo, String boardTitle, String boardContent, String boardWriter, Date registDt, int boardCount,
			String category, String cEmp, String cDept, String answerContent) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardWriter = boardWriter;
		this.registDt = registDt;
		this.boardCount = boardCount;
		this.category = category;
		this.cEmp = cEmp;
		this.cDept = cDept;
		this.answerContent = answerContent;
	}
	
	//게시글 insert용 생성자
	public Cs(String userNo, String boardTitle, String boardContent, String category, String cEmp, String cDept) {
		super();
		this.userNo = userNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.category = category;
		this.cEmp = cEmp;
		this.cDept = cDept;
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

	public String getBoardWriter() {
		return boardWriter;
	}
	
	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
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
	
	public String getUserName() {
		return userName;
	}	
	
	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserDate() {
		return userDate;
	}

	public void setUserDate(String userDate) {
		this.userDate = userDate;
	}
	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}
	@Override
	public String toString() {
		return "Cs [boardNo=" + boardNo + ", userNo=" + userNo + ", boardTitle=" + boardTitle + ", boardContent="
				+ boardContent + ", boardWriter=" + boardWriter + ", registDt=" + registDt + ", boardCount="
				+ boardCount + ", status=" + status + ", category=" + category + ", cEmp=" + cEmp + ", cDept=" + cDept
				+ ", answerContent=" + answerContent + ", phone=" + phone + ", email=" + email + "]";
	}

	
	
}

