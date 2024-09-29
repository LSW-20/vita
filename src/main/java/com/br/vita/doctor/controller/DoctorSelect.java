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

/**
 * Servlet implementation class DoctorSelect
 */
@WebServlet("/searchDoc.admin")
public class DoctorSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorSelect() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1. 요청
		// 의사 이름, 의사 사번, 의사 진료과 요청으로 받아온다. db에 select 후 결과를 가져온다.
		
		String doctorName = request.getParameter("doctor_name");
		String doctorNo = request.getParameter("doctor_no");
		String dept = request.getParameter("dept");
		
		List<Map<String, Object>> list = new DoctorService().selectDoctor(doctorName, doctorNo, dept);
		
		
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
