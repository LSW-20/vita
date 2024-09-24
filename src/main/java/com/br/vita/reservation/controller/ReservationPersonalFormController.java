package com.br.vita.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.vita.member.model.service.MemberService;
import com.br.vita.member.model.vo.Member;
import com.br.vita.reservation.model.service.ReservationService;
import com.br.vita.reservation.model.vo.Consultation;

/**
 * Servlet implementation class ReservationPersonalFormController
 */
@WebServlet("/personalForm.rv")
public class ReservationPersonalFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationPersonalFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

		request.setCharacterEncoding("utf-8");
			
		String doctorName = request.getParameter("doctorName");
		String appointmentTime = request.getParameter("appointmentTime");
	
	       
	       
		HttpSession session = request.getSession();
		String userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		Consultation c = new Consultation(userNo, doctorName, appointmentTime);
		
		// 서비스 호출 (쿼리실행)
		int result = new ReservationService().Consultation(c);
		
		if(result >0) {
			request.getSession().setAttribute("alertMsg", "진료예약에 성공했습니다.");
			request.getRequestDispatcher("/views/reservation/consultation_Success.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "오류");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
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
