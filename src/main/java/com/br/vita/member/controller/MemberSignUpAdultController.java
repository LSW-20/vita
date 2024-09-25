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
@WebServlet("/signUp_adult.me")
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
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String userSSN = request.getParameter("userSSN");	
		String callbackYN = request.getParameter("callbackYN");
		String userDate = request.getParameter("userDate");
		String gender = request.getParameter("gender");
		
		
	
		Member m = new Member(userId, userPwd, userName, phone, email, address, userSSN, callbackYN, userDate, gender);
		
		
		
		// 서비스 호출 (쿼리실행)
		int result = new MemberService().signUpAdultMember(m);
		
		System.out.println("컨트롤러도착 : " + result);
		// 2. 응답
		if(result > 0) {
			/*
			 * * 회원가입 성공
			 *   ㄴ 응답페이지 : 메인페이지
			 *   ㄴ 응답데이터 : "성공적으로 회원가입 되었습니다." alert 메세지
			 */
			
			request.getSession().setAttribute("alertMsg", "성공적으로 회원가입 되었습니다.");
			response.sendRedirect(request.getContextPath());
		}else {
			/*
			 * * 회원가입 실패
			 *   ㄴ 응답페이지 : 에러페이지 
			 *   ㄴ 응답데이터 : "회원가입 실패" 메세지 (해당 응답페이지에서만 필요)
			 */
			
			request.setAttribute("msg", "회원가입 실패");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
			
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