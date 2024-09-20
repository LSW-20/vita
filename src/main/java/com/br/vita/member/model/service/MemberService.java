package com.br.vita.member.model.service;

import static com.br.vita.common.template.JDBCTemplate.*;

import java.sql.Connection;

import com.br.vita.member.model.dao.MemberDao;
import com.br.vita.member.model.vo.Member;

public class MemberService {
	
	private MemberDao mdao = new MemberDao();
	
	
	
	public Member memberLogin(String userId, String userPwd) {
		
		Connection conn = getConnection();
		
		Member loginUser =  mdao.memberLogin(conn, userId, userPwd);
		
		close(conn);
		
		return loginUser;
		
	}
	public String adminDoctorSelect(String userId) {
		
		Connection conn = getConnection();
		
		String usertype = mdao.adminDoctorSelect(conn,userId);
		
		close(conn);
		
		return usertype;
		
		
	}
	
	

}
