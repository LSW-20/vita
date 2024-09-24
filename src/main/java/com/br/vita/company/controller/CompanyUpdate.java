package com.br.vita.company.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.vita.company.model.service.CompanyService;
import com.br.vita.member.model.vo.Member;

/**
 * Servlet implementation class CompanyUpdate
 */
@WebServlet("/updateCOM.admin")
public class CompanyUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanyUpdate() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1. 요청
		
		request.setCharacterEncoding("UTF-8"); // post 요청이다
		
		HttpSession session = request.getSession(); // alert 띄우기용 session 선언. + 현재 로그인한 관리자 번호.
		
		String compNo = request.getParameter("comp_no");
		String compName = request.getParameter("comp_name");
		String originCompNo = request.getParameter("orgin_comp_no"); // update 조건용
		String adminNo = ((Member)session.getAttribute("loginUser")).getUserNo(); // 수정한 관리자 번호
		
		System.out.println("기업번호 : " + compNo + ", 기업명 : " + compName + ", 원래 기업 번호 : " + originCompNo + ", 관리자 번호 : " + adminNo); // 확인용
		
		int result = new CompanyService().companyUpdate(compNo, compName, originCompNo, adminNo);
		
		
		// 2. 응답
        if(result == 1) { 
        	// insert 성공
    		// 응답페이지 : 관리자 건강검진 연계기업 관리 페이지(/vita/views/admin/manageCompany.jsp)
    		// 응답데이터 : "성공적으로 수정되었습니다." alert 메세지
            session.setAttribute("alertMsg", "성공적으로 수정되었습니다.");
            response.sendRedirect(request.getContextPath() + "/manageCOM.admin");
            
        }else { 
        	// insert 실패
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
