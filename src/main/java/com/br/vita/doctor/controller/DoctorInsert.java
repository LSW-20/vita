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
 * Servlet implementation class DoctorInsert
 */
@WebServlet("/addD.admin")
public class DoctorInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorInsert() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1. 요청
		// (1) member 테이블에 먼저 insert하고, (2) 회원번호를 받아서 doctor 테이블에 insert하고, (3) 사번을 받아서 schedule 테이블에 insert 한다.
		// 그러나 그 전에 비밀번호와 비밀번호 확인이 같은지 먼저 판단한다.
		
        request.setCharacterEncoding("UTF-8"); // post 요청이다
        
    	HttpSession session = request.getSession(); // alert 띄우기용 session 선언.
    	
        
        if(request.getParameter("doctor_pass1").equals(request.getParameter("doctor_pass2"))) {
        	
        	//(1) member 테이블에 먼저 insert
        	Member m = new Member();
        	m.setUserId(request.getParameter("doctor_id"));
        	m.setUserPwd(request.getParameter("doctor_pass1"));
        	m.setUserName(request.getParameter("doctor_name"));
        	m.setPhone(request.getParameter("doctor_phone"));
        	m.setEmail(request.getParameter("doctor_email"));
        	m.setAddress(request.getParameter("doctor_address"));
        	m.setUserSSN(request.getParameter("doctor_ssn"));
        	m.setUserDate(request.getParameter("doctor_ssn").substring(0, 6));
        	
        	String gender = "";
        	String number = request.getParameter("doctor_ssn").substring(7, 8);
        	if(Integer.parseInt(number) == 1 || Integer.parseInt(number) == 3) {
        		gender = "M";
        	}else {
        		gender = "F";
        	}
        	m.setGender(gender); 
        	
        	System.out.println(m.getUserPwd());
        	
        	int result = new DoctorService().insertToMember(m);
        	
        	
        	// (2) 회원번호를 받아서 doctor 테이블에 insert
        	Doctor d = new Doctor();
        	d.setDoctorName(request.getParameter("doctor_name"));
        	d.setLicenceNo(request.getParameter("licence_no"));
        	d.setDeptName(request.getParameter("dept"));
        	
        	System.out.println(d);
        	
        	int result2 = new DoctorService().insertToDoctor(d, m);
        	
        	
        	// (3) 사번을 받아서 schedule 테이블에 insert
        	int result3 = new DoctorService().insertToSchedule(d); // 10이어야 한다.
        	System.out.println(result3);

        	
        	
            // 2. 응답
            if(result == 1 && result2 == 1 && result3 == 10) { 
            	// insert 성공
        		// 응답페이지 : 관리자 의료진 계정 관리 페이지(/vita/views/admin/manageDoctor.jsp)
        		// 응답데이터 : "성공적으로 추가되었습니다." alert 메세지
                session.setAttribute("alertMsg", "성공적으로 추가되었습니다.");
                response.sendRedirect(request.getContextPath() + "/manageD.admin");
                
            }else { 
            	// insert 실패
        		// 응답페이지 : 관리자 의료진 계정 관리 페이지(/vita/views/admin/manageDoctor.jsp)
        		// 응답데이터 : "추가에 실패하였습니다." alert 메세지
                session.setAttribute("alertMsg", "추가에 실패하였습니다.");
                response.sendRedirect(request.getContextPath() + "/manageD.admin");
            }
        	
        	
            
            
        }else {
        	// 비밀번호와 비밀번호 확인이 일치하지 않음.
        	System.out.println("비번다름");
        	System.out.println(request.getParameter("doctor_pass1"));
        	System.out.println(request.getParameter("doctor_pass2"));
        	

        	session.setAttribute("alertMsg","비밀번호가 다릅니다.");
			response.sendRedirect(request.getContextPath()+"/manageD.admin");
        }
        

        	
 
        	
        	

		
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
