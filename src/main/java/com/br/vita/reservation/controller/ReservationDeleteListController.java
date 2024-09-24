package com.br.vita.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.vita.reservation.model.service.ReservationService;
import com.google.gson.Gson;

/**
 * Servlet implementation class ReservationDeleteListController
 */
@WebServlet("/delete.rv")
public class ReservationDeleteListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationDeleteListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * 예약 취소 요청
	 * @author 최보겸
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String appointmentNo = request.getParameter("appointmentNo");
		int result = new ReservationService().deleteCareApp(appointmentNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "예약 내역이 삭제 되었습니다.");
			response.sendRedirect(request.getContextPath()+"/list.rv");
		} else {
			request.setAttribute("alertMsg","예약 취소에 실패 했습니다.");
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
