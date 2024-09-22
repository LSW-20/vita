package com.br.vita.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.vita.member.model.service.MemberService;
import com.br.vita.member.model.vo.Member;

/**
 * Servlet implementation class MemberSelectByNameController
 */
@WebServlet("/searchMemById.admin")
public class MemberSelectByIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MemberSelectByIdController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1. 요청
		// 회원 아이디를 요청으로 받아온다. db에 해당 회원 아이디로 select 후 결과를 가져온다.
		
		String userId = request.getParameter("user_id");
		System.out.println(userId);
	
		List<Member> list = new MemberService().selectById(userId);
		
		
		// 2. 응답
		// 응답페이지 : 관리자 회원 계정 관리 페이지(/vita/views/admin/manageMember.jsp)
		// 응답데이터 : db로부터 조회된 데이터(응답페이지에서만 필요)
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/admin/manageMember.jsp").forward(request, response);
		
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
