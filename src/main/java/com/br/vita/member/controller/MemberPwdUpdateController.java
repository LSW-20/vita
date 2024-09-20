package com.br.vita.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.vita.member.model.service.MemberService;
import com.br.vita.member.model.vo.Member;

/**
 * Servlet implementation class MemberPwdUpdateController
 */
@WebServlet("/updatePwd.me")
public class MemberPwdUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPwdUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 비밀번호 변경 요청
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청
		Map<String, String> map = new HashMap<>();
		map.put("userId", request.getParameter("userId"));
		map.put("userPwd", request.getParameter("userPwd"));
		map.put("updatePwd", request.getParameter("updatePwd"));
		
		Member updateMem = new MemberService().updateMemberPwd(map);
		
		//응답
		HttpSession session = request.getSession();
		if(updateMem == null) {//실패
			session.setAttribute("alertMsg", "변경 실패");
		} else {
			session.setAttribute("loginUser", updateMem);
			session.setAttribute("alertMsg", "비밀 번호 변경을 완료하였습니다.");
		}
		
		//마이페이지로 redirect
		response.sendRedirect(request.getContextPath()+"/myinfo.me");
	}//doGet

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
