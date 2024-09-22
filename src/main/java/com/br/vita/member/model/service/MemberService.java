package com.br.vita.member.model.service;

import static com.br.vita.common.template.JDBCTemplate.close;
import static com.br.vita.common.template.JDBCTemplate.commit;
import static com.br.vita.common.template.JDBCTemplate.getConnection;
import static com.br.vita.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

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
    *          null | 갱신 회원객체 정보 반환
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

   /**
    * 비밀번호 변경
    * @param map key+value세트
    * @return updateMem 갱신 된 멤버 객체
    */
   public Member updateMemberPwd(Map<String, String> map) {
      Connection conn = getConnection();
      //비번 변경
      int result = mdao.updateMemberPwd(conn, map);
      
      Member updateMem = null;
      if(result > 0) {
         commit(conn);
         //갱신 후 데이터 조회
         updateMem = mdao.selectMemberById(conn, map.get("userId"));
      } else {
         rollback(conn);
      }
      close(conn);
      return updateMem;
      
   }//updatePwd
   
   /**
    * 
    * @param userId
    * @param userPwd
    * @return result 처리 행수
    */
   public int deleteMember(String userId, String userPwd) {
      Connection conn = getConnection();
      int result = mdao.deleteMember(conn, userId, userPwd);
      
      if(result > 0) {
         commit(conn);
      } else {
         rollback(conn);
      }
      close(conn);
      
      return result;
   }//deleteMember


	public int signUpAdultMember(Member m) {
		
		Connection conn = getConnection();
		int result = mdao.signUpAdultMember(conn, m);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
	
		close(conn);
		
		return result;
	}

	
	/**
	 * 회원 이름으로 회원 검색
	 * author : 임상우
	 * @param userName
	 * @return List<Member> 검색된 회원 데이터들
	 */
	public List<Member> selectByName(String userName) {
		Connection conn = getConnection();
		List<Member> list = mdao.selectByName(conn, userName);
		close(conn);
		return list;
	}
	
	/**
	 * 회원 아이디로 회원 검색
	 * @param userId
	 * @return 검색된 회원 데이터(하나지만 List에 담아서 보냈음)
	 */
	public List<Member> selectById(String userId) {
		Connection conn = getConnection();
		List<Member> list = mdao.selectById(conn, userId);
		close(conn);
		return list;
	}
	
	
	
}

