package com.br.vita.issue.model.service;

import java.sql.Connection;

import com.br.vita.issue.model.dao.IssueDao;
import static com.br.vita.common.template.JDBCTemplate.*;

public class IssueService {

	
	private IssueDao idao = new IssueDao();
	
	
	public int certificateApplicationInsert(String userNo, String type ,String Date,String purpose) {
		
		Connection conn = getConnection();
		
		int count =  idao.certificateApplicationSelect(conn, userNo, type, Date);
		int result = 0;
		// 1) 해당 발급요청 문서가 기존에 존재하는 지 조회 
		// int count = 현재 진료번호에 확인중(R)상태가 몇개인지
		System.out.println(count);
		
		if(count == 0) {
			// 2) 
			result = idao.certificateApplicationInsert(conn,userNo,type,Date,purpose);
			
			if(result>0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			
		}
		
		
		close(conn);
		
		return result;
		
	}
	
	
	
}
