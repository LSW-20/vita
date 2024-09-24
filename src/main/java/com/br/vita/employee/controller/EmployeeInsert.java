package com.br.vita.employee.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.vita.employee.model.service.EmployeeService;

/**
 * Servlet implementation class EmployeeInsert
 */
@WebServlet("/addEMP.admin")
public class EmployeeInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeInsert() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1. 요청
		// 요청시 전달값으로 기업명, 사번, 사원명, 사원주민등록 번호가 온다.
		// 기업 추가는 기능이 따로 있으므로 Employee에만 insert 한다.
		
		request.setCharacterEncoding("UTF-8"); // post 요청이다
		
		HttpSession session = request.getSession(); // alert 띄우기용 session 선언. 

		
		
		String compName = request.getParameter("comp_name"); 
		String empName = request.getParameter("emp_name");
		String empSSN = request.getParameter("emp_ssn");
		String empNo = request.getParameter("emp_no");
		
		int result = new EmployeeService().insertEmployee(compName, empName, empSSN, empNo);
		
		
		
		
		// 2. 응답
        if(result == 1) { 
        	// insert 성공
    		// 응답페이지 : 관리자 건강검진 연계기업 관리 페이지(/vita/views/admin/manageCompany.jsp)
    		// 응답데이터 : "성공적으로 추가되었습니다." alert 메세지
            session.setAttribute("alertMsg", "성공적으로 추가되었습니다.");
            response.sendRedirect(request.getContextPath() + "/manageCOM.admin");
            
        }else { 
        	// insert 실패
    		// 응답페이지 : 관리자 건강검진 연계기업 관리 페이지(/vita/views/admin/manageCompany.jsp)
    		// 응답데이터 : "추가에 실패하였습니다." alert 메세지
            session.setAttribute("alertMsg", "추가에 실패하였습니다.");
            response.sendRedirect(request.getContextPath() + "/manageCOM.admin");
        }
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
