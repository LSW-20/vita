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
 * Servlet implementation class ReservationListController
 */
@WebServlet("/list.rv")
public class ReservationListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * 예약 내역 조회 서블릿
	 * @author 최보겸
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		if(loginUser == null) {
			request.getRequestDispatcher("/views/member/login.jsp").forward(request, response);
		} else {			
			HttpSession session = request.getSession();
			String userNo = ((Member)session.getAttribute("loginUser")).getUserNo();

			//예약 내역 조회
			List<Consultation> consultations = new ReservationService().selectCareAppList(userNo);			
			//결과 응답
			request.setAttribute("consultations", consultations);
			request.getRequestDispatcher("/views/reservation/reservationList.jsp").forward(request, response);
		}
	}//doGet

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response); 
	}

}
