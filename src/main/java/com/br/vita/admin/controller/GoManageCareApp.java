package com.br.vita.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.vita.doctor.model.service.DoctorService;
import com.br.vita.doctor.model.vo.Doctor;

/**
 * Servlet implementation class CareAppSelect
 */
@WebServlet("/manageCA.admin")
public class GoManageCareApp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoManageCareApp() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		// 1. 요청
		// 요청시 전달 값 없음. 
		// 관리자 진료예약 관리 페이지로 이동하는데, 그 화면에서 의료진 list가 필요하다.
		
		List<Doctor> list = new DoctorService().selectDoctorList();
		
		System.out.println(list);
		
		
		// 2. 응답
		// 응답 페이지 : 관리자 진료예약 관리 페이지 (/vita/views/admin/manageCareApp.jsp)

		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/admin/manageCareApp.jsp").forward(request, response);
	
		

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
