package com.br.vita.employee.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.vita.company.model.service.CompanyService;
import com.br.vita.company.model.vo.Company;
import com.br.vita.employee.model.service.EmployeeService;
import com.br.vita.member.model.vo.Member;

/**
 * Servlet implementation class EmployeeSelect
 */
@WebServlet("/searchEMP.admin")
public class EmployeeSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeSelect() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1. 요청
		// 요청시 넘어오는 값 : '전체' 혹은 각 기업명(하나)이 요청시 넘어온다. 
		// [조회할 것들]
		// (1) COMPANY : 기업번호, 기업명
		// (2) EMPLOYEE : 사번, 사원명 (기업번호로)
		// (3) MEMBER : 회원번호, 회원아이디 (사원의 SSN으로 있는지 확인하고 없으면 '미가입' 상태다.)
		// 쿼리 하나로 조회하고 각각을 Map에 담고 반복문으로 List로 담아서 가져온다.
		

		String selectCom = request.getParameter("select_com");
		System.out.println("사용자가 선택한 기업명 : " + selectCom);
		
		List<Map<String, Object>> empList = new EmployeeService().selectEmployee(selectCom);
		System.out.println("db로부터 조회된 리스트 : " + empList);
		
		
		// (+) "관리자 건강검진 연계기업 관리 페이지"에서 항상 기업 select 결과를 list로 필요로 한다.
		List<Company> list = new CompanyService().companySelect();

		
		
		// 2. 응답
		// 응답페이지 : 관리자 건강검진 연계기업 관리 페이지(/vita/views/admin/manageCompany.jsp)
		// 응답데이터 : db로부터 조회된 데이터(응답페이지에서만 필요)
		
		// flag 값도 담아서 포워딩
		
		request.setAttribute("empList", empList);

		if(empList.isEmpty()) {
			request.setAttribute("threeType", false);
		} else {
			request.setAttribute("threeType", true);
		}
		
		
		// "관리자 건강검진 연계기업 관리 페이지" 자체가 select 기능이 있다. 고로 company에서 list도 가져와줘야 한다. 
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/views/admin/manageCompany.jsp").forward(request, response);
		
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
