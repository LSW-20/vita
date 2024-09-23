package com.br.vita.doctor.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.vita.doctor.model.service.DoctorService;
import com.br.vita.doctor.model.vo.DoctorSchedule;
import com.br.vita.member.model.vo.Member;
import com.google.gson.Gson;

/**
 * Servlet implementation class DoctorSchedulePageSelectController
 */
@WebServlet("/scheduleSelect.me")
public class DoctorSchedulePageSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorSchedulePageSelectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String docNo = ((Member)request.getSession().getAttribute("loginUser")).getDoctorNo();
		// 의사사번을 뽑고 싶을때 Member객체에 담을 수 있는 매개변수 새로 추가후 이처럼 해당값을 뽑을 수 있다.
		
		List<DoctorSchedule> schedule =  new DoctorService().schedulePageSelect(docNo);
		
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(schedule, response.getWriter());
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
