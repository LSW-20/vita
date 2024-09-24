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
import com.br.vita.reservation.model.vo.Consultation;

/**
 * Servlet implementation class ReservationSuccess
 */
@WebServlet("/ReservationSuccess.rv")
public class ReservationSuccess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationSuccess() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		String appointmentTime = request.getParameter("appointmentTime"); 
		System.out.println("회원번호 : " + userNo);
		System.out.println("예약시간 : " + appointmentTime);
		//예약 내역 조회
		List<Consultation> Success = new ReservationService().selectSuccess(userNo, appointmentTime);
		
		//결과 응답
		request.setAttribute("Success", Success);
		request.getRequestDispatcher("/views/reservation/consultation_Success.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
