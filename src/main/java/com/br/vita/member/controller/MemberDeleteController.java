package com.br.vita.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.vita.member.model.service.MemberService;
import com.br.vita.member.model.vo.Member;

/**
 * Servlet implementation class MemberDeleteController
 */
@WebServlet("/delete.me")
public class MemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청
		String userPwd = request.getParameter("userPwd");
		HttpSession session = request.getSession();
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		
		int result = new MemberService().deleteMember(userId, userPwd);
		
		//응답
		if(result > 0) {
			//로그아웃 + 알림 + 메인페이지 (재)요청
			session.removeAttribute("loginUser");
			session.setAttribute("alertMsg", "탈퇴되었습니다. 이용해 주셔서 감사합니다.");
			response.sendRedirect(request.getContextPath());
		} else {
			//탈퇴 실패
			session.setAttribute("alertMsg","탈퇴실패");
			response.sendRedirect(request.getContextPath()+"/myinfo.me");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
