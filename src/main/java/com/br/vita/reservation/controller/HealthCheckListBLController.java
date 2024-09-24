package com.br.vita.reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.vita.member.model.vo.Member;

/**
 * Servlet implementation class HealthCheckListBLController
 */
@WebServlet("/HealthCheckBL.rv")
public class HealthCheckListBLController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HealthCheckListBLController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
	    Member loginUser = (Member) session.getAttribute("loginUser"); // 로그인 사용자 정보 가져오기

	    if (loginUser == null) {
	        // 로그인하지 않은 경우, 해당 JSP 페이지로 포워딩
	        request.getRequestDispatcher("/views/reservation/healthCheckUp_BeforeLogin.jsp").forward(request, response);
	        return; // 더 이상 진행하지 않음
	    } else {
	        // 로그인한 경우
	        String userId = loginUser.getUserId(); // 사용자 ID 가져오기
	        // 이후 로직 처리
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
