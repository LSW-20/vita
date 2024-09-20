package com.br.vita.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.vita.member.model.service.MemberService;
import com.br.vita.member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/update.me")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 정보 변경에 필요한 컬럼들을 불러올 수 있게 getParameter
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청
		request.setCharacterEncoding("utf-8");
		String userNo = request.getParameter("userNo");
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String userDate = request.getParameter("userDate");
		String gender = request.getParameter("gender");
		
		Member m = new Member(userNo, userId, userName, phone, email, userDate, gender);
		Member updateMem = new MemberService().updateMember(m);
		
		//응답
		if(updateMem == null) {
			//실패 시 에러 페이지
			request.setAttribute("msg","회원 정보 변경 실패");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		} else {//성공시 멤버 갱신
			//session loginUser갱신 
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", updateMem);
			
			//응답 페이지 : 갱신 된 마이페이지
			//응답 데이터 : alert
			 session.setAttribute("alertMsg", "변경 사항을 저장하였습니다.");
			 response.sendRedirect(request.getContextPath()+"/myinfo.me");
		}
	}//doGet

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
