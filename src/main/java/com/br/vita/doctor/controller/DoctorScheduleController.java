package com.br.vita.doctor.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.vita.doctor.model.service.DoctorService;
import com.br.vita.doctor.model.vo.Doctor;

/**
 * Servlet implementation class DoctorScheduleController
 */
@WebServlet("/schedule.doc")
public class DoctorScheduleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorScheduleController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		String no = request.getParameter("no");
		String dept = request.getParameter("dept");
		
		Map<String,Object> map = new DoctorService().selectSchedule(dept);
		
		request.setAttribute("Map", map);
		
		Doctor doctor = (Doctor) map.get("doc");// map안에 담겨있는 객체는 이런식으로 따로 정의해서 아래처럼 원하는 속성값 추출
		
		
		if(doctor != null && doctor.getDeptName().equals("내과")) {
			request.getRequestDispatcher("/views/doctor/doc_intro.jsp").forward(request, response);
//			System.out.println(map.get("list"));
		}else if(doctor != null && doctor.getDeptName().equals("외과")) {
			request.getRequestDispatcher("/views/doctor/doc_intro2.jsp").forward(request, response);
			
		}else if(doctor != null && doctor.getDeptName().equals("치과")) {
			request.getRequestDispatcher("/views/doctor/doc_intro3.jsp").forward(request, response);
			
		}else {
			request.getRequestDispatcher("/views/doctor/doc_intro4.jsp").forward(request, response);
		}
	
		
	
		
//		System.out.println(map);
		
		/*
		response.setContentType("application/json; charset=UTF-8");
		
		new Gson().toJson(doc, response.getWriter());
		*/
		
		
		// map을 request에 담아서
		// 응답페이지(의료진상세페이지)로 포워딩
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
