package com.br.vita.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.vita.member.model.vo.Member;
import com.br.vita.notice.model.service.NoticeService;
import com.br.vita.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeWriteController
 */
@WebServlet("/insert.no")
public class NoticeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 1. 요청
		request.setCharacterEncoding("UTF-8");
		String noticeTitle = request.getParameter("title");
		String noticeContent = request.getParameter("content");
		
		HttpSession session = request.getSession();
		String userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		Notice n = new Notice();
		n.setNoticeTitle(noticeTitle);
		n.setNoticeContent(noticeContent);
		n.setUserNo(String.valueOf(userNo)); // 1 => "1"
		
		int result = new NoticeService().insertNotice(n);
		
		// 2. 응답
		if(result > 0) { // 성공
			// 응답페이지 : 다시 목록페이지 
			// 응답데이터 : "성공적으로 추가" alert 메세지
			session.setAttribute("alertMsg", "성공적으로 뉴스가 등록되었습니다.");
			response.sendRedirect(request.getContextPath() + "/list.no");
			
		}else { // 실패
			// 응답페이지 : 에러페이지
			// 응답데이터 : "실패" 메세지 
			request.setAttribute("msg", "뉴스 등록 실패");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}
	
	}

	private int integer(String userNo) {
		return 0;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
