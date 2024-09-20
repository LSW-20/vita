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
 * Servlet implementation class MemberAdminDoctorController
 */
@WebServlet("/ad_doc.me")
public class MemberAdminDoctorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberAdminDoctorController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		
		String usertype = new MemberService().adminDoctorSelect(userId);
		
		
			
		if(usertype.equals("A")){
			request.getRequestDispatcher("/views/admin/adminHome.jsp").forward(request, response);
		}else if(usertype.equals("U")){
			request.getRequestDispatcher("/views/member/myInfo.jsp").forward(request, response);
		}else if(usertype.equals("D")) {
			request.getRequestDispatcher("/views/doctor/doctorSchedule.jsp").forward(request, response);
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
