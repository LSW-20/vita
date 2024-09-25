package com.br.vita.employee.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.vita.employee.model.service.EmployeeService;
import com.br.vita.employee.model.vo.Employee;

/**
 * Servlet implementation class EmployeeDelete
 */
@WebServlet("/deleteEMP.admin")
public class EmployeeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeDelete() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// 1. 요청
		// 요청시 ,로 합쳐진 문자열 하나로 employee에서 삭제할 주민등록번호들이 넘어온다.
		
		request.setCharacterEncoding("UTF-8"); // post 요청이다
		
		HttpSession session = request.getSession(); // alert 띄우기용 session 선언. 
		
		String[] ssnList = request.getParameter("ssn").split(",");

		//System.out.println("ssn 시작 -> " + Arrays.toString(ssnList) + "<- ssn 끝");
		int result = new EmployeeService().deleteEmployee(ssnList);
		//System.out.println("삭제된 행 수 : " + result);
		
		
		
		// 2. 응답
        if(result > 0) { 
        	// delete 성공
    		// 응답페이지 : 관리자 건강검진 연계기업 관리 페이지(/vita/views/admin/manageCompany.jsp)
    		// 응답데이터 : "성공적으로 삭제되었습니다." alert 메세지
            session.setAttribute("alertMsg", "성공적으로 삭제되었습니다.");
            response.sendRedirect(request.getContextPath() + "/manageCOM.admin");
            
        }else { 
        	// delete 실패
    		// 응답페이지 : 관리자 건강검진 연계기업 관리 페이지(/vita/views/admin/manageCompany.jsp)
    		// 응답데이터 : "삭제에 실패하였습니다." alert 메세지
            session.setAttribute("alertMsg", "삭제에 실패하였습니다.");
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
