package com.br.vita.doctor.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.vita.doctor.model.service.DoctorService;

/**
 * Servlet implementation class DoctorScheduleUpdateController
 */
@WebServlet("/schedule.up")
public class DoctorScheduleUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorScheduleUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String name = request.getParameter("name"); 
		
		String monM = request.getParameter("monMorning"); 
		String tueM = request.getParameter("tueMorning"); 
		String wedM = request.getParameter("wedMorning"); 
		String thuM = request.getParameter("thuMorning"); 
		String friM = request.getParameter("friMorning"); 
		String monA = request.getParameter("monAfternoon"); 
		String tueA = request.getParameter("tueAfternoon"); 
		String wedA = request.getParameter("wedAfternoon"); 
		String thuA = request.getParameter("thuAfternoon"); 
		String friA = request.getParameter("friAfternoon"); 
		
		
		new DoctorService().doctorScheduleUpdate(name,monM,tueM,wedM,thuM,friM,monA,tueA,wedA,thuA,friA);
	
		
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
