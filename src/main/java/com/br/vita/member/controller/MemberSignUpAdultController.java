package com.br.vita.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.vita.member.model.service.MemberService;
import com.br.vita.member.model.vo.Member;

/**
 * Servlet implementation class MemberSignUpAdultController
 */
@WebServlet("/SignUp_Adult.me")
public class MemberSignUpAdultController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSignUpAdultController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 요청
		// 요청시 전달값 뽑기
		request.setCharacterEncoding("UTF-8");
		String userName = request.getParameter("userName");
		String userSSN = request.getParameter("userSSN");
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		String userDate;
		String gender;
		
		
		Member m = new Member(userId, userPwd, userName, phone, email, userSSN, userDate, gender);
		
		
		
		// 서비스 호출 (쿼리실행)
		int result = new MemberService().signUpAdultMember(m);
		
		request.getRequestDispatcher("/index.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		
	}

}