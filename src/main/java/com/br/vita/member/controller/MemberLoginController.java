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
import com.google.gson.Gson;

/**
 * Servlet implementation class MemberLoginController
 */
@WebServlet("/login.me")
public class MemberLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  String userName = request.getParameter("userId");
	  String userPwd = request.getParameter("userPwd");

	  Member loginUser = new MemberService().memberLogin(userName, userPwd);

	  response.setContentType("application/json; charset=UTF-8");
	  HttpSession session = request.getSession();

	  if (loginUser != null) {
	    new Gson().toJson(loginUser, response.getWriter());
	    session.setAttribute("loginUser", loginUser);
	    session.setAttribute("alertMsg", loginUser.getUserName() + "님 반갑습니다");
	  } else {
	    response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
	    response.getWriter().write("{\"message\":\"로그인 실패\"}");
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
