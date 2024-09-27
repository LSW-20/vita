package com.br.vita.reservation.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.vita.company.model.service.CompanyService;
import com.br.vita.company.model.vo.Company;
import com.br.vita.reservation.model.service.ReservationService;

/**
 * Servlet implementation class SelectCheckupAppN
 */
@WebServlet("/searchCHN.admin")
public class SelectCheckupAppN extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectCheckupAppN() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1. 요청
		
		String startDate = request.getParameter("start_date");
		String endDate = request.getParameter("end_date");
		
		List<Map<String, Object>> listN = new ReservationService().selectCheckupAppN(startDate, endDate);
		//System.out.println(listN);
		
		
		
		
		// 전체 기업명이 건강검진 예약관리 페이지에서 필요하다. 
		List<Company> companyList = new CompanyService().companySelect();
		
		
		
		// 2. 응답 
		// 응답 페이지 : /vita/views/admin/manageCheckupApp.jsp
		// 응답 데이터 : 일반 건강검진 조회 데이터, 전체 기업명, flag 변수
		
		request.setAttribute("companyList", companyList);
		request.setAttribute("listN", listN);
		

		// flag
		if(listN.isEmpty()) { 
			request.setAttribute("NthreeType", false);
		} else {
			request.setAttribute("NthreeType", true);
		}

		
		request.getRequestDispatcher("/views/admin/manageCheckupApp.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
