package com.br.vita.doctor.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.br.vita.doctor.model.service.DoctorService;

/**
 * Servlet implementation class DoctorSelectBYDEPT
 */
@WebServlet("/searchDocByDept.admin")
public class DoctorSelectBYDEPT extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorSelectBYDEPT() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 요청
		// 진료과가 json으로 넘어오면 그 진료과에 해당하는 의사들 리스트를 응답데이터로 돌려준다.
	    String dept = request.getParameter("dept");
       
		// String[] docList = new DoctorService().selectDoctorBYDept(dept); String 배열이 아닌, List<String>을 쓴다. 배열은 크기를 할당해야하는데 얼마나 들어올지 모른다.
	    List<String> docList = new DoctorService().selectDoctorBYDept(dept);
		
		

        // 다수의 응답데이터 돌려주기
        // JSONArray로 응답
		
        JSONArray jArr = new JSONArray(); // []
        
        for(String s : docList) {
        	jArr.add(s); // 해당 진료과에 있는 의사들이 인덱스에 차례로 담긴다.
        }
       
        response.setContentType("application/json; charset=UTF-8"); // JSON 데이터를 응답할때
        response.getWriter().print(jArr);

		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
