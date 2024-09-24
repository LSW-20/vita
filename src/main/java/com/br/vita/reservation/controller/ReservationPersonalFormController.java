package com.br.vita.reservation.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

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
		
		ReservationService reservationService = new ReservationService();
        boolean hasAppointment = reservationService.SelectConsultation(userNo, appointmentTime);
        
        if (hasAppointment == true) {
            request.getSession().setAttribute("alertMsg", "해당 시간에 예약 내역이 있습니다. 다시 확인해주세요.");
            request.getRequestDispatcher("/views/reservation/consultation_AfterLogin.jsp").forward(request, response);
            return;
        }
        
		Consultation c = new Consultation(userNo, doctorName, appointmentTime);
		
		// 서비스 호출 (쿼리실행)
		int result = new ReservationService().Consultation(c);
		
		if(result >0) {
			 request.getSession().setAttribute("alertMsg", "진료예약에 성공했습니다.");
	            
	         // 예약 성공 시, 예약 성공 페이지로 리다이렉트
	         response.sendRedirect(request.getContextPath() + "/ReservationSuccess.rv?appointmentTime=" + URLEncoder.encode(appointmentTime, StandardCharsets.UTF_8.toString()));
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
