package com.br.vita.reservation.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.vita.doctor.model.vo.DoctorSchedule;
import com.br.vita.reservation.model.service.ReservationService;
import com.google.gson.Gson;

/**
 * Servlet implementation class ResDoctorScheduleSelectController
 */
@WebServlet("/resSchedule.re")
public class ResDoctorScheduleSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResDoctorScheduleSelectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String dname = request.getParameter("name");
		
		List<DoctorSchedule> dclist = new ReservationService().doctorScheduleSel(dname);
		
		System.out.println(dclist);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(dclist, response.getWriter());
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
