package com.br.vita.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.vita.member.model.service.MemberService;

/**
 * Servlet implementation class MemberIdCheckAjaxController
 */
@WebServlet("/userSSNcheck.me")
public class MemberHpCheckAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberHpCheckAjaxController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String checkUserSSN = request.getParameter("checkUserSSN");
		
		int count = new MemberService().userSSNCheck(checkUserSSN);
		
		response.setContentType("text/html; charset=UTF-8");
		if(count > 0) { // 이미 존재 == 사용불가(NNNNN)
			response.getWriter().print("NNNNN");;
		}else { // 존재 X == 사용가능(NNNNY)
			response.getWriter().print("NNNNY");;	
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
