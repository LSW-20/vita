package com.br.vita.employee.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.vita.employee.model.service.EmployeeService;
import com.br.vita.employee.model.vo.Employee;

/**
 * Servlet implementation class EmployeeUpdate
 */
@WebServlet("/updateEMP.admin")
public class EmployeeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeUpdate() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1. 요청
		// 기업명, 사번, 사원명, 사원 주민등록번호가 온다. 또 update 조건용으로 수정 전 '주민등록번호'가 온다.
		
		request.setCharacterEncoding("UTF-8"); // post 요청이다
		
		HttpSession session = request.getSession(); // alert 띄우기용 session 선언. 
		
		String beforeSSN = request.getParameter("before_ssn");
		String compName = request.getParameter("select_com");
		String empNo = request.getParameter("emp_no");
		String empName = request.getParameter("emp_name");
		String empSSN = request.getParameter("emp_ssn");

		Employee e = new Employee();
		e.setEmpName(empName);
		e.setEmpNo(empNo);
		e.setSsn(empSSN);
		
		int result = new EmployeeService().updateEmployee(e, compName, beforeSSN);
		
		
		
		
		// 2. 응답
        if(result == 1) { 
        	// update 성공
    		// 응답페이지 : 관리자 건강검진 연계기업 관리 페이지(/vita/views/admin/manageCompany.jsp)
    		// 응답데이터 : "성공적으로 수정되었습니다." alert 메세지
            session.setAttribute("alertMsg", "성공적으로 수정되었습니다.");
            response.sendRedirect(request.getContextPath() + "/manageCOM.admin");
            
        }else { 
        	// update 실패
    		// 응답페이지 : 관리자 건강검진 연계기업 관리 페이지(/vita/views/admin/manageCompany.jsp)
    		// 응답데이터 : "수정에 실패하였습니다." alert 메세지
            session.setAttribute("alertMsg", "수정에 실패하였습니다.");
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
