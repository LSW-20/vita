package com.br.vita.doctor.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.vita.doctor.model.service.DoctorService;
import com.br.vita.doctor.model.vo.Doctor;
import com.br.vita.member.model.vo.Member;

/**
 * Servlet implementation class DoctorUpdate
 */
@WebServlet("/updateD.admin")
public class DoctorUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorUpdate() {
        super();
    }
    
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1. 요청
		// 의사 계정 수정 요청시 넘어온 값들로 (1)DOCTOR 테이블을 UPDATE하고, (2)MEMBER 테이블 UPDATE한다.
		
        request.setCharacterEncoding("UTF-8"); // post 요청이다
        
    	HttpSession session = request.getSession(); // alert 띄우기용 session 선언.
		
    	
    	//(1)DOCTOR 테이블 UPDATE
    	Doctor d = new Doctor();
    	d.setDoctorName(request.getParameter("doctor_name"));
    	d.setLicenceNo(request.getParameter("licence_no"));
    	d.setDeptName(request.getParameter("dept"));
    	
    	System.out.println(d);
    	
    	int result = new DoctorService().updateDoctor(d); 

    	
    	//(2)MEMBER 테이블 UPDATE
    	Member m = new Member();
    	
    	
    	int result2 = 0;
    	
    	
    	// 2. 응답
        if(result == 1 && result2 == 1) { 
        	// update 성공
    		// 응답페이지 : 관리자 의료진 계정 관리 페이지(/vita/views/admin/manageDoctor.jsp)
    		// 응답데이터 : "성공적으로 수정되었습니다." alert 메세지
            session.setAttribute("alertMsg", "성공적으로 수정되었습니다.");
            response.sendRedirect(request.getContextPath() + "/manageD.admin");
            
        }else { 
        	// update 실패
    		// 응답페이지 : 관리자 의료진 계정 관리 페이지(/vita/views/admin/manageDoctor.jsp)
    		// 응답데이터 : "수정에 실패하였습니다." alert 메세지
            session.setAttribute("alertMsg", "수정에 실패하였습니다.");
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
