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
 * Servlet implementation class InsertCheckupAppN
 */
@WebServlet("/addCHN.admin")
public class InsertCheckupAppN extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCheckupAppN() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// 1. 요청
		// 요청시 넘어오는 값: 예약일, 예약시간, 검진비용 + 회원id, 이름 + 복용중인약, 최근수술여부, 수술명, 비행예정여부
		// (1) 회원id, 이름으로 MEMBER 테이블에서 select 해서 USER_NO를 가져온다. 없으면 여기서 종료하고 ALERT 띄우기.
		// (2) CHECKUP_APP 테이블에 INSERT
		
		request.setCharacterEncoding("UTF-8"); // post 요청이다
		
		HttpSession session = request.getSession(); // alert 띄우기용 session 선언. 
		

		
		String userId = request.getParameter("user_id");
		String userName = request.getParameter("user_name");
		
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String price = request.getParameter("price");
		
		String mediList = request.getParameter("medilist");
		String surgeryYN = request.getParameter("surgery_yn");
		String surgeryName = request.getParameter("surgery_name");
		String flightYN = request.getParameter("flight_yn");
		
		if(mediList.equals("")) {
			mediList = "없음";
		} 
		if(surgeryName.isEmpty()) { // 두 방법 다 빈 문자열인지 체크한다.
			surgeryName = "없음";
		}
					
		// (1) 회원id, 이름으로 MEMBER 테이블에서 select 해서 USER_NO를 가져온다. 없으면 여기서 종료하고 ALERT 띄우기.
		String userNo = new MemberService().findUserNo2(userId, userName);
		
		
		
		
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
		
		
		if(userNo == null || userNo.isEmpty()) {
			session.setAttribute("alertMsg", "회원 정보를 잘못입력하셨습니다. \\n회원ID와 회원이름을 확인해 주세요."); // 자바에서 문자열 내에서 \는 특수 문자(escape character)로 동작하므로, 이를 문자 그대로 사용하려면 \\
            
			request.setAttribute("msg", "회원 정보를 찾을 수 없습니다.<br>회원 정보를 잘못입력하셨거나 Member 테이블에 존재하지 않는 사원입니다.<br>건강검진 예약은 회원만 가능합니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
			return;
		} 
		
		
		
		// (2, 3) CARE_APP, CHECK_LIST 테이블에 INSERT
		
		int result = new ReservationService().insertCheckupAppN(userNo, time, date, price);
		int result2 = new ReservationService().insertChecklist(userNo, mediList, surgeryYN, surgeryName, flightYN, time, date, price); // 검진 예약번호는 time, date, price, userNo로 select(서브쿼리)하기.
		
		//System.out.println("result : " + result);
		//System.out.println("result2 : " + result2);
		
		
		
		
	
		// 2. 응답
        if(result == 1 && result2 == 1) { 
        	// insert 성공
    		// 응답페이지 : 관리자 건강검진예약 관리 페이지 (/vita/views/admin/manageCheckupApp.jsp)
    		// 응답데이터 : "성공적으로 추가되었습니다." alert 메세지
            session.setAttribute("alertMsg", "성공적으로 추가되었습니다.");
            response.sendRedirect(request.getContextPath() + "/manageCH.admin");

            
        }else { 
        	// insert 실패
    		// 응답페이지 : 에러페이지 (/vita/views/common/errorPage.jsp)
    		// 응답데이터 : "추가에 실패하였습니다." alert 메세지
            session.setAttribute("alertMsg", "추가에 실패하였습니다.");
			request.setAttribute("msg", "일반건강검진 예약에 실패하였습니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
         
		
        }
				
        //System.out.println("sendRedirect()는 즉시 메소드 실행을 종료하는 것이 아니다.");
     
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
