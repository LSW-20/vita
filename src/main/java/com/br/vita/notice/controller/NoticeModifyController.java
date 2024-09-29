package com.br.vita.notice.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.vita.notice.model.service.NoticeService;
import com.br.vita.notice.model.vo.Notice;

/**
 * Servlet implementation class NewModifyController
 */
@WebServlet("/noticeModify.admin")
public class NoticeModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeModifyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int noticeNo = Integer.parseInt(request.getParameter("no"));
		
		NoticeService nService = new NoticeService();
		Map<String, Object> nmap = nService.selectNoticeByNo(noticeNo);
		
		// 응답페이지 : 수정페이지 (/views/board/boardModify.jsp)
		// 응답데이터 : 카테고리목록, 게시글데이터, 첨부파일데이터 
		
		if(nmap.get("n") == null) {
			request.setAttribute("msg", "존재하지 않는 게시글이거나 삭제된 게시글입니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}else {
			request.setAttribute("nmap", nmap);
			request.getRequestDispatcher("/views/notice/noticeModify.jsp").forward(request, response);
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
