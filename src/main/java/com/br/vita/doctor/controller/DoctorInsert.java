package com.br.vita.doctor.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.vita.doctor.model.service.DoctorService;
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
        
        if(request.getParameter("doctor_pass1") == request.getParameter("doctor_pass2")) {
        	
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
        	
        	int result = new DoctorService().doctorInsert(m);
        	
        	
        	
        	
        	
        	
        	
            // 2. 응답
            // 추가, 수정, 삭제에 alert주자
            if(result > 0) { 
                
            }else { 
               
            }
        	
        	
        }else {
        	// alert 띄우고 비밀번호 다르다고 메세지 주기.
        }
		
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
