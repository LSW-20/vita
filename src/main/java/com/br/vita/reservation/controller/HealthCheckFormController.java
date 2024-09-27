package com.br.vita.reservation.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.vita.member.model.vo.Member;
import com.br.vita.reservation.model.service.ReservationService;
import com.br.vita.reservation.model.vo.CheckList;
import com.br.vita.reservation.model.vo.HealthCheck;

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
        String selectedDateString = String.format("%s/%02d/%02d", year, Integer.parseInt(month), Integer.parseInt(day));

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
        Date selectedDate = null;
        try {
            selectedDate = (Date) dateFormat.parse(selectedDateString); // 캐스팅 제거
        } catch (ParseException e) {
            e.printStackTrace();
            session.setAttribute("alertMsg", "날짜 형식이 잘못되었습니다.");
            response.sendRedirect(request.getContextPath() + "/errorPage.jsp"); // 에러 페이지로 리디렉션
            return; // 오류 발생 시 후속 코드 실행 방지
        }

        // selectedDate를 java.sql.Date로 변환
        java.sql.Date sqlDate = new java.sql.Date(selectedDate.getTime());
        
        
        HealthCheck hc = new HealthCheck();
        hc.setAppointmentNo(request.getParameter("merchant_uid"));
        hc.setUserNo(userNo);
        hc.setAppointmentTime(request.getParameter("selectedTime"));
    

        int result = new ReservationService().insertHealtchCareList(hc);

        if (result > 0) {
            session.setAttribute("alertMsg", "진료예약이 완료되었습니다.");
            response.sendRedirect(request.getContextPath() + "/HealthCheckAL.rv");
        } else {
            session.setAttribute("alertMsg", "추가에 실패하였습니다.");
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}