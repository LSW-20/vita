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
	
	


	/**
	 * @param m 업데이트할 멤버객체
	 * @return updateMem 업데이트 된 멤버 객체 정보를 갱신하기 위해 만듦 
	 * 		   null | 갱신 회원객체 정보 반환
	 */
	public Member updateMember(Member m) {
		Connection conn = getConnection();
		
		//1.회원 정보 변경
		int result = mdao.updateMember(conn, m);
		Member updateMem = null;
		if(result > 0) {
			commit(conn);
			//2. 갱신 회원 객체 다시 조회해오기(select) -loginMember
			updateMem = mdao.selectMemberById(conn, m.getUserId());
		}else {
			rollback(conn);
		}
		return updateMem;
		
	}//updateMember

}
