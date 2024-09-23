package com.br.vita.doctor.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DoctorDelete
 */
@WebServlet("/deleteD.admin")
public class DoctorDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorDelete() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1. 요청
		// 삭제할 사번과 주민등록번호를 받아서 (1) doctor 테이블에서 삭제, (2) member 테이블에서 삭제
		
        request.setCharacterEncoding("UTF-8"); // post 요청이다
        
    	HttpSession session = request.getSession(); // alert 띄우기용 session 선언.
		
    	String[] delete = request.getParameterValues("delete");
    	System.out.println(Arrays.toString(delete));
    	
    	
    	// (1) doctor 테이블에서 삭제
    	
    	
    	
    	// (2) member 테이블에서 삭제
    	
    	
    	
    	
		// 2. 응답
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
