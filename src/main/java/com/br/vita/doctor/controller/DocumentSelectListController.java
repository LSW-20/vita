package com.br.vita.doctor.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.vita.doctor.model.service.DoctorService;
import com.br.vita.member.model.vo.Member;
import com.google.gson.Gson;

/**
 * Servlet implementation class DocumentSelectListController
 */
@WebServlet("/docuSel.do")
public class DocumentSelectListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DocumentSelectListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String type = request.getParameter("type");
		String docNo = ((Member)request.getSession().getAttribute("loginUser")).getDoctorNo();
		
		
		List<Member> doculist = new DoctorService().documentSelect(type,docNo);
		
		
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(doculist, response.getWriter());
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
