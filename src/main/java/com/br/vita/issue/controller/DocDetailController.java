package com.br.vita.issue.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.vita.issue.model.service.IssueService;
import com.br.vita.issue.model.vo.Mrecords;
import com.br.vita.member.model.vo.Member;

/**
 * Servlet implementation class DocDetailController
 */
@WebServlet("/detail.cr")
public class DocDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DocDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * 발급상세 페이지로 넘어가는 서블릿
	 * @author 최보겸
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		if(loginUser == null) {
			request.getRequestDispatcher("/views/member/login.jsp").forward(request, response);
		} else {
			String docType = request.getParameter("docType");
			String careNo = request.getParameter("careNo");
			String userNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");

			//진료기록 정보 가져오는 서비스
			List<Mrecords> records = new IssueService().selectMrecords(userNo, startDate, endDate);
			if (records == null || records.isEmpty()) {
	            records = new ArrayList<>(); // 빈 리스트로 초기화하여 null 방지
	        }
			//응답
			request.setAttribute("records", records);
			request.setAttribute("docType", docType);
			request.getRequestDispatcher("/views/issue/getDocDetail.jsp").forward(request, response);			
		}
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
