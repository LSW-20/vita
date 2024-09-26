package com.br.vita.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.vita.company.model.service.CompanyService;
import com.br.vita.company.model.vo.Company;

/**
 * Servlet implementation class GoCheckupApp
 */
@WebServlet("/manageCH.admin")
public class GoCheckupApp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoCheckupApp() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1. 요청
		// 전체 기업명이 응답페이지에서 필요하다. GoManageCompany.java에서 만들었던 메소드를 재사용한다. 기업명과 사업자번호가 들어가 있다.
		List<Company> companyList = new CompanyService().companySelect();
		
		
		
		// 2. 응답 
		// 응답 페이지 : /vita/views/admin/manageCheckupApp.jsp
		// 응답 데이터 : 기업명과 사업자번호
		request.setAttribute("companyList", companyList);
		request.getRequestDispatcher("/views/admin/manageCheckupApp.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
