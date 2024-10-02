package com.br.vita.reservation.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import com.br.vita.reservation.model.vo.CheckList;
import com.br.vita.reservation.model.vo.HealthCheck;
import com.itextpdf.text.log.SysoCounter;

/**
 * Servlet implementation class HealthCheckListController
 */
@WebServlet("/CheckForm.rv")
public class HealthCheckFormController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public HealthCheckFormController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        String userNo = ((Member) session.getAttribute("loginUser")).getUserNo();

        String year = request.getParameter("year");
        String month = request.getParameter("month");
        String day = request.getParameter("day");
        
        String date = String.format("%s/%02d/%02d", year, Integer.parseInt(month), Integer.parseInt(day));
        String time = request.getParameter("selectedTime1");

	    String payNo = request.getParameter("merchant_uid");//payNo
	    String pg = request.getParameter("selectedPG");
	   
	    int result = new ReservationService().insertHealtchCareList(userNo, time, date);
        
        if (result == 1 ) {
        	int payResult = new PaymentService().insertPayHealthCheck(payNo,userNo, pg);
        	if(payResult == 1) {
        		List<HealthCheck> Success = new ReservationService().selectSuccessNormal(userNo, date);
        		if(Success != null) {
		            session.setAttribute("alertMsg", "검진예약이 완료되었습니다.");
		            request.setAttribute("Success", Success);
		            request.setAttribute("date", date);
		            request.setAttribute("time", time);
		            request.getRequestDispatcher("/views/reservation/healthCheckUp_Success.jsp").forward(request, response);
        		}
        	}
        } else {
            session.setAttribute("alertMsg", "추가에 실패하였습니다.");
            request.setAttribute("msg", "건강검진 예약에 실패하였습니다.");
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}