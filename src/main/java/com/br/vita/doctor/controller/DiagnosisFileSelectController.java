package com.br.vita.doctor.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.vita.doctor.model.service.DoctorService;
import com.google.gson.GsonBuilder;

/**
 * Servlet implementation class DiagnosisFileSelectController
 */
@WebServlet("/diagnosis.se")
public class DiagnosisFileSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiagnosisFileSelectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String userNo = request.getParameter("userNo");
		
		String careNo = request.getParameter("careNo");
		
		String type = request.getParameter("type");
		
		Map<String,Object> careMap = new DoctorService().diagnosisSelectFile(userNo,careNo,type);
		
		
		
		response.setContentType("application/json; charset=UTF-8");
		
		//new Gson().toJson(careMap, response.getWriter());
		
		/*
		 * Date updateDate = (Date) careMap.get("Mrecords");
		 * 
		 * // 날짜를 문자열로 변환 SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일");
		 * String dateString = sdf.format(updateDate);
		 * 
		 * // "-" 제거
		 * 
		 */
		
		
		
		new GsonBuilder().setDateFormat("yyyy년MM월dd일").create().toJson(careMap, response.getWriter());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
