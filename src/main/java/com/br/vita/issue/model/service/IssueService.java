package com.br.vita.issue.model.service;

import java.sql.Connection;

import com.br.vita.issue.model.dao.IssueDao;
import static com.br.vita.common.template.JDBCTemplate.*;

public class IssueService {

	
	private IssueDao idao = new IssueDao();
	
	
	public int certificateApplicationInsert(String userNo, String type ,String Date,String purpose ) {
		
		Connection conn = getConnection();
		
		int result = idao.certificateApplicationInsert(conn,userNo,Date,purpose);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	
	
}
