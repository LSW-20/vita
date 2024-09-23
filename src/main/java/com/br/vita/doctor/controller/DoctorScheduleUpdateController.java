package com.br.vita.doctor.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.vita.doctor.model.service.DoctorService;
import com.br.vita.doctor.model.vo.DoctorSchedule;
import com.br.vita.member.model.vo.Member;
import com.google.gson.Gson;

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
		
		
		//String name = request.getParameter("name"); 
		 String docNo = ((Member)request.getSession().getAttribute("loginUser")).getDoctorNo();
		
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
		
		List<DoctorSchedule> list = new ArrayList<>();
		
		list.add(new DoctorSchedule(docNo,monM,"A","월"));
		list.add(new DoctorSchedule(docNo,tueM,"A","화"));
		list.add(new DoctorSchedule(docNo,wedM,"A","수"));
		list.add(new DoctorSchedule(docNo,thuM,"A","목"));
		list.add(new DoctorSchedule(docNo,friM,"A","금"));
		
		list.add(new DoctorSchedule(docNo,monA,"P","월"));
		list.add(new DoctorSchedule(docNo,tueA,"P","화"));
		list.add(new DoctorSchedule(docNo,wedA,"P","수"));
		list.add(new DoctorSchedule(docNo,thuA,"P","목"));
		list.add(new DoctorSchedule(docNo,friA,"P","금"));
		
		int result = new DoctorService().doctorScheduleUpdate(list);
		
		
		if(result > 0) {
//			request.getRequestDispatcher("/views/doctor/doctorSchedule.jsp").forward(request, response);
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(result, response.getWriter());
			
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "등록 실패");
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
