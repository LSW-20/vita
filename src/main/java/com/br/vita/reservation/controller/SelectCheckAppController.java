package com.br.vita.reservation.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.vita.member.model.vo.Member;
import com.br.vita.reservation.model.service.ReservationService;
import com.br.vita.reservation.model.vo.HealthCheck;

/**
 * Servlet implementation class SelectCheckAppController
 */
@WebServlet("/SelectCheckApp.rv")
public class SelectCheckAppController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectCheckAppController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		List<HealthCheck> Success11 = new ReservationService().selectSuccessMember(userNo);
		
		System.out.println(Success11);
		 if (Success11 == null  || Success11.isEmpty()) {
			 request.getRequestDispatcher("/views/reservation/healthCheckUp_1.jsp").forward(request, response);
			 session.setAttribute("alertMsg", "등록된 회원정보와 일치하지 않습니다.");
			 

	        } else {
	        	session.setAttribute("alertMsg", "검진 예약내역이 존재합니다.");
	        	request.getRequestDispatcher("/views/reservation/healthCheckUp_AfterLogin.jsp").forward(request, response);
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
