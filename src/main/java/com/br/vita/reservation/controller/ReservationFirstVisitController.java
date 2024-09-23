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
 * Servlet implementation class ReservationController
 */
@WebServlet("/first.rv")
public class ReservationFirstVisitController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationFirstVisitController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String phone1 = request.getParameter("phone1");
	    String phone2 = request.getParameter("phone2");
	    String phone3 = request.getParameter("phone3");
	    String phone = phone1 + "-" + phone2 + "-" + phone3; // '010-6789-0123' 형식으로 결합

	    String userName = request.getParameter("userName");
	    String userSSN1 = request.getParameter("userSSN1");
	    String userSSN2 = request.getParameter("userSSN2");
	    String userSSN = userSSN1 + "-" + userSSN2; // '880101-1111111' 형식으로 결합
	        
		HttpSession session = request.getSession();
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
			
		Member firstVisit = new ReservationService().ComparisonMember(userId, phone, userName, userSSN);
			
		if (firstVisit == null) {
			request.getRequestDispatcher("/views/reservation/firstTimeUserReservation.jsp").forward(request, response);
			session.setAttribute("alertMsg", "등록된 회원정보와 일치하지 않습니다.");
		} else {
			session.setAttribute("alertMsg", "첫방문 예약 안내가 신청되었습니다.");
			request.getRequestDispatcher("/views/reservation/first_Success.jsp").forward(request, response);
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
