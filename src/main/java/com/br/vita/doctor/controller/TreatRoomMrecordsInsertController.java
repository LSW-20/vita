package com.br.vita.doctor.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.vita.doctor.model.service.DoctorService;
import com.br.vita.member.model.vo.Member;
import com.google.gson.Gson;

/**
 * Servlet implementation class TreatRoomMrecordsInsertController
 */
@WebServlet("/mrecords.up")
public class TreatRoomMrecordsInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TreatRoomMrecordsInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String docNo = ((Member)request.getSession().getAttribute("loginUser")).getDoctorNo();
		String deptName = ((Member)request.getSession().getAttribute("loginUser")).getDeptName();
		
		String userNo = request.getParameter("userNo");
		String resNo = request.getParameter("resNo");
		String userName = request.getParameter("userName");
		String symptoms = request.getParameter("symptoms");
		String opinion = request.getParameter("opinion");
		String treatment = request.getParameter("treatment");
		String diagnosis = request.getParameter("diagnosis");
		
		/*
		 * System.out.println(docNo); System.out.println(deptName);
		 * System.out.println(userNo); System.out.println(resNo);
		 * System.out.println(userName); System.out.println(symptoms);
		 * System.out.println(opinion); System.out.println(treatment);
		 * System.out.println(diagnosis);
		 */
		
		Map<String,Object> mrMap = new HashMap<>();
		
		mrMap.put("docNo",docNo);
		mrMap.put("deptName",deptName);
		mrMap.put("resNo", resNo);
		mrMap.put("userNo",userNo);
		mrMap.put("userName",userName);
		mrMap.put("symptoms",symptoms);
		mrMap.put("opinion",opinion);
		mrMap.put("treatment",treatment);
		mrMap.put("diagnosis",diagnosis);
		
		int mrresult = new DoctorService().treatRoomInsertAndreUpdate(mrMap);
		
		

        response.setContentType("application/json; charset=UTF-8");
        new Gson().toJson(mrresult, response.getWriter());
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
