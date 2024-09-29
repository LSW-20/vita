package com.br.vita.notice.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.vita.notice.model.service.NoticeService;

/**
 * Servlet implementation class NoticelDetailController
 */
@WebServlet("/noticeDetail.admin")
public class NoticeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int NoticeNo = Integer.parseInt(request.getParameter("no"));
		
		Map<String, Object> nmap = new NoticeService().selectNoticeByNo(NoticeNo);
		
		if(nmap.get("n") == null) {
			// 응답페이지 : 에러페이지
			request.setAttribute("nmsg", "존재하지 않는 게시글이거나 삭제된 게시글입니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}else {
			// 응답페이지 : 상세페이지 (/views/board/boardDetail.jsp)
			// 응답데이터 : 조회할 게시글 데이터, 첨부파일 데이터 (db로부터 조회)
			request.setAttribute("nmap", nmap);
			request.getRequestDispatcher("/views/notice/noticeDetail.jsp").forward(request, response);		
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
