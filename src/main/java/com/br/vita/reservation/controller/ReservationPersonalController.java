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
 * Servlet implementation class ReservationConsultationController
 */
@WebServlet("/personal.rv")
public class ReservationPersonalController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationPersonalController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
	    String userSSN = request.getParameter("SSN-back");
	  
	        
		HttpSession session = request.getSession();
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
			
		Member SSNBackNum = new ReservationService().SSNBackNum(userId, userSSN);
			
		if (SSNBackNum == null) {
			request.getRequestDispatcher("/views/reservation/personal.jsp").forward(request, response);
			session.setAttribute("alertMsg", "등록된 회원정보와 일치하지 않습니다.");
		} else {
			session.setAttribute("alertMsg", "주민번호가 확인되었습니다.");
			request.getRequestDispatcher("/views/reservation/consultation_Form.jsp").forward(request, response);
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
