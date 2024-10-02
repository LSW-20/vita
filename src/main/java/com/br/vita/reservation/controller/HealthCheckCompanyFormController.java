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
import com.br.vita.payment.model.service.PaymentService;
import com.br.vita.reservation.model.service.ReservationService;
import com.br.vita.reservation.model.vo.HealthCheck;

/**
 * Servlet implementation class HealthCheckCompanyFormController
 */
@WebServlet("/CompanyForm.rv")
public class HealthCheckCompanyFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HealthCheckCompanyFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("UTF-8");

	        HttpSession session = request.getSession();
	        String userNo = ((Member) session.getAttribute("loginUser")).getUserNo();
	        String userName = ((Member) session.getAttribute("loginUser")).getUserName();

	        String year = request.getParameter("year");
	        String month = request.getParameter("month");
	        String day = request.getParameter("day");
	        
	        String date = String.format("%s/%02d/%02d", year, Integer.parseInt(month), Integer.parseInt(day));
	        String time = request.getParameter("selectedTime1");
	        
		    int result = new ReservationService().insertHealthCheckCompanyList(userNo, userName, time, date);
	        
		    System.out.println(date);
		    System.out.println(userNo);
	        if (result == 1 ) {
	        	{
	        		List<HealthCheck> Success1 = new ReservationService().selectSuccessCompany(userNo, date);
	        		System.out.println(Success1);
	        		if(Success1 != null) {
			            session.setAttribute("alertMsg", "검진예약이 완료되었습니다.");
			            request.setAttribute("Success1", Success1);
			            request.setAttribute("date", date);
			            request.setAttribute("time", time);
			            request.getRequestDispatcher("/views/reservation/companyHealthCheckUp_Success.jsp").forward(request, response);
	        		}
	        	}
	        } else {
	            session.setAttribute("alertMsg", "추가에 실패하였습니다.");
	            request.setAttribute("msg", "건강검진 예약에 실패하였습니다.");
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
