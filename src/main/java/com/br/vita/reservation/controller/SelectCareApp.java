package com.br.vita.reservation.controller;

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
import com.br.vita.reservation.model.service.ReservationService;

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
		// care_app, member, doctor 테이블에서 화면에 뿌릴 데이터들을 조회한다. 
		
		String deptName = request.getParameter("dept_name");
		String docName = request.getParameter("doc_name").substring(0, request.getParameter("doc_name").indexOf("("));
		String appDate1 = request.getParameter("app_date1");
		String appDate2 = request.getParameter("app_date2");
		
		//System.out.println("시작일 : " + appDate1);
		//System.out.println("종료일 : " + appDate2);
		
		// System.out.println(deptName +","+ docName +","+ appDate1 + "," + appDate2);
		List<Map<String, Object>> resultList = new ReservationService().selectCareApp(deptName, docName, appDate1, appDate2);
		//System.out.println("resultList : " + resultList);
		
		
		// 2. 응답
		// 응답 페이지 : 관리자 진료예약 관리 페이지 (/vita/views/admin/manageCareApp.jsp)
		// 응답 데이터 : db로부터 조회된 데이터(응답페이지에서만 필요)
		
		request.setAttribute("resultList", resultList);
		
		// flag 값(threeType)도 담아서 포워딩. 이 값에 따라 검색전/검색 후 결과없는 경우/검색 후 결과있는 경우로 다르게 보여진다.
		if(resultList.isEmpty()) { 
			request.setAttribute("threeType", false);
		} else {
			request.setAttribute("threeType", true);
		}
		
		
		// 의사명과 진료과를 줘야 select에서 고를 수 있다.
		List<Doctor> list = new DoctorService().selectDoctorList();
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
