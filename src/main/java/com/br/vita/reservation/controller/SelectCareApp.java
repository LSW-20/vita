package com.br.vita.reservation.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SelectCareApp
 */
@WebServlet("/searchCA.admin")
public class SelectCareApp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectCareApp() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1. 요청
		// 요청시 '진료과', '의사명', '날짜'가 넘어온다.
		// care_app, member 테이블에서 화면에 뿌릴 데이터들을 조회한다. (doctor는 서브쿼리로)
		
		String deptName = request.getParameter("dept_name");
		String docName = request.getParameter("doc_name");
		String appDate = request.getParameter("app_date");
		
		List<Map<String, Object>> resultList = new ReservationService().selectCareApp(deptName, docName, appDate);
		System.out.println(resultList);
		
		
		// 2. 응답
		// 응답 페이지 : 관리자 진료예약 관리 페이지 (/vita/views/admin/manageCareApp.jsp)
		// 응답 데이터 : db로부터 조회된 데이터(응답페이지에서만 필요)
		
		request.setAttribute("resultList", resultList);
		request.getRequestDispatcher("/views/admin/manageCareApp.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
