package com.br.vita.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.vita.reservation.model.service.ReservationService;

/**
 * Servlet implementation class ReservationDeleteCheckupAppController
 */
@WebServlet("/deletech.rv")
public class ReservationDeleteCheckupAppController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationDeleteCheckupAppController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 요청
		request.setCharacterEncoding("UTF-8"); // post 요청이다
		HttpSession session = request.getSession(); // alert 띄우기용 session 선언.
		String appointmentNo = request.getParameter("appointmentNo");
		
		int result = new ReservationService().deleteCheckupApp(appointmentNo);
		
		if(result == 1) {
			session.setAttribute("alertMsg", "검진 예약을 취소 하였습니다.");
			response.sendRedirect(request.getContextPath()+"/list.rv");
		}else {
			session.setAttribute("alertMsg", "예약 취소를 실패 했습니다.");
			response.sendRedirect(request.getContextPath()+"/list.rv");			
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
