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
 * Servlet implementation class SelectCheckupAppC
 */
@WebServlet("/searchCHC.admin")
public class SelectCheckupAppC extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectCheckupAppC() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		// 1. 요청
		
		String com = request.getParameter("com");
		String startDate = request.getParameter("start_date");
		String endDate = request.getParameter("end_date");
		
		List<Map<String, Object>> listC = new ReservationService().selectCheckupAppC(com, startDate, endDate);
		//System.out.println(listC);
		
		
		

		
		// 전체 기업명이 건강검진 예약관리 페이지에서 필요하다. 
		List<Company> companyList = new CompanyService().companySelect();
		
		
		
		// 2. 응답 
		// 응답 페이지 : /vita/views/admin/manageCheckupApp.jsp
		// 응답 데이터 : 기업 건강검진 조회 데이터, 전체 기업명, flag 변수
		
		request.setAttribute("companyList", companyList);
		request.setAttribute("listC", listC);
		

		// flag
		if(listC.isEmpty()) { 
			request.setAttribute("CthreeType", false);
		} else {
			request.setAttribute("CthreeType", true);
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
