package com.br.vita.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.vita.doctor.model.vo.Doctor;

/**
 * Servlet implementation class GoManageMember
 */
@WebServlet("/manageD.admin")
public class GoManageDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoManageDoctor() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 요청 - 없음
		
		// 2. 응답 
		// 응답 페이지 : /vita/views/admin/manageDoctor.jsp
		// 응답 데이터 : 빈 List<Doctor> list
		request.setAttribute("list", new ArrayList<Doctor>());
		request.getRequestDispatcher("/views/admin/manageDoctor.jsp").forward(request, response);;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
