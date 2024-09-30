package com.br.vita.reservation.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.vita.employee.model.vo.Employee;
import com.br.vita.payment.model.service.PaymentService;
import com.br.vita.reservation.model.service.ReservationService;

/**
 * Servlet implementation class SelectCompanyController
 */
@WebServlet("/SelectCompany.rv")
public class SelectCompanyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectCompanyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String companyName = request.getParameter("companyName"); 
		String name = request.getParameter("name"); 
		String name1 = request.getParameter("name1");
		
		//예약 내역 조회
		List<Employee> Company = new ReservationService().selectCompany(companyName, name , name1);
		//결과 응답
		
		
		 if (Company == null  || Company.isEmpty()) {
			 request.getRequestDispatcher("/views/reservation/company_Health_1.jsp").forward(request, response);
			 session.setAttribute("alertMsg", "사원 정보가 일치하지 않습니다.");

	        } else {
	        	session.setAttribute("alertMsg", "사원 정보가 일치합니다.");
	        	request.getRequestDispatcher("/views/reservation/company_Health_3.jsp").forward(request, response);
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
