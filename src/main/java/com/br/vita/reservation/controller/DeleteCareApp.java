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
 * Servlet implementation class DeleteCareApp
 */
@WebServlet("/deleteCA.admin")
public class DeleteCareApp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCareApp() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1. 요청
		request.setCharacterEncoding("UTF-8"); // post 요청이다
		HttpSession session = request.getSession(); // alert 띄우기용 session 선언. 
		
		String careNo = request.getParameter("care_no");
		int result = new ReservationService().deleteCareApp(careNo);
		
		
		
		// 2. 응답
        if(result == 1) { 
        	// delete 성공
    		// 응답페이지 : 관리자 진료예약 관리 페이지 (/vita/views/admin/manageCareApp.jsp)
    		// 응답데이터 : "성공적으로 삭제되었습니다." alert 메세지
            session.setAttribute("alertMsg", "성공적으로 삭제되었습니다.");
            response.sendRedirect(request.getContextPath() + "/manageCA.admin");
            
        }else { 
        	// delete 실패
    		// 응답페이지 : 관리자 진료예약 관리 페이지 (/vita/views/admin/manageCareApp.jsp)
    		// 응답데이터 : "삭제에 실패하였습니다." alert 메세지
            session.setAttribute("alertMsg", "삭제에 실패하였습니다.");
            response.sendRedirect(request.getContextPath() + "/manageCA.admin");
        }
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
