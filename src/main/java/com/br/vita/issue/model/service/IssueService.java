package com.br.vita.issue.model.service;

import java.sql.Connection;

import com.br.vita.issue.model.dao.IssueDao;
import static com.br.vita.common.template.JDBCTemplate.*;

public class IssueService {

	
	private IssueDao idao = new IssueDao();
	
	
	public int certificateApplicationInsert(String userNo) {
		
		Connection conn = getConnection();
		
		int result = idao.certificateApplicationInsert(conn,userNo);
		
		
	}
	
	
	
}
