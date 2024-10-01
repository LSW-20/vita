package com.br.vita.reservation.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.vita.member.model.vo.Member;
import com.br.vita.reservation.model.service.ReservationService;
import com.br.vita.reservation.model.vo.HealthCheck;

/**
 * Servlet implementation class SelectCheckAPPCompanyController
 */
@WebServlet("/SelectCheckAPPCompany.rv")
public class SelectCheckAPPCompanyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectCheckAPPCompanyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		List<HealthCheck> Success111 = new ReservationService().selectSuccessCompanyMember(userNo);
		
		System.out.println(Success111);
		 if (Success111 == null  || Success111.isEmpty()) {
			 request.getRequestDispatcher("/views/reservation/company_Health_1.jsp").forward(request, response);

	        } else {
	        	session.setAttribute("alertMsg", "검진 예약내역이 존재합니다.");
	        	request.getRequestDispatcher("/views/reservation/healthCheckUp_AfterLogin.jsp").forward(request, response);
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
