package com.br.vita.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.vita.member.model.service.MemberService;
import com.br.vita.reservation.model.service.ReservationService;

/**
 * Servlet implementation class InsertCareApp
 */
@WebServlet("/addCA.admin")
public class InsertCareApp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCareApp() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 요청
		// 요청시 넘어오는 값: 의료진, 예약시간, 이름, 주민등록번호, 핸드폰번호
		// (1) 이름, 주민등록번호, 핸드폰 번호로 MEMBER 테이블에서 select 해서 USER_NO를 가져온다. 없으면 여기서 종료하고 ALERT 띄우기.
		// (2) CARE_APP 테이블에 INSERT
		
		request.setCharacterEncoding("UTF-8"); // post 요청이다
		
		HttpSession session = request.getSession(); // alert 띄우기용 session 선언. 

		String docAndDeptName = request.getParameter("doc_and_dept_name").replace(")", ""); // "정준수(안과)" -> "정준수(안과" 
		String[] docAndDeptArr = docAndDeptName.split("\\("); // split() 메서드는 정규 표현식을 사용하므로, 괄호 같은 메타문자를 사용하려면 이를 이스케이프 처리해야 합니다.
		
		String docName = docAndDeptArr[0];
		String deptName = docAndDeptArr[1];		
		String appointmentTime = request.getParameter("reservation_time");
		String name = request.getParameter("name");
		String ssn = request.getParameter("ssn");
		String phone = request.getParameter("phone");
		
		
		// (1) 이름, 주민등록번호, 핸드폰 번호로 MEMBER 테이블에서 select 해서 USER_NO를 가져온다. 없으면 여기서 종료하고 ALERT 띄우기.
		String userNo = new MemberService().findUserNo(name, ssn, phone);
		
		/*
		// null 또는 빈 문자열 체크
		if (userNo == null) {
		    System.out.println("userNo는 null입니다.");
		} else if (userNo.isEmpty()) {
		    System.out.println("userNo는 빈 문자열입니다.");
		} else {
		    System.out.println("userNo의 값: " + userNo);
		}
		*/
		
		if(userNo.isEmpty()) {
			session.setAttribute("alertMsg", "회원 정보를 잘못입력하셨습니다. \\n이름, 핸드폰번호, 주민등록번호를 확인해 주세요."); // 자바에서 문자열 내에서 \는 특수 문자(escape character)로 동작하므로, 이를 문자 그대로 사용하려면 \\
			
			request.setAttribute("msg", "회원 정보를 찾을 수 없습니다.<br>회원 정보를 잘못입력하셨거나 Member 테이블에 존재하지 않는 사원입니다.<br>진료 예약은 회원만 가능합니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
            
            return;
		} 
		
		
		
		// (2) CARE_APP 테이블에 INSERT
		
		int result = new ReservationService().insertCareApp(userNo, docName, deptName, appointmentTime);
		//System.out.println(result);
		
	
		// 2. 응답
        if(result == 1) { 
        	// insert 성공
    		// 응답페이지 : 관리자 진료예약 관리 페이지 (/vita/views/admin/manageCareApp.jsp)
    		// 응답데이터 : "성공적으로 추가되었습니다." alert 메세지
            session.setAttribute("alertMsg", "성공적으로 추가되었습니다.");
            response.sendRedirect(request.getContextPath() + "/manageCA.admin");
            
        }else { 
        	// insert 실패
    		// 응답페이지 : 에러페이지 (/vita/views/common/errorPage.jsp)
    		// 응답데이터 : "추가에 실패하였습니다." alert 메세지
            session.setAttribute("alertMsg", "추가에 실패하였습니다.");
			request.setAttribute("msg", "진료 예약에 실패하였습니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
        }
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
