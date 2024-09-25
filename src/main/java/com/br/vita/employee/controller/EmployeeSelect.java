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
		// (2) EMPLOYEE : 사번, 사원명, 주민등록번호
		// 쿼리 하나로 조회하고 각각을 Map에 담고 반복문으로 List로 담아서 가져온다.
		

		String selectCom = request.getParameter("select_com");
		System.out.println("사용자가 선택한 기업명 : " + selectCom);
		
		List<Map<String, Object>> empList = new EmployeeService().selectEmployee(selectCom);
		System.out.println("db로부터 조회된 리스트 : " + empList);
		
		
		// (+) "관리자 건강검진 연계기업 관리 페이지"에서 전체 기업 목록 select 결과를 list로 필요로 한다.
		List<Company> list = new CompanyService().companySelect();

		
		
		// 2. 응답
		// 응답페이지 : 관리자 건강검진 연계기업 관리 페이지(/vita/views/admin/manageCompany.jsp)
		// 응답데이터 : db로부터 조회된 데이터(응답페이지에서만 필요)
		

		request.setAttribute("empList", empList);
		request.setAttribute("selectCom", selectCom); // 화면에 '~기업' 검색결과로 사용자가 선택한 값에 따라 다르게 보여지게끔 한다.

		// flag 값(threeType)도 담아서 포워딩. 이 값에 따라 검색전/검색 후 결과없는 경우/검색 후 결과있는 경우로 다르게 보여진다.
		if(empList.isEmpty()) { 
			request.setAttribute("threeType", false);
		} else {
			request.setAttribute("threeType", true);
		}
		
		
		// (+) "관리자 건강검진 연계기업 관리 페이지" 자체가 select 기능이 있다. 고로 전체 기업 목록 select 결과를 list로 가져다 줘야 한다.
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
