package com.br.vita.doctor.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.vita.doctor.model.service.DoctorService;

/**
 * Servlet implementation class DoctorDelete
 */
@WebServlet("/deleteD.admin")
public class DoctorDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorDelete() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1. 요청
		// 삭제할 사번과 주민등록번호를 받아서 (1) doctor 테이블에서 삭제, (2) member 테이블에서 삭제
		
        // request.setCharacterEncoding("UTF-8"); // location.href는 get방식이라 필요 없다.
        
    	HttpSession session = request.getSession(); // alert 띄우기용 session 선언.
		
    	
    	// 한 서비스에서 두 dao를 호출해서 (1), (2)를 같이 한다. 
    	String ssn = request.getParameter("ssn");
    	System.out.println("ssn : " + ssn);
    	String[] ssnArray = ssn.split(","); // split 메소드는 인자값으로 문자열을 받기 때문에 홑따옴표 xxx.
    	System.out.println("ssnArray : " + Arrays.toString(ssnArray));
    	
    	int result = new DoctorService().deleteDoctor(ssnArray);
    			
    	
		// 2. 응답
        if(result > 0) { 
        	// delete 성공
    		// 응답페이지 : 관리자 의료진 계정 관리 페이지(/vita/views/admin/manageDoctor.jsp)
    		// 응답데이터 : "성공적으로 제거되었습니다." alert 메세지
            session.setAttribute("alertMsg", "성공적으로 제거되었습니다.");
            response.sendRedirect(request.getContextPath() + "/manageD.admin");
            
        }else { 
        	// delete 실패
    		// 응답페이지 : 관리자 의료진 계정 관리 페이지(/vita/views/admin/manageDoctor.jsp)
    		// 응답데이터 : "제거에 실패하였습니다." alert 메세지
            session.setAttribute("alertMsg", "제거에 실패하였습니다.");
            response.sendRedirect(request.getContextPath() + "/manageD.admin");
        }
    	
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
