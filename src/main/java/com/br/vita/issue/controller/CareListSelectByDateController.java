package com.br.vita.issue.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.vita.issue.model.service.IssueService;
import com.br.vita.issue.model.vo.Mrecords;
import com.br.vita.member.model.vo.Member;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * Servlet implementation class CareListSelectByDateController
 */
@WebServlet("/careList.se")
public class CareListSelectByDateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CareListSelectByDateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		String date1 = request.getParameter("careDate1");
		String date2 = request.getParameter("careDate2");
		
		String caredate1 = date1.substring(2).replace("-",""); // 필요한 부분에 맞게 수정
		String caredate2 = date2.substring(2).replace("-",""); // 필요한 부분에 맞게 수정
		
		List<Mrecords> mr = new IssueService().careListSelectByDate(userNo, caredate1, caredate2);
		
		response.setContentType("application/json; charset=UTF-8");
		
		// 날짜 형식 수정
		new GsonBuilder().setDateFormat("yyyy년MM월dd일").create().toJson(mr, response.getWriter());
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
