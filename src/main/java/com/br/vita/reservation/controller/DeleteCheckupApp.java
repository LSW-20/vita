package com.br.vita.reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.vita.reservation.model.service.ReservationService;

/**
 * Servlet implementation class DeleteCheckupApp
 */
@WebServlet("/deleteCH.admin")
public class DeleteCheckupApp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCheckupApp() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1. 요청
		request.setCharacterEncoding("UTF-8"); // post 요청이다
		HttpSession session = request.getSession(); // alert 띄우기용 session 선언. 
		
		String appNo = request.getParameter("app_no");
		int result = new ReservationService().deleteCheckupApp(appNo);
		
		
		
		// 2. 응답
        if(result == 1) { 
        	// delete 성공
    		// 응답페이지 : 관리자 건강검진예약 관리 페이지 (/vita/views/admin/manageCheckupApp.jsp)
    		// 응답데이터 : "성공적으로 삭제되었습니다." alert 메세지
            session.setAttribute("alertMsg", "성공적으로 삭제되었습니다.");
            response.sendRedirect(request.getContextPath() + "/manageCH.admin");
        }else { 
        	// delete 실패
    		// 응답페이지 : 관리자 건강검진예약 관리 페이지 (/vita/views/admin/manageCheckupApp.jsp)
    		// 응답데이터 : "삭제에 실패하였습니다." alert 메세지
            session.setAttribute("alertMsg", "삭제에 실패하였습니다.");
            response.sendRedirect(request.getContextPath() + "/manageCH.admin");
        }
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
