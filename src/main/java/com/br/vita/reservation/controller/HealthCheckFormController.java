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
import com.br.vita.reservation.model.vo.CheckList;
import com.br.vita.reservation.model.vo.HealthCheck;

/**
 * Servlet implementation class HealthCheckListController
 */
@WebServlet("/CheckForm.rv")
public class HealthCheckFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HealthCheckFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8"); // post 요청이다
		
		HttpSession session = request.getSession();
		String userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		 
		CheckList ck = new CheckList();
		ck.setUserNo(userNo);
    	ck.setMediList(request.getParameter("mediList"));
    	ck.setSurgeryName(request.getParameter("surgeryName"));
    	ck.setSurgeryYN(request.getParameter("surgeryYN"));
    	ck.setFlyYN(request.getParameter("flyYN"));
    	ck.setCareNo(request.getParameter("merchant_uid"));
    	
    	int result = new ReservationService().insertHealthCheckList(ck);
    	
    	HealthCheck hc = new HealthCheck();
    	hc.setAppointmentNo(request.getParameter("merchant_uid"));
    	hc.setUserNo(userNo);
    	hc.setAppointmentTime(request.getParameter("selectedTime"));
  
    	
    	new ReservationService().insertHealtchCareList(hc);
    	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
