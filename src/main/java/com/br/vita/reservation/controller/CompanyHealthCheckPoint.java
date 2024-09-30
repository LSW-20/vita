package com.br.vita.reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.vita.member.model.vo.Member;
import com.br.vita.reservation.model.service.ReservationService;

/**
 * Servlet implementation class CompanyHealthCheckPoint
 */
@WebServlet("/CompanyHealthCheckPoint.rv")
public class CompanyHealthCheckPoint extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanyHealthCheckPoint() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 request.setCharacterEncoding("UTF-8");

	     HttpSession session = request.getSession();
	     String userNo = ((Member) session.getAttribute("loginUser")).getUserNo();
		
		String mediList = request.getParameter("mediList");
		String surgeryName = request.getParameter("surgeryName");
		String surgeryYN = request.getParameter("surgeryYN");
		String flyYN = request.getParameter("flyYN");
		
		
		System.out.println("userNo: " + userNo);
		System.out.println("mediList: " + mediList);
		System.out.println("surgeryName: " + surgeryName);
		System.out.println("surgeryYN: " + surgeryYN);
		System.out.println("flyYN: " + flyYN);
		int result = new ReservationService().insertCheckListt(userNo, mediList, surgeryName, surgeryYN, flyYN);
	        
		if (result == 1 ) {
           session.setAttribute("alertMsg", "진료예약이 완료되었습니다.");
           response.sendRedirect(request.getContextPath());
       	
       } else {
           session.setAttribute("alertMsg", "추가에 실패하였습니다.");
           request.setAttribute("msg", "건강검진 예약에 실패하였습니다.");
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
