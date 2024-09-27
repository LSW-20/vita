package com.br.vita.issue.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.vita.issue.model.service.IssueService;
import com.google.gson.Gson;

/**
 * Servlet implementation class CertificateApplicationController
 */
@WebServlet("/appication.ce")
public class CertificateApplicationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CertificateApplicationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userNo = request.getParameter("userNo");
		String type = request.getParameter("type");
		String purpose = request.getParameter("purpose");
		String careNo = request.getParameter("careNo");
		
//		String cDate2 = request.getParameter("cDate2");
		/* String Date = cDate.substring(2).replace("-",""); */
		
//		String Date2 = cDate2.substring(2).replace("-","");
		
		
		
		int result =  new IssueService().certificateApplicationInsert(userNo,type,purpose,careNo);
		
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(result);
		
		
		//if(result > 0) {
			
		//}
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
