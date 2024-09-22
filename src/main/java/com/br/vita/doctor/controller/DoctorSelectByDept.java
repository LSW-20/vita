package com.br.vita.doctor.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.vita.doctor.model.service.DoctorService;
import com.br.vita.doctor.model.vo.Doctor;

/**
 * Servlet implementation class DoctorSelectByName
 */
@WebServlet("/searchDocByDept.admin")
public class DoctorSelectByDept extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorSelectByDept() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1. 요청
		// 진료과를 요청으로 받아온다. db에 진료과로 select 후 결과를 가져온다.
		
		String dept = request.getParameter("dept");
		System.out.println(dept);
		
		List<Map<String, Object>> list = new DoctorService().selectByDept(dept);
		
		
		// 2. 응답
		// 응답페이지 : 관리자 의료진 계정 관리 페이지(/vita/views/admin/manageDoctor.jsp)
		// 응답데이터 : db로부터 조회된 데이터(응답페이지에서만 필요)
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/admin/manageDoctor.jsp").forward(request, response);

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
