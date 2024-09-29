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
 * Servlet implementation class AllmrecordsFileListSelectController
 */
@WebServlet("/allmrlist.se")
public class AllmrecordsFileListSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllmrecordsFileListSelectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userNo = request.getParameter("userNo");
		String careNo = request.getParameter("careNo");
		
		Map<String,Object> mrallMap = new DoctorService().selectMrecordsAllListSelect(userNo,careNo);
		
		
		
		response.setContentType("application/json; charset=UTF-8");
		
		Date updateDate = (Date) mrallMap.get("treatDate");

		// 날짜를 문자열로 변환
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일");
		String dateString = sdf.format(updateDate);

		
		

		// 다시 mrallMap에 넣기
		mrallMap.put("treatDate", dateString);
		
		
		
		
		new GsonBuilder().setDateFormat("YYYY년MM월DD일").create().toJson(mrallMap, response.getWriter());
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
